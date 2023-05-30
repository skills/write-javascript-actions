<!--
  <<< Author notes: Step 1 >>>
  Choose 3-5 steps for your course.
  The first step is always the hardest, so pick something easy!
  Link to docs.github.com for further explanations.
  Encourage users to open new tabs for steps!
-->

## Step 1: Initialize a new JavaScript project

_Welcome to the course :tada:_

### Configuring a workflow

Actions are enabled on your repository by default, but we still have to tell our repository to use them. We do this by creating a workflow file in our repository.

A **workflow** file can be thought of as the recipe for automating a task. They house the start to finish instructions, in the form of `jobs` and `steps`, for what should happen based on specific triggers.

Your repository can contain multiple **workflow** files that carry out a wide variety of tasks. It is important to consider this when deciding on a name for your **workflow**. The name you choose should reflect the tasks being performed.

_In our case, we will use this one **workflow** file for many things, which leads us to break this convention for teaching purposes._

Read more about [workflows](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/configuring-a-workflow#choosing-the-type-of-actions-for-your-workflow)

## On to your development environment

Our JavaScript actions are going to leverage the [GitHub ToolKit](https://github.com/actions/toolkit) for developing GitHub Actions.

This is an external library that we will install using `npm` which means that you will need [Node.js](https://nodejs.org/) installed.

We find writing actions to be easier from a local environment vs trying to do everything right here in the repository. Doing these steps locally allows you to use the editor of your choice so that you have all the extensions and snippets you are used to when writing code.

If you do not have a preferred environment then we suggest following along exactly as you see on the screen, which means you'll need to install [Visual Studio Code](https://code.visualstudio.com/).

## Don't forget to set up your workstation

Most of your work going forward will take place away from your Skills repository, so before continuing with the course ensure you have the following installed on your **local machine**.

1. [ ] [Node.js](https://nodejs.org)
2. [ ] [Visual Studio Code](https://code.visualstudio.com/) or your editor of choice
3. [ ] [Git](https://git-scm.com/)

### :keyboard: Activity 1: Initialize a new JavaScript project

Once you have the necessary tools installed locally, follow these steps to begin creating your first action.

1. Open the **Terminal** (Mac and Linux) or **Command Prompt** (Windows) on your local machine
2. Clone your Skills repo to your local machine:
   ```shell
   git clone <this repository URL>.git
   ```
3. Navigate to the folder you just cloned:
   ```shell
   cd <local folder with cloned repo>
   ```
4. We are using branch called `main`.
   ```shell
   git switch main
   ```
5. Create a new folder for our actions files:
   ```shell
   mkdir -p .github/actions/joke-action
   ```
6. Navigate to the `joke-action` folder you just created:
   ```shell
   cd .github/actions/joke-action
   ```
7. Initialize a new project:
   ```shell
   npm init -y
   ```
8. Install the **request**, **request-promise** and **@actions/core** dependencies using `npm` from the [GitHub ToolKit] (https://github.com/actions/toolkit):
   ```shell
   npm install --save request request-promise @actions/core
   ```
9. Commit those newly added files,we will remove the need to upload **node_modules** in a later step:
   ```shell
   git add .
   git commit -m 'add project dependencies'
   ```
10. Push your changes to your repository:
    ```shell
    git push
    ```
11. Wait about 20 seconds then refresh this page (the one you're following instructions from). [GitHub Actions](https://docs.github.com/en/actions) will automatically update to the next step.
