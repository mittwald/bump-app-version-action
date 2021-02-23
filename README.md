# Bump App Version Action

Github Action to bump `chartVersion` and `appVersion` in Mittwald Helm Charts.

Optionally, the new chart version can be published to [helm.mittwald.de](helm.mittwald.de).

The chart version is automatically determined using the `GITHUB_REF` environment variable: `TAG="${GITHUB_REF##*/}"`.

## Inputs

### `mode`

If `mode` is `publish`, the resulting pipeline will be triggered to publish the new chart version to [helm.mittwald.de](helm.mittwald.de).

### `version`

`version` is the version to use for `version` and `appVersion` in the `Chart.yaml`.

### `chartYaml`

Location to the `Chart.yaml` of the helm-chart relative to the repository root.

## Env

### `GITHUB_TOKEN`

Token to pull/push to the repo this action runs in.

### `HELM_REPO_USERNAME`

Username to access the helm chart repository.

### `HELM_REPO_PASSWORD`

Password to access the helm chart repository.

## Usage

Include the action in your workflow:

```yaml
name: Publish Chart

on:
  push:
    tags:
      - '*'

jobs:
  release:
    steps:
      - name: Run chart version bump
        uses: mittwald/bump-app-version-action@v1
        with:
          mode: 'publish'
          chartYaml: './deploy/chart/Chart.yaml'
        env:
          GITHUB_TOKEN: "${{ secrets.githubToken }}"
          HELM_REPO_PASSWORD: "${{ secrets.HELM_REPO_PASSWORD }}"
```
