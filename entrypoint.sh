#!/bin/sh -l

GITHUB_BASEURL=https://api.github.com
GITHUB_API="/repos/${INPUT_REPOSITORY:-${GITHUB_REPOSITORY}}/actions/runs/${INPUT_RUN_ID:-${GITHUB_RUN_ID}}/jobs"
URL=$(curl -Ss -H "Authorization: token ${INPUT_GITHUB_TOKEN}" -H "Content-Type: application/json" -X GET "${GITHUB_BASEURL}${GITHUB_API}" \
| jq ".jobs | map({ name: .name, html_url: .html_url } | select(.name == \"${INPUT_JOB_NAME}\"))" | grep html_url | sed -E 's#.*"html_url": "(.*)".*#\1#g' | tail -n1)
echo ::set-output name=job_id::$(echo ${URL} | sed -E 's#.*runs/(.*)#\1#')
echo ::set-output name=html_url::${URL}