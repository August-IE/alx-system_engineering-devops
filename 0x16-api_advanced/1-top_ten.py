#!/usr/bin/python3
"""Function to query a list of all hot posts on a given Reddit subreddit."""
import requests
import sys


def top_ten(subreddit):
    """Returns a list of titles of all hot posts on a given subreddit."""
    headers = {'User-agent': 'Custom User Agent'}
    url = "https://www.reddit.com/r/{}/hot.json?limit=10".format(subreddit)
    response = requests.get(url, headers=headers)
    try:
        # Check if the response status code is OK (200)
        if response.status_code == 200:
            # Try to decode the JSON response
            response_json = response.json()
            # Check if the response contains data and children
            if 'data' in response_json and 'children' in response_json['data']:
                top_ten_posts = response_json['data']['children']
                for post in top_ten_posts:
                    print("{}".format(post['data']['title']))
            else:
                print("No posts found.")
        else:
            print("Failed. Status code: {}".format(response.status_code))
            print("Response content: {}".format(response.content))
    except Exception as e:
        print("Error: {}".format(str(e)))
