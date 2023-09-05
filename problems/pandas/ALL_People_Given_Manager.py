import pandas as pd

data = {
    'employee_id': [1, 2, 3, 4, 5, 6],
    'employee_name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank'],
    'manager_id': [None, 1, 2, 1, 2, 4]
}

df = pd.DataFrame(data)

result = pd.DataFrame(columns=['employee_id', 'employee_name', 'manager_id', 'depth'])

def find_depth(employee_id, depth):
    if pd.notna(employee_id):
        result.loc[len(result)] = [employee_id, df.loc[df['employee_id'] == employee_id, 'employee_name'].values[0], df.loc[df['employee_id'] == employee_id, 'manager_id'].values[0], depth]
        
        for subemployee in df.loc[df['manager_id'] == employee_id, 'employee_id'].values:
            find_depth(subemployee, depth + 1)

find_depth(1, 0)

result.reset_index(drop=True, inplace=True)

print(result.sort_values(by='depth'))
