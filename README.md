# Bump App Version Action

Github Action to bump `version` and `appVersion` in Mittwald Helm Charts.

Optionally, the new chart version can be published to [mittwald/helm-charts](https://github.com/mittwald/helm-charts).

The chart version is automatically determined using the `GITHUB_REF` environment variable: `TAG="${GITHUB_REF##*/}"`.

## Inputs

### `mode`

If `mode` is `publish`, a pipeline in [mittwald/helm-charts](https://github.com/mittwald/helm-charts) will be triggered to publish the new chart version to [helm.mittwald.de](helm.mittwald.de).

### `version`

`version` is the version to use for `version` and `appVersion` in the `Chart.yaml`.

### `chartYaml`

Location to the `Chart.yaml` of the helm-chart relative to the repository root.

## Env

### `GITHUB_TOKEN`

Token to pull/push to the repo this action runs in, as well as to trigger a pipeline in [mittwald/helm-charts](https://github.com/mittwald/helm-charts).

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
        uses: mittwald/bump-app-version-action@v0.2.0
        with:
          mode: 'publish'
          chartYaml: './deploy/chart/Chart.yaml'
        env:
          GITHUB_TOKEN: "${{ secrets.githubToken }}"
```
