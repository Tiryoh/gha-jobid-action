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

### `run_id`

run_id of target workflow run

## Outputs

### `job_id`

job_id of target workflow jobs

### `html_url`

html_url of target workflow jobs

## Example usage

```yaml
uses: Tiryoh/gha-jobid-action@v0
with:
  github_token: ${{ secrets.GITHUB_TOKEN }}
  job_name: @@JOB_NAME@@
```

https://github.com/Tiryoh/docker_alpine-texlive-ja/blob/master/.github/workflows/main.yml#L31-L36
