#!/usr/bin/env bash

github_notifications_json=$(gh api notifications | jq '. | length')
github_notifications_number=$(echo "$github_notifications_json" | jq '. | length')
# github_notifications_summary=$(echo "$github_notifications_json" | jq -r '.[] | (.repository.name + ": " + .title)')

if ! [[ $github_notifications_number == "0" ]]; then
  # echo "{\"text\": \"${github_notifications_number}\", \"class\": \"has-pr\", \"tooltip\": \"${github_notifications_summary//$'\n'/\\n}\"}"
  echo "{\"text\": \"${github_notifications_number}\", \"class\": \"has-notifications\"}"
else
  echo "{\"text\": \"${github_notifications_number}\", \"class\": \"\" }"
fi
