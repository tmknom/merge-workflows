# merge-workflows

Collection of merge workflows.

## Description

A collection of merge workflows implemented as Reusable Workflows for GitHub Actions.
It provides the following workflows:

- **GitHub Actions**: Merges a pull request for updating Actions and Reusable Workflows.

These workflows are ideal for the pull request created by Dependabot version updates.
The merge workflows and Dependabot ensures that your repository automatically keeps up with the latest releases of the packages and applications it depends on.

## Usage

### GitHub Actions

```yaml
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

## Related projects

- [template-composite-action](https://github.com/tmknom/template-composite-action): Template repository for Composite Action.
- [template-reusable-workflows](https://github.com/tmknom/template-reusable-workflows): Template repository for Reusable Workflows.
- [template-go](https://github.com/tmknom/template-go): Template repository for Go.

## Release notes

See [GitHub Releases][releases].

[releases]: https://github.com/tmknom/merge-workflows/releases
