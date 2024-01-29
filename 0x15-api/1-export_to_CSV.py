#!/usr/bin/python3
"""A script that exports task #0 data in the CSV format."""
import csv
import requests
import sys

if __name__ == "__main__":
    user_id = sys.argv[1]
    url = "https://jsonplaceholder.typicode.com/"
    user = requests.get(url + "users/{}".format(user_id)).json()
    username = user.get("username")
    todos = requests.get(url + "todos", params={"userId": user_id}).json()

    filename = "{}.csv".format(user_id)  # File name as USER_ID.csv

    with open(filename, "w", newline="") as csvfile:
        writer = csv.writer(csvfile, quoting=csv.QUOTE_ALL)
        for t in todos:
            completed = "True" if t.get("completed") else "False"
            title = t.get("title")
            writer.writerow([user_id, username, completed, title])
