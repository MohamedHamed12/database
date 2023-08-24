import pandas as pd

def nth_highest_salary(employee: pd.DataFrame, n: int) -> pd.DataFrame:
    sort_employee=employee.sort_values(by='salary',ascending=False)
    sort_employee = sort_employee.drop_duplicates(subset=['salary'])
    return sort_employee.iloc[n-1:n][['salary']] 