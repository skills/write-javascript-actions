<!--
  <<< Author notes: Step 5 >>>
  Start this step by acknowledging the previous step.
  Define terms and link to docs.github.com.
-->

## Step 5: Add your action to the workflow file

_Great job! :tada:_

All of the following steps will add the action to the workflow file that’s already in the repo [`my-workflow.yml` file](/.github/workflows/my-workflow.yml)

### :keyboard: Activity 1: Edit the custom action at the bottom of the workflow file.

```yaml
- name: ha-ha
  uses: ./.github/actions/joke-action
```

Here is what the full file should look like (we’re using issues instead of the pull request event and removing the reference to the hello world action.)

```yaml
name: JS Actions

on:
  issues:
    types: [labeled]

jobs:
  action:
    if: ${{ !github.event.repository.is_template }}
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3
      - name: ha-ha
        uses: ./.github/actions/joke-action
```

You can make these changes in your repository by opening [`my-workflow.yml`](/.github/workflows/my-workflow.yml) in another browser tab and [editing the file directly](https://docs.github.com/en/repositories/working-with-files/managing-files/editing-files). Make sure to select the `Commit directly to the main branch` option.

Wait about 20 seconds then refresh this page (the one you're following instructions from). [GitHub Actions](https://docs.github.com/en/actions) will automatically update to the next step.
