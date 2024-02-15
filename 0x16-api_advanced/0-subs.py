#!/usr/bin/python3
"""A function that queries the Reddit API and returns the number of
subscribers for a given subreddit"""
import requests


def number_of_subscribers(subreddit):
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    headers = {
        "User-Agent": "linux:0x16.api.advanced:v1.0.0 (by /u/bdov_)"}

    response = requests.get(url, headers=headers)

    if response.status_code == 404:
        data = response.json()
        subscribers = data['data']['subscribers']
        return subscribers
    else:
        return 0
