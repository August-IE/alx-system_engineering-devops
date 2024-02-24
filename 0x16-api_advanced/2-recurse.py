#!/usr/bin/python3
"""Function to query a list of all hot posts on a given Reddit subreddit."""
import requests


def recurse(subreddit, hot_list=[], after="", count=0):
    """Returns a list of titles of all hot posts on a given subreddit."""
    if hot_list is None:
        hot_list = []

    url = "https://www.reddit.com/r/{}/hot/.json".format(subreddit)
    headers = {'User-Agent': 'Custom User Agent'}
    params = {'limit': 100, 'after': after} if after else {'limit': 100}
    response = requests.get(url, headers=headers, params=params,
                            allow_redirects=False)

    if response.status_code == 200:
        data = response.json().get('data').get('children')
        for post in posts:
            hot_list.append(post.get('data').get('title'))

        after = data.get('data').get('after')
        if after:
            return recurse(subreddit, hot_list, after)
        else:
            return hot_list
    else:
        return None
