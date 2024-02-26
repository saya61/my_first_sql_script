CREATE TABLE example_table (
    id INT PRIMARY KEY,
    small_integer SMALLINT,
    large_integer BIGINT,
		birth_date DATE,
    decimal_number DECIMAL(10, 2),
    floating_point FLOAT,
    double_precision DOUBLE,
    fixed_length_string CHAR(10),
    variable_length_string VARCHAR(255),
    long_text TEXT,
    binary_data BLOB,
    long_binary_data LONGBLOB,
		json_data JSON
);