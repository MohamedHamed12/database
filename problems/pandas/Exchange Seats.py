import pandas as pd

# Example DataFrame
data = {'id': [1, 2, 3, 4, 5],
        'student': ['Alice', 'Bob', 'Charlie', 'David', 'Eve']}

df = pd.DataFrame(data)

# Calculate the seat_counts
seat_counts = len(df)

# Apply the CASE statement logic using Pandas
df['id'] = df.apply(lambda row: 
    row['id'] + 1 if row['id'] % 2 != 0 and seat_counts != row['id'] 
    else row['id'] if row['id'] % 2 != 0 and seat_counts == row['id']
    else row['id'] - 1, axis=1)

# Sort the DataFrame by 'id' in ascending order
df = df.sort_values(by='id', ascending=True)

# Display the result
print(df)
pr
