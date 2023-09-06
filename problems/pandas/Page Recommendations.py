import pandas as pd

# Sample data for Friends and Likes tables
friends_data = {
    'user1_id': [1, 2, 3, 4, 5],
    'user2_id': [2, 1, 1, 3, 4]
}

likes_data = {
    'user_id': [2, 3, 4, 5, 1, 2, 3],
    'page_id': [101, 102, 103, 104, 101, 105, 106]
}

# Create DataFrames for Friends and Likes
friends_df = pd.DataFrame(friends_data)
likes_df = pd.DataFrame(likes_data)



# Create a Friends DataFrame by combining user1_id and user2_id
friends_user1 = friends_df[friends_df['user2_id'] == 1]['user1_id']
friends_user2 = friends_df[friends_df['user1_id'] == 1]['user2_id']
friends_df = pd.concat([friends_user1, friends_user2], axis=0).rename(columns={0: 'user'})

# Filter Likes DataFrame for recommended pages
recommended_pages = likes_df[likes_df['user_id'].isin(friends_df['user']) & ~likes_df['page_id'].isin(likes_df[likes_df['user_id'] == 1]['page_id'])]

# Get distinct recommended pages and sort them
recommended_pages = recommended_pages['page_id'].unique()
recommended_pages.sort()

# Convert the result to a DataFrame
result_df = pd.DataFrame({'recommended_page': recommended_pages})

# Display the result DataFrame
print(result_df)
