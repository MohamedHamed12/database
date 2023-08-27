
def consecutive_numbers(logs: pd.DataFrame) -> pd.DataFrame:
    logs['row_nb_by_num'] = logs.groupby('num').num.rank(method = 'first')

    logs['groups'] = logs['id'] - logs['row_nb_by_num']

    group_size = logs.groupby(['groups','num']).id.count().reset_index()
    return group_size.loc[group_size.id >= 3]['num'].drop_duplicates().to_frame('ConsecutiveNums')