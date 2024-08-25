# %%
from pyspark.sql import SparkSession, Row
from pyspark.sql.types import StructType, StructField, StringType, IntegerType, TimestampType
import pyspark.sql.functions as F

from pyspark.ml.feature import VectorAssembler
from pyspark.ml.regression import LinearRegression

import os


# %%
# Charger les informations d'identification AWS à partir du fichier de configuration
with open('/app/.aws/credentials') as f:
    for line in f:
        if line.startswith('aws_access_key_id'):
            aws_access_key_id = line.split('=')[1].strip()
        elif line.startswith('aws_secret_access_key'):
            aws_secret_access_key = line.split('=')[1].strip()

# Définir les variables d'environnement AWS
os.environ['AWS_ACCESS_KEY_ID'] = aws_access_key_id
os.environ['AWS_SECRET_ACCESS_KEY'] = aws_secret_access_key


# %%
import boto3
import pandas as pd
from io import StringIO

import matplotlib.pyplot as plt

# %% [markdown]
# # Initialisation de Spark

# %%
# Initialisation de la session Spark
spark = SparkSession.builder \
    .appName("Projet de Fin d'Etude") \
    .config("spark.jars.packages", "org.apache.spark:spark-hadoop-cloud_2.12:3.3.0") \
    .config("spark.hadoop.fs.s3a.impl", "org.apache.hadoop.fs.s3a.S3AFileSystem") \
    .config("spark.hadoop.fs.s3a.access.key", aws_access_key_id) \
    .config("spark.hadoop.fs.s3a.secret.key", aws_secret_access_key) \
    .config("spark.jars", "/opt/mysql-connector-java-8.0.26.jar") \
    .config("spark.hadoop.fs.s3a.path.style.access", True) \
    .config("spark.hadoop.fs.s3a.fast.upload", True) \
    .config("spark.hadoop.fs.s3a.fast.upload.buffer", "bytebuffer") \
    .config("spark.driver.host", "localhost") \
    .config("spark.driver.port", "9000") \
    .master("local[*]") \
    .getOrCreate()

# %%
sc = spark.sparkContext

# %% [markdown]
# # Chargement des données

# %%
# Informations de connexion à RDS
jdbc_url = "jdbc:mysql://database-grp6.chcmvnn5gnpv.us-east-1.rds.amazonaws.com:3306/cleaned_data?serverTimezone=UTC"
db_properties = {
    "user": "admin",
    "password": "xxx",
    "driver": "com.mysql.jdbc.Driver"
}

# %%
# Liste des noms des tables RDS
table_names = [
    "orders",
    "order_items",
    "order_payments",
    "order_reviews",
    "products",
    "products_translated",
    "geolocation",
    "states_name",
    "customers",
    "sellers"
]

# %%
# Créer un dictionnaire de DataFrames
dataframes = {table_name: spark.read.jdbc(url=jdbc_url, table=table_name, properties=db_properties) for table_name in table_names}
dataframes

# %% [markdown]
# # Analyse des données

# %%
# Création d'un Dataframe global
sales = dataframes["order_items"].alias("i") \
    .join(dataframes["products"].alias("p"), F.col("i.product_id") == F.col("p.product_id"), "left") \
    .join(dataframes["orders"].alias("o"), F.col("i.order_id") == F.col("o.order_id"), "left") \
    .join(dataframes["customers"].alias("c"), F.col("o.customer_id") == F.col("c.customer_id"), "left") \
    .join(dataframes["states_name"].alias("s"), F.col("c.customer_state") == F.col("s.geolocation_state"), "left") \
    .withColumn("order_purchase_year", F.year(F.col("o.order_purchase_timestamp"))) \
    .withColumn("order_purchase_month", F.month(F.col("o.order_purchase_timestamp"))) \
    .withColumn("order_purchase_day", F.dayofmonth(F.col("o.order_purchase_timestamp")))


sales = sales.select("i.order_id", 
                     "i.product_id",
                     "o.customer_id",
                     "i.seller_id", 
                     "i.order_item_id", 
                     "p.product_category_name", 
                     "i.price", 
                     "i.freight_value", 
                     "i.total_items_value", 
                     "i.total_freight_value", 
                     "i.total_order_value", 
                     "p.product_description_length",
                     "p.product_photos_qty",
                     "o.order_status",
                     "o.order_purchase_timestamp",
                     "order_purchase_year",
                     "order_purchase_month",
                     "order_purchase_day",
                     "c.customer_city",
                     "s.state_name")

sales.printSchema()

# %% [markdown]
# # Régression Linéaire

# %%
# Regression linéaire : prévision des prix
schema = StructType([
    StructField("category", StringType(), False),
    StructField("sales", IntegerType(), False),
    StructField("year", IntegerType(), False),
    StructField("month", IntegerType(), False),
    StructField("date", TimestampType(), True),
])

price_predictions = spark.createDataFrame(sc.emptyRDD(), schema)

price_predictions.show()

# %%
# Récupération de toutes les catégories
categories = sales.select(F.col("product_category_name").alias("category")).distinct().orderBy(F.col("product_category_name").asc()).collect()

# Sélectionner les colonnes pertinentes pour la régression linéaire
sales_reg = sales.select(
    F.col("order_purchase_year").alias("year"),
    F.col("order_purchase_month").alias("month"),
    F.col("product_category_name").alias("category"),
    F.col("total_order_value").alias("sales")
)

# %%
# Fonction permettant de réaliser la Régression linéaire
def regression_lineaire(df_train, future_date, category) :
    df_train = df_train.groupBy("year", "month") \
        .agg(F.sum("sales").alias("sales"))
    
    # Assembler les fonctionnalités
    assembler = VectorAssembler(
        inputCols=["year", "month"],
        outputCol="features"
    )

    # Transformer les données en utilisant l'assembler
    sales_data = assembler.transform(df_train)
    sales_data = sales_data.select("features", "sales")

    # Créer le modèle de régression linéaire
    lr = LinearRegression(featuresCol="features", labelCol="sales")

    # Ajuster le modèle aux données d'entraînement
    lr_model = lr.fit(sales_data)

    # Transformer les données en utilisant l'assembler
    df_predicted = spark.createDataFrame(future_date, ["year", "month"])
    df_predicted = assembler.transform(df_predicted).select("features")

    # Prédire les prix pour les dates futures
    df_predicted = lr_model.transform(df_predicted)

    # Assemblage des DataFrames train et predicted en RDD
    rdd = sc.parallelize(sales_data.union(df_predicted).rdd.collect()) \
        .map(lambda row: Row(features=row.features.toArray().tolist(), sales=row.sales)) \
        .map(lambda x: (int(x.features[0]), int(x.features[1]), x.sales))
    
    # Créer un DataFrame à partir de l'RDD avec les noms de colonnes appropriés
    df = rdd.toDF(["year", "month", "sales"]) \
        .withColumn("category", F.lit(category)) \
        .withColumn("date", F.to_date(F.concat(F.col("year"), F.lit("-"), F.col("month"), F.lit("-01")))) \
        .select("category", "sales", "year", "month", "date")

    return df

# %%
# Création d'une liste de listes contenant les dates à prédire
future_date = [[2018,9], [2018, 10], [2018, 11], [2018, 12]] + \
    [[year, month] for year in range(2019, 2022) for month in range(1, 13)]


# Prédictions des prix pour chaque catégorie
for c in categories :
    category = c.category

    df_train = sales_reg.filter(F.col("category") == category)
    df = regression_lineaire(df_train, future_date, category)
    price_predictions = price_predictions.union(df)


price_predictions.show()

# %%
n = 10

# Récupération de la plus grande date de prédiction
max_date_row = price_predictions.agg(F.max("date")).head()
max_date = max_date_row[0]

# Récupération des n catégories ayant les meilleures ventes
best_categories_predicted = price_predictions.select("category") \
    .filter(F.col("date") == max_date) \
    .orderBy(F.col("sales").desc()) \
    .head(n)

# Mise sous forme de liste
best_categories_predicted = [c.category for c in best_categories_predicted]
best_categories_predicted

# %%
# Création du dataframe avec uniquement les n meilleures catégories
price_predictions_top_category = price_predictions \
    .filter(F.col("category").isin(best_categories_predicted))
    
price_predictions_top_category.show()

# %% [markdown]
# # Chargement des Dataframes en CSV

# %%
# Ajout des Dataframes de prédiction de prix au dictionnaire de Dataframes
dataframes["price_predictions"] = price_predictions
dataframes["price_predictions_top_category"] = price_predictions_top_category

# %%
# Configurer la connexion à S3
s3 = boto3.client('s3')

# Enregistrer les DataFrame en tant que CSV sur S3
for table_name, df in dataframes.items() :
    print(f"Chargement du Dataframe {table_name}")

    for col_name, col_type in df.dtypes :
        if col_type == "timestamp" :
            df = df.withColumn(col_name, F.col(col_name).cast("string"))

    # Transformer le Dataframe spark en Dataframe Pandas
    pdf = df.toPandas()

    # Créer une chaîne CSV à partir du DataFrame Pandas
    csv_buffer = StringIO()
    pdf.to_csv(csv_buffer, index=False)

    # Spécifier le chemin S3
    s3_path = f"output_data/{table_name}.csv"

    # Écrire le fichier CSV sur S3
    s3.put_object(Bucket='grp6-pfe-data-engineering', Key=s3_path, Body=csv_buffer.getvalue())

