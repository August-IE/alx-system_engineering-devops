#!/usr/bin/python3
"""A script that exports task #0 data in the JSON format."""
import json
import requests
import sys

if __name__ == "__main__":
    user_id = sys.argv[1]
    url = "https://jsonplaceholder.typicode.com/"
    user = requests.get(url + "users/{}".format(user_id)).json()
    username = user.get("username")
    todos = requests.get(url + "todos", params={"userId": user_id}).json()

    filename = "{}.json".format(user_id)  # File name as USER_ID.json

    tasks = []  # Initialize an empty list to store tasks
    for t in todos:
        completed = t.get("completed")
        title = t.get("title")
        info = {"task": title, "completed": completed, "username": username}
        tasks.append(info)
    data = {user_id: tasks}  # Construct the data dictionary

    with open(filename, "w") as jsonfile:
        json.dump(data, jsonfile, indent=4)  # Write data to JSON file indented
