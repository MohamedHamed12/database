import pandas as pd

# Create or load your Logs DataFrame (assuming you have a 'log_id' column)
# Example data:
data = {'log_id': [1, 2, 3, 7, 8, 10]}
logs_df = pd.DataFrame(data)

# Calculate the index column
logs_df['index_column'] = logs_df.groupby(logs_df['log_id'] - logs_df.index)['log_id'].transform('min')
g = logs_df.groupby('index_column')
logs_df['count'] = g['log_id'].transform('count')
logs_df['sum']=logs_df['count'] + logs_df['index_column']-1
print(logs_df)
df=logs_df.rename(columns={'sum':'sum'})
print(df[['sum']])
logs_df = logs_df.drop_duplicates(subset=['sum'], keep='first')
print(logs_df)
