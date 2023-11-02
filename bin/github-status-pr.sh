#!/usr/bin/env bash

github_prs_json=$(gh search prs --state=open --review-requested=@me --json repository,title)
github_prs_number=$(echo "$github_prs_json" | jq '. | length')
github_prs_summary=$(echo "$github_prs_json" | jq -r '.[] | (.repository.name + ": " + .title)')

if ! [[ $github_prs_number == "0" ]]; then
  echo "{\"text\": \"${github_prs_number}\", \"class\": \"has-pr\", \"tooltip\": \"${github_prs_summary//$'\n'/\\n}\"}"
else
  echo "{\"text\": \"${github_prs_number}\", \"class\": \"\" }"
fi
