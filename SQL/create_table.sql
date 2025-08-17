CREATE TABLE dbo.nbu_rates(
    id INT IDENTITY(1,1) PRIMARY KEY,
    code INT,
    currency_name NVARCHAR(100),
    rate DECIMAL(18,4),
    currency NVARCHAR(10),
    exchange_date DATE,
    ingestion_date DATETIMEOFFSET
);
CREATE TABLE dbo.fuel_data_avg (
    region NVARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    a_95_plus FLOAT NULL,
    a_95 FLOAT NULL,
    a_92 FLOAT NULL,
    diesel FLOAT NULL,
    gas FLOAT NULL,
    ingestion_date DATETIME2 NOT NULL,
    CONSTRAINT PK_fuel_region_date PRIMARY KEY (region, date)
);

CREATE TABLE dbo.dim_region (
    region_id INT IDENTITY(1,1) PRIMARY KEY,
    region_name NVARCHAR(255) UNIQUE
);


CREATE TABLE dbo.dim_brand (
    brand_id INT IDENTITY(1,1) PRIMARY KEY,
    brand_name NVARCHAR(255) UNIQUE
);


CREATE TABLE dbo.dim_fuel_type (
    fuel_type_id INT IDENTITY(1,1) PRIMARY KEY,
    fuel_type_name NVARCHAR(50) UNIQUE
);

CREATE TABLE dbo.fact_fuel_prices (
    fact_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    region_id INT NOT NULL FOREIGN KEY REFERENCES dbo.dim_region(region_id),
    brand_id INT NOT NULL FOREIGN KEY REFERENCES dbo.dim_brand(brand_id),
    fuel_type_id INT NOT NULL FOREIGN KEY REFERENCES dbo.dim_fuel_type(fuel_type_id),
    date DATE NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    price_usd DECIMAL(10, 2),
    price_eur DECIMAL(10, 2),
    year INT,
    month INT,
    day INT,
    UNIQUE(region_id, brand_id, fuel_type_id, date)
);

CREATE TABLE dbo.dim_station_locations (
    id INT IDENTITY(1,1) PRIMARY KEY,
    station_name NVARCHAR(255),
    brand NVARCHAR(100),
    city NVARCHAR(100),
    region NVARCHAR(100),
    address NVARCHAR(255),
    longitude FLOAT,
	latitude FLOAT,
    services NVARCHAR(255),
    work_time NVARCHAR(100),
    fuel_types NVARCHAR(255),
    ev_charging NVARCHAR(100),
    car_wash NVARCHAR(100),
    cafe NVARCHAR(100),
    shop NVARCHAR(100),
    ingestion_date DATETIME
    );
