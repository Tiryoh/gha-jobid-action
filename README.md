# GitHub Actions job_id parser

GitHub Action to get the current workflow run's job_id

This GitHub Action depends on the GitHub REST API v3.

https://developer.github.com/v3/actions/workflow_jobs/

## Inputs

### `github_token`

**Required** GITHUB_TOKEN to use GitHub API v3

### `job_name`

**Required** job_name of tartget workflow jobs

### `repository`

target GitHub repository

default: `${GITHUB_REPOSITORY}`

### `run_id`

run_id of target workflow run

default: `${GITHUB_RUN_ID}`

###  `per_page`

Results per page (max 100) of target workflow run

default: 30

https://docs.github.com/en/rest/reference/actions#list-jobs-for-a-workflow-run-attempt

If there are more than 30 jobs for the target workflow, set this parameter.

## Outputs

### `job_id`

job_id of target workflow jobs

### `html_url`

html_url of target workflow jobs

## Example usage

### Get current `job_id` URL

```yaml
- name: Get Current Job Log URL
  uses: Tiryoh/gha-jobid-action@v0
  id: jobs
  with:
    github_token: ${{ secrets.GITHUB_TOKEN }}
    job_name: @@JOB_NAME@@
    per_page: 30
```

https://github.com/Tiryoh/docker-ros2-desktop-vnc/blob/ad3b893722b3f56c3e772e5f43efb2eb1bf682fb/.github/workflows/deploy.yml#L64-L69

### Output `job_id` URL

```yaml
- name: Output Current Job Log URL
  run: echo ${{ steps.jobs.outputs.html_url }}
```

https://github.com/Tiryoh/docker-ros2-desktop-vnc/blob/ad3b893722b3f56c3e772e5f43efb2eb1bf682fb/.github/workflows/deploy.yml#L88

## Contributors

Special Thanks

* Petr Pučil ([@generalmimon](https://github.com/generalmimon))

Contributions are always welcome!

## License

Copyright (c) 2020-2022 Daisuke Sato

This repository is licensed under the MIT License, see [LICENSE](./LICENSE).  
Unless attributed otherwise, everything in this repository is licensed under the MIT license.
