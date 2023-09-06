import pandas as pd

# Sample data for teams DataFrame
teams_data = {
    'team_id': [1, 2, 3],
    'team_name': ['Team A', 'Team B', 'Team C']
}
teams_df = pd.DataFrame(teams_data)

# Sample data for matches DataFrame
matches_data = {
    'match_id': [1, 2, 3],
    'host_team': [1, 2, 1],
    'guest_team': [2, 1, 3],
    'host_goals': [2, 1, 2],
    'guest_goals': [1, 2, 3]
}
matches_df = pd.DataFrame(matches_data)

# Function to calculate the score


def calculate_score(row):
    if (row['team_id'] == row['host_team'] and row['host_goals'] > row['guest_goals']) or \
       (row['team_id'] == row['guest_team'] and row['host_goals'] < row['guest_goals']):
        return 3
    elif row['host_goals'] == row['guest_goals']:
        return 1
    else:
        return 0


merge1 = pd.merge(teams_df, matches_df, left_on='team_id',
                  right_on='host_team', how='left')

merge2 = pd.merge(teams_df, matches_df, left_on='team_id',
                  right_on='guest_team', how='left')


merged_df = pd.concat([merge1, merge2], ignore_index=True).dropna(
    subset=['match_id'])


merged_df['score'] = merged_df.apply(calculate_score, axis=1)

result_df = merged_df.groupby(['team_id', 'team_name'])[
    'score'].sum().reset_index()

result_df = result_df.sort_values(by='score', ascending=False)

print(result_df)
