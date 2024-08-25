# Utiliser une image de base avec Java et Python pour Spark
FROM openjdk:8-jdk-slim
 
# Installer Spark
ENV SPARK_VERSION=3.1.2
RUN apt-get update && apt-get install -y curl wget python3 python3-pip \
&& wget -qO- https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop3.2.tgz | tar xvz -C /opt/ \
&& mv /opt/spark-$SPARK_VERSION-bin-hadoop3.2 /opt/spark \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*
 
# Télécharger et installer le pilote JDBC MySQL
ENV MYSQL_CONNECTOR_VERSION=8.0.26
RUN wget -qO /opt/mysql-connector-java-${MYSQL_CONNECTOR_VERSION}.jar \
https://repo1.maven.org/maven2/mysql/mysql-connector-java/${MYSQL_CONNECTOR_VERSION}/mysql-connector-java-${MYSQL_CONNECTOR_VERSION}.jar
 
# Définir les variables d'environnement pour Spark
ENV SPARK_HOME=/opt/spark
ENV PATH=$SPARK_HOME/bin:$PATH
ENV SPARK_CLASSPATH=/opt/mysql-connector-java-${MYSQL_CONNECTOR_VERSION}.jar
 
# Copier les fichiers de l'application
COPY . /app

# Installer les dépendances Python
RUN pip3 install -r /app/requirements.txt
 
# Définir le point d'entrée
CMD ["python3", "/app/linear_regression.py"]
