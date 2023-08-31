import pandas as pd
data = {
    'id': [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    'name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank', 'Grace', 'Hannah', 'Isaac', 'Jack'],
    'managerId': [2, 3, 3, 2, 3, 6, 6, 6, 7, 7]
}
import pandas as pd

def find_managers(employee: pd.DataFrame) -> pd.DataFrame:
    # Group the employees by managerId and count the number of direct reports
    manager_report_count = employee.groupby('managerId').size().reset_index(name='directReports')
    print(manager_report_count)
    # Filter managers with at least five direct reports
    result = manager_report_count[manager_report_count['directReports'] >= 5]
    
    # Merge with the Employee table to get the names of these managers
    result = result.merge(employee[['id', 'name']], left_on='managerId', right_on='id', how='inner')
    
    # Select only the 'name' column and drop the 'id' and 'directReports' columns
    result = result[['name']]
    
    return result
employee_df = pd.DataFrame(data)
print(find_managers(employee_df))