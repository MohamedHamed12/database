import pandas as pd
import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect("/home/mohamed/documents/programming/database/test.db")

# Read the Customer and Product tables into pandas DataFrames
customer_df = pd.read_sql_query("SELECT * FROM Customer", conn)
product_df = pd.read_sql_query("SELECT * FROM Product", conn)

# Get the list of product_keys in the Product DataFrame
product_keys = product_df['product_key'].tolist()

# Filter the Customer DataFrame to only include rows with product_keys in the Product DataFrame
filtered_customer_df = customer_df[customer_df['product_key'].isin(product_keys)]

# Group by customer_id and count the distinct product_keys
result = filtered_customer_df.groupby('customer_id')['product_key'].nunique()

# Filter the results where the count matches the count of distinct product_keys in the Product DataFrame
final_result = result[result == product_df['product_key'].nunique()]

# Print the customer_id values that meet the specified condition
print(final_result.reset_index()['customer_id'])

# Close the database connection
conn.close()
