#!/usr/bin/python3
"""A script that exports task #0 data in the JSON format."""
import json
import requests
import sys

if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    users = requests.get(url + "users").json()

    all_tasks = {}  # Initialize an empty dictionary to store tasks by user ID

    for user in users:
        user_id = user.get("id")
        username = user.get("username")
        todos = requests.get(url + "todos", params={"userId": user_id}).json()

        tasks = []  # Initialize an empty list to store tasks for this user
        for t in todos:
            completed = t.get("completed")
            title = t.get("title")
            info = {
                "username": username,
                "task": title,
                "completed": completed
                }
            tasks.append(info)

        all_tasks[user_id] = tasks  # Store tasks for this user in dictionary

    filename = "todo_all_employees.json"

    with open(filename, "w") as jsonfile:
        json.dump(all_tasks, jsonfile, indent=4)  # Write data to JSON file
