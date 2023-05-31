<!--
  <<< Author notes: Step 2 >>>
  Start this step by acknowledging the previous step.
  Define terms and link to docs.github.com.
-->

## Step 2: Configure Your Action

_Let's keep going! :bike:_

### Excellent!

Now that we have the custom action pre-requisites, let us create **joke-action** action.

### :keyboard: Activity 1: Configure Your Action

All of the following steps take place inside of the `.github/actions/joke-action` directory.

We will start with using the parameters that are **required** and later implement some optional parameters as our action evolves.

1. Create a new file in: `.github/actions/joke-action/action.yml`
2. Add the following contents to the `.github/actions/joke-action/action.yml` file:

   ```yaml
   name: "my joke action"

   description: "use an external API to retrieve and display a joke"

   runs:
     using: "node16"
     main: "main.js"
   ```

3. Save the `action.yml` file
4. Commit the changes and push them to the `main` branch:
   ```shell
   git add action.yml
   git commit -m 'create action.yml'
   git pull
   git push
   ```
5. Wait about 20 seconds then refresh this page (the one you're following instructions from). [GitHub Actions](https://docs.github.com/en/actions) will automatically update to the next step.
