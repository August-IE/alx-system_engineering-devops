#!/usr/bin/python3
"""Function to query a list of all hot posts on a given Reddit subreddit."""
import requests


def top_ten(subreddit):
    """Returns a list of titles of all hot posts on a given subreddit."""

    if subreddit is None or not isinstance(subreddit, str):
        print("None")
        return

    user_agent = {'User-agent': 'Custom User Agent'}
    params = {'limit': 10}
    url = "https://www.reddit.com/r/{}/hot.json?limit=10".format(subreddit)

    try:
        response = requests.get(url, headers=user_agent, params=params)
        response.raise_for_status()  # Raise an error for bad responses
        data = response.json().get('data', {}).get('children', [])

        for post in data:
            print(post['data']['title'])

    except requests.exceptions.RequestException as e:
        print("Error: {}".format(e))
        print("None")
