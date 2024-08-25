-- Database for sales data
CREATE DATABASE Database_ECommerce
  COLLATE Latin1_General_100_BIN2_UTF8;
GO;

Use Database_ECommerce;
GO;

-- External data is in the Files container in the data lake
CREATE EXTERNAL DATA SOURCE ecommerce_data WITH (
    LOCATION = 'https://datalakecloud.dfs.core.windows.net/projetcloud/cleaned_data/'
);
GO;

CREATE EXTERNAL DATA SOURCE ecommerce_regression WITH (
    LOCATION = 'https://datalakecloud.dfs.core.windows.net/projetcloud/linear_regression/'
);
GO;

-- Format for table files
CREATE EXTERNAL FILE FORMAT ParquetFormat
    WITH (
            FORMAT_TYPE = PARQUET
        );
GO;