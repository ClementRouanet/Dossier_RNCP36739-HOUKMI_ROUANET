USE Database_ECommerce;

CREATE EXTERNAL TABLE customers (
    customer_id VARCHAR(256),
    customer_unique_id VARCHAR(256),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(256),
    customer_state VARCHAR(256)
)
WITH (
    LOCATION = 'customers/*.parquet',
    DATA_SOURCE = ecommerce_data,
    FILE_FORMAT = ParquetFormat
);


CREATE EXTERNAL TABLE sellers (
    seller_id VARCHAR(256),
    seller_zip_code_prefix INT,
    seller_city VARCHAR(256),
    seller_state VARCHAR(256)
)
WITH (
    LOCATION = 'sellers/*.parquet',
    DATA_SOURCE = ecommerce_data,
    FILE_FORMAT = ParquetFormat
);


CREATE EXTERNAL TABLE orders (
    order_id VARCHAR(256),
    customer_id VARCHAR(256),
    order_status VARCHAR(256),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
)
WITH (
    LOCATION = 'orders/*.parquet',
    DATA_SOURCE = ecommerce_data,
    FILE_FORMAT = ParquetFormat
);


CREATE EXTERNAL TABLE order_items
(
	order_id VARCHAR(256),
	order_item_id INT,
	product_id VARCHAR(256),
	seller_id VARCHAR(256),
	shipping_limit_date DATETIME,
	price FLOAT,
	freight_value FLOAT,
	total_items_value FLOAT,
	total_freight_value FLOAT,
	total_order_value FLOAT
)
WITH
(
	LOCATION = 'order_items/*.parquet',
	DATA_SOURCE = ecommerce_data,
	FILE_FORMAT = ParquetFormat
)


CREATE EXTERNAL TABLE order_payments (
    order_id VARCHAR(256),
    payment_sequential INT,
    payment_type VARCHAR(256),
    payment_installments INT,
    payment_value FLOAT
)
WITH (
    LOCATION = 'order_payments/*.parquet',
    DATA_SOURCE = ecommerce_data,
    FILE_FORMAT = ParquetFormat
);


CREATE EXTERNAL TABLE order_reviews (
    review_id VARCHAR(256),
    order_id VARCHAR(256),
    review_score INT,
    review_comment_title VARCHAR(256),
    review_comment_message VARCHAR(4000),
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME
)
WITH (
    LOCATION = 'order_reviews/*.parquet',
    DATA_SOURCE = ecommerce_data,
    FILE_FORMAT = ParquetFormat
);


CREATE EXTERNAL TABLE products (
    product_id VARCHAR(256),
    product_category_name VARCHAR(256),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
)
WITH (
    LOCATION = 'products/*.parquet',
    DATA_SOURCE = ecommerce_data,
    FILE_FORMAT = ParquetFormat
);


CREATE EXTERNAL TABLE products_translated (
    product_category_name VARCHAR(256),
    product_category_name_english VARCHAR(256)
)
WITH (
    LOCATION = 'products_translated/*.parquet',
    DATA_SOURCE = ecommerce_data,
    FILE_FORMAT = ParquetFormat
);


CREATE EXTERNAL TABLE geolocation (
    geolocation_zip_code_prefix INT,
    geolocation_lat FLOAT,
    geolocation_lng FLOAT,
    geolocation_city VARCHAR(256),
    geolocation_state VARCHAR(256)
)
WITH (
    LOCATION = 'geolocation/*.parquet',
    DATA_SOURCE = ecommerce_data,
    FILE_FORMAT = ParquetFormat
);


CREATE EXTERNAL TABLE states_name (
    geolocation_state VARCHAR(256),
    state_name VARCHAR(256)
)
WITH (
    LOCATION = 'states_name/*.parquet',
    DATA_SOURCE = ecommerce_data,
    FILE_FORMAT = ParquetFormat
);


CREATE EXTERNAL TABLE price_predictions (
    category VARCHAR(256),
    sales FLOAT,
    year INT,
    month INT,
    date DATETIME
)
WITH (
    LOCATION = 'price_predictions/*.parquet',
    DATA_SOURCE = ecommerce_regression,
    FILE_FORMAT = ParquetFormat
);


CREATE EXTERNAL TABLE price_predictions_top_categories (
    category VARCHAR(256),
    sales FLOAT,
    year INT,
    month INT,
    date DATETIME
)
WITH (
    LOCATION = 'price_predictions_top_category/*.parquet',
    DATA_SOURCE = ecommerce_regression,
    FILE_FORMAT = ParquetFormat
);