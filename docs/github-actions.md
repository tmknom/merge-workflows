# Merge for GitHub Actions

Merges a pull request for Actions and Reusable Workflows.

## Description

This reusable workflow simplifies pull request merging, especially for automated tasks like Dependabot updates.
It supports semantic versioning levels (patch, minor, major) for precise control over merges.

## Key Features

- **Automated Approvals and Merges**: Approves and merges pull requests after all checks pass.
- **Dependabot Integration**: Seamlessly retrieves metadata for Dependabot updates.
- **Flexible Inputs**: Accepts pull request numbers, URLs, or branch names, supporting patch, minor, and major updates.
- **Secure Execution**: Restricts workflow execution to specific GitHub actors for security.

## Benefits

- **Simplified Dependency Management**: Reduces manual work for handling automated pull requests like Dependabot updates.
- **Targeted Version Control**: Allows merging updates based on specific semantic versioning levels.
- **Time Efficiency**:  Automates repetitive tasks, saving developers time.
- **Error Prevention**: Validates pull requests to reduce bugs and breaking changes.

## Usage

To use this workflow in your repository, call it from another workflow and specify the `pull-request` input:

```yaml
name: Merge
on:
  pull_request:
    paths: [".github/workflows/*.yml", ".github/workflows/*.yaml"]

concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true

permissions: {}

jobs:
  call:
    if: ${{ github.event_name == 'pull_request' && github.event.pull_request.user.login == 'dependabot[bot]' }}
    uses: tmknom/merge-workflows/.github/workflows/github-actions.yml@v0
    with:
      pull-request: ${{ github.event.pull_request.number }}
    permissions:
      contents: write
      pull-requests: write
```

<!-- actdocs start -->

## Inputs

| Name | Description | Type | Default | Required |
| :--- | :---------- | :--- | :------ | :------: |
| pull-request | Specifies the pull request to merge as a `number`, `url`, or `branch`. | `string` | n/a | yes |
| github-actor | The name of the person or app that initiated the workflow. | `string` | `dependabot[bot]` | no |
| major | Whether to merge the major version. | `boolean` | `false` | no |
| minor | Whether to merge the minor version. | `boolean` | `true` | no |
| patch | Whether to merge the patch version. | `boolean` | `true` | no |
| update-type | Update to one or more semantic versioning levels that supports `version-update:semver-patch`, `version-update:semver-minor`, and `version-update:semver-major`. | `string` | n/a | no |

## Secrets

N/A

## Outputs

N/A

## Permissions

| Scope         | Access |
| :------------ | :----- |
| contents      | write  |
| pull-requests | write  |

<!-- actdocs end -->

## Related projects

N/A
