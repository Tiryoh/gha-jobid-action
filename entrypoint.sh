#!/bin/sh -l

GITHUB_BASEURL=https://api.github.com
GITHUB_API="/repos/${INPUT_REPOSITORY:-${GITHUB_REPOSITORY}}/actions/runs/${INPUT_RUN_ID:-${GITHUB_RUN_ID}}/jobs"

JOBINFO="$(curl --get -Ss -H "Authorization: token ${INPUT_GITHUB_TOKEN}" -H "Accept: application/vnd.github.v3+json" "${GITHUB_BASEURL}${GITHUB_API}?per_page=${INPUT_PER_PAGE:-30}")"

# if permission error, exit 1
echo ${JOBINFO} | grep "Resource not accessible by integration" &&  exit 1

eval "$(echo ${JOBINFO} | jq -r --arg job_name "${INPUT_JOB_NAME}" '.jobs | map(select(.name == $job_name)) | .[0] | @sh "job_id=\(.id) html_url=\(.html_url)"')"

# if parse error, exit 1
echo ${job_id} | grep "null" > /dev/null && echo "parse error, job_id is ${job_id}. job name might be wrong. See https://github.com/Tiryoh/gha-jobid-action" && exit 1

echo "job_id=${job_id}" >> $GITHUB_OUTPUT
echo "html_url=${html_url}" >> $GITHUB_OUTPUT
