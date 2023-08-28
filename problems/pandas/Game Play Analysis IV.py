import pandas as pd

data = {
    'player_id': [1, 1, 2, 2, 3, 3, 3],
    'event_date': ['2023-08-01', '2023-08-02', '2023-08-01', '2023-08-03', '2023-08-01', '2023-08-02', '2023-08-03']
}

activity_df = pd.DataFrame(data)
activity_df['event_date'] = pd.to_datetime(activity_df['event_date'])



def gameplay_analysis(activity: pd.DataFrame) -> pd.DataFrame:
      activity['first'] = activity.groupby('player_id').event_date.transform(min)
      activity_2nd_day = activity.loc[activity['first'] + pd.DateOffset(1) == activity['event_date']]
      return pd.DataFrame({'fraction':[round(len(activity_2nd_day) / activity.player_id.nunique(),2)]})
# Function call
result_df = gameplay_analysis(activity_df)

# Display the result
print(result_df)
