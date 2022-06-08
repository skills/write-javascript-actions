<!--
  <<< Author notes: Header of the course >>>
  Include a 1280×640 image, course name in sentence case, and a concise description in emphasis.
  In your repository settings: enable template repository, add your 1280×640 social image, auto delete head branches.
  Next to "About", add description & tags; disable releases, packages, & environments.
  Add your open source license, GitHub uses Creative Commons Attribution 4.0 International.
-->

<img src="https://repository-images.githubusercontent.com/225716723/812b4e80-586d-11ea-88cb-74a437c5dc3b" width=300 align=right>

# GitHub Actions: Writing JavaScript Actions

_Learn how to write your own GitHub JavaScript Action!  This course will empower you to begin automating customized tasks unique to your workflow._

<!--
  <<< Author notes: Start of the course >>>
  Include start button, a note about Actions minutes,
  and tell the learner why they should take the course.
  Each step should be wrapped in <details>/<summary>, with an `id` set.
  The start <details> should have `open` as well.
  Do not use quotes on the <details> tag attributes.
-->

<details id=0>
<summary><strong>:golf: Start</strong></summary>

**To start this course: [<img width="150" alt="Use this template" src="https://user-images.githubusercontent.com/1221423/148581131-555c0fb8-5361-4450-a760-75fa6219a2fc.png">](https://github.com/InfomagnusOrg/github-actions-writing-javascript-actions/generate)**

> We recommend creating a public repository, as private repositories will [use Actions minutes](https://docs.github.com/en/billing/managing-billing-for-github-actions/about-billing-for-github-actions).<br>
> After you make your own repository, wait about 20 seconds and refresh. I will go to the next step.

Over the duration of this course you will learn the skills needed to begin using and customizing GitHub Actions to fit your unique workflow scenarios.

- **Who is this for**: Developers, GitHub users, users new to Git, students, managers, teams.
- **What you'll learn**: 
  - Consume actions within a workflow file
  - Create custom JavaScript based actions
  - Publish your newly created action to the marketplace
  
- **Prerequisites**: Before you take this course, you may want to go through the following courses:
  taking the following courses:
- [Hello, GitHub Actions!](https://lab.github.com/github/hello-github-actions!) to learn the basics of how GitHub Actions work
- [GitHub Actions: Continuous Integration](https://lab.github.com/githubtraining/github-actions:-continuous-integration) to dive deeper into a workflow file
  
## Projects used

This makes use of the following open source projects. Consider exploring these repos and maybe even making contributions!

- [GitHub Actions Toolkit](https://github.com/actions/toolkit), a multipurpose JavaScript library for writing actions

</details>

<!--
  <<< Author notes: Step 1 >>>
  Choose 3-5 steps for your course.
  The first step is always the hardest, so pick something easy!
  Link to docs.github.com for further explanations.
  Encourage users to open new tabs for steps!
  TBD-step-1-notes.
-->
### Welcome to this Learning Lab course about Actions where you will build the following:

- ![screenshot of a pull request in the course with instructions on how to fetch a joke from the API, a second screenshot of a workflow running and outputting the joke: "Guy told me today he did not know what cloning is. I told him, that makes 2 of us."](https://user-images.githubusercontent.com/16547949/76105870-cce3a380-5fa3-11ea-8882-7138319b4100.png)

  - In this course you will build three actions that each accomplish different tasks designed to demonstrate the flexibility of creating and consuming JavaScript Based Actions.

  - First, you will start with the traditional "Hello World!" program which will teach you where to find the output of a workflow run. You will then modify this "Hello World!" action to accept `input` parameters which allow the action to be more dynamic. 

  - Second, you will write an action that call upon an external API to retrieve a fact about cats and prints it to the workflows output. You will then modify this cat fact action to set the retrieved data as `output` for another action in the workflow to consume.

  - Lastly, you will write a third action that will open an issue in your repository making the cat fact available to everyone. You will learn how to use the `output` of previous actions as `input` for current actions in this step.

### Configuring a workflow

Actions are enabled on your repository by default, but we still have to tell our repository to use them. We do this by creating a workflow file in our repository.

A **workflow** file can be thought of as the recipe for automating a task. They house the start to finish instructions, in the form of `jobs` and `steps`, for what should happen based on specific triggers.

Your repository can contain multiple **workflow** files that carry out a wide variety of tasks. It is important to consider this when deciding on a name for your **workflow**. The name you choose should reflect the tasks being performed.

_In our case, we will use this one **workflow** file for many things, which leads us to break this convention for teaching purposes._

📖Read more about [workflows](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/configuring-a-workflow#choosing-the-type-of-actions-for-your-workflow)

<details id=1 open>
<summary><strong>:zap: Step 1: Create a pull request to prepare the repository for actions</strong></summary>
 
1. Create a new workflow file titled `my-workflow.yml` inside of the folders `.github/workflows/` by using the instructions below, or [this quicklink]({{quicklink}}).
   - Go to the [Actions tab]({{ actionsUrl }}).
   - Choose the **Set up a workflow yourself** option, located on the top right hand corner of the screen.
   - Change the name of the file to `.github/workflows/my-workflow.yml`.
1. Commit the workflow to a new branch, you can name it `add-initial-workflow`.
1. Create a pull request titled **Create a workflow**.
1. Supply the pull request body content and click `Create pull request`.

_It is important to place meaningful content into the body of the pull requests you create throughout this course. This repository will stay with you long after you complete the course. It is advisable that you use the body of the pull requests you create as a way to take long lived notes about thing you want to remember._

</details>

_It is important to place meaningful content into the body of the pull requests you create throughout this course. This repository will stay with you long after you complete the course. It is advisable that you use the body of the pull requests you create as a way to take long lived notes about thing you want to remember._

<details><summary>Suggested body content</summary>

`Workflow files are the recipe for task automation. This is where actions are placed if I want to use them for a task.`

</details>

I'll respond in the new pull request when I detect it has been created.

---

If at any point you're expecting a response and don't see one, refresh the page.


## Oh no...  I found an error ⚠️

**Error**
The title of this pull request isn't what I expected!

**Solution**
Verify the name of your pull request is **{{title}}** and keep in mind that this is case-sensitive.

Follow these steps to rename your pull request:
1. Click on **Edit** next to the pull request's title. 
1. The title will turn to a text field, **{{ title }}** in the title field.
1. Click **Save**.

I'll respond when I detect this pull request has been renamed.

Uh oh, I expected a file that I didn't find. Please make sure there is a file at the path: `{{ need }}`.

I'll respond when I detect a new commit on this branch.

## While we wait!

Great job adding the workflow. Adding that file to this branch is enough for GitHub Actions to begin running on your repository. The time this takes will vary based on the complexity of the workflow. While this runs I'll briefly explain the components of the workflow you just added.

If you want to inspect your running workflow you can do so by heading over to the [Actions tab]({{actionsUrl}}) of this repository.

---

<details><summary>Actions workflow not running? Click here</summary>

When a GitHub Actions workflow is running, you should see some checks in progress, like the screenshot below.

![Checks in progress box](https://i.imgur.com/uO6iqYd.png)

If the checks don't appear or if the checks are stuck in progress, there's a few things you can do to try and trigger them:

- Refresh the page, it's possible the workflow ran and the page just hasn't been updated with that change
- Try making a commit on this branch. Our workflow is triggered with a `push` event, and committing to this branch will result in a new `push`
- Edit the workflow file on GitHub and ensure there are no red lines indicating a syntax problem
  </details>


## Anatomy of GitHub Actions

GitHub Actions is a unique world that lives alongside your repository.  It is one made up of many moving parts and having a general understanding of these parts will help us understand the behavior we are going to program into our action.

From 30,000 feet GitHub Actions is made up of the following components, with each component having its own complexities:

| Component           | Description                                                                                                                                                                                                                                                                                                       |
| ------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Action              | Individual tasks that you combine as **steps** to create a **job**. **Actions** are the smallest portable building block of a workflow.  To use an **action** in a workflow, you **must include it as a step**.                                                                                                   |
| Artifact            | <b>Artifacts</b> are the files created when you build and test your code. <b>Artifacts</b> might include binary or package files, test results, screenshots, or log files.  <b>Artifacts</b> can be used by the other <b>jobs</b> in the workflow or deployed directly by the <b>workflow</b>.                    |
| Event               | A specific activity that triggers a <b>workflow</b> run.                                                                                                                                                                                                                                                          |
| Job                 | A defined task made up of <b>steps</b>. Each <b>job</b> is run in a fresh instance of the <b>virtual environment</b>. <b>Jobs</b> can run at the same time in parallel or be dependent on the status of a previous <b>job</b> and run sequentially.                                                               |
| Runner              | Any machine with the GitHub Actions <b>runner</b> application installed. You can use a <b>runner</b> hosted by GitHub or host your own <b>runner</b>. A <b>runner</b> waits for available <b>jobs</b>. <b>Runners</b> run one <b>job</b> at a time reporting the progress, logs, and final result back to GitHub. |
| Step                | A <b>step</b> is a set of tasks performed by a <b>job</b>.  <b>Steps</b> can run <b>commands</b> or <b>actions</b>.                                                                                                                                                                                               |
| Virtual Environment | The <b>virtual environment</b> of a GitHub-hosted <b>runner</b> includes the virtual machine's hardware configuration, operating system, and installed software.                                                                                                                                                  |
| Workflow            | A configurable automated process that you can set up in your repository.  <b>Workflows</b> are made up of one or more <b>jobs</b> and can be scheduled or activated by an <b>event</b>.                                                                                                                           |

### How these pieces fit together

![Actions workflow diagram](https://i.imgur.com/CwxGobh.png)

When a repository is configured with a **workflow** file, like we just created, the following series of events occurs.

1.  Your GitHub repository listens for an event
2.  That event triggers a workflow run which starts a runner
3.  The runner, regardless of the hosting method, is responsible for carrying out the jobs which are defined
4.  A job is series of steps, which can be actions or commands
5.  When the steps complete a report is generated and can be viewed by anyone with access to the repository









## Go on... Tell me more!

I'm glad you asked. Let's take a look at a workflow file similar to what we just committed to this repository.

```yaml
name: CI

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v1
      - name: Run a one-line script
        run: echo Hello, world!
      - name: Run a multi-line script
        run: |
          echo Add other actions to build,
          echo test, and deploy your project.
```

This file is made up of a series of metadata, as well as behaviors that we wish to happen when the workflow is triggered.

Let's take a second to talk about each of the pieces that we see here:

- `name: CI`
  - This is the user-defined name for the workflow. This shows up on the Actions tab so we can see which workflows, and their statuses, run on this repository.
  - As you can see, our's is currently named `CI`
- `on: [push]`
  - This defines the **event** that will tigger a workflow on this repository. Currently we are listening for any [push event](https://developer.github.com/v3/activity/events/types/#pushevent) that happens within this repository.
  - Also note that this is an array, which means we can trigger this workflow [on more than one event](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/events-that-trigger-workflows#about-workflow-events) if that is our intended behavior.
- `Jobs:`
  - This is our first block of instructions. We are defining our first job for this workflow.
  - In this case, the job has been named `build`
  - We also define the runner for the job as `runs-on: ubuntu-latest`
  - Finally we define the steps for this job which can either rely on specific actions, or run commands directly. As we can see there are three steps which show a mixed usage of actions and commands.
    - `uses: actions/checkout@v1`
    - ```
      name: Run a one-line script
      run: echo Hello, world!
      ```
    - ```
      name: Run a multi-line script
      run: |
        echo Add other actions to build,
        echo test, and deploy your project.
      ```

---

📖Take a deeper dive into [workflow components](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/configuring-workflows)
📖Read more about [configuring workflows](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/configuring-workflows)

*if you don't see a response from me below this, try making a new commit to this branch.  Your workflow may have finished before I was ready to listen*


:robot: I'm here to help you debug.

{{ debug }}


## Our workflow has finished 🎉

Our workflow has finished so let's take a look at the results now that we have learned a little bit about workflows while we waited.

![Workflow results screen showing status of each job](https://i.imgur.com/6EL8i5o.png)

In the left-hand panel of this screen you can see that this workflow, named `CI` was triggered `on: push` and ran the job titled `build`.

The right-hand panel shows real-time logging of the steps executed by the `build` job. There are currently 5 steps defined for this job:

- Set up job
- Run actions/checkout@v1
- Run a one-line script
- Run a multi-line script
- Complete job

🤔This is interesting, in the `my-workflow.yml` file we defined 3 steps, not 5, so what happened?

GitHub Actions will **always** add the `Set up job` and `Complete job` steps to each job in a workflow. These steps are what configure the [virtual environment](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/virtual-environments-for-github-hosted-runners) before running your steps and shut it down properly before moving onto the next job in your workflow.

If you recall, we had 1 step that used an action and 2 steps that ran commands, **can you identify which step used the action?**

<details><summary>Answer to above question</summary>

If you said `actions/checkout@v1` you'd be correct 😄!

</details>

---

If you want to see this for yourself head over to your [Actions tab]({{actinosUrl}}) and examine the workflow named `CI`


## Edit the current workflow

Currently `my-workflow.yml` is not set up correctly for our use-case. It worked great for allowing us to take a high-level look at workflows, but if we want to use our custom actions there are some changes that we have to make to it.

### :keyboard: Activity: Modify my-workflow.yml to remove boilerplate steps

1. [Edit]({{workflowFile}}) the `my-workflow.yml` to have the following contents:
    ```yaml
    name: JS Actions

    on: [push]

    jobs:
      action:
        runs-on: ubuntu-latest

        steps:
          - uses: actions/checkout@v1
    ```
2. Commit these file changes to this branch

---

I'll respond in this pull request once you make these changes.




Uh oh, I expected a file that I didn't find. Please make sure there is a file at the path: `{{ need }}`.

I'll respond when I detect a new commit on this branch.

Uh oh, I'm specifically looking to see whether `{{ filename }}` contains the following code:

```yaml
{{ code }}
```

I'll respond when I detect a new commit on this branch.

Got:
```yaml
{{ got }}
```

Uh oh, I'm specifically checking whether the file `{{ filename }}` ends with:

```yaml
{{ code }}
```
It looks like your file contains extra commands or characters. Please clear out any extra characters after the line I'm looking for.

I'll respond when I detect new commits on this branch.

Got:

```yaml
{{ got }}
```

Uh oh, I'm specifically looking to see whether `{{ filename }}` contains the following code:

```yaml
{{ code }}
```

I'll respond when I detect a new commit on this branch.

Got:
```yaml
{{ got }}
```

## Finishing the workflow

@{{user.login}} you're doing great so far 😄!  You've had to do a lot of workflow set up so we can begin writing custom actions.  We have just one more thing to add to our `my-workflow.yml` file before we get to the action side of things.

#### Recap

Before we make our final workflow change let's do a quick recap about what we've done.

| Action                                                            | Key Takeaways                                                                                                                                                                                                                                            |
| ----------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Created `my-workflow.yml` inside of `.github/workflows` directory | GitHub repositories look in the `.github/workflows` folder for workflow files.                                                                                                                                                                           |
| Used a templated workflow                                         | GitHub provides many templates for workflow files.  This is a great spot to look when setting up a new workflow.  If you can't find what you are looking for, you can always click the `setup a workflow yourself` button for a minimal starter template |
| Workflow environment                                              | You learned, from a high level, how a repository uses a workflow file to run commands or actions based on triggers.  You also learned that where these commands or actions execute is something that can be specified                                    |
| Workflow syntax                                                   | You were briefly introduced to the workflow YAML syntax.                                                                                                                                                                                                 |

If that seems like a lot of things just to get started... well, it is!  GitHub Actions is a robust platform designed to automate a wide range of tasks for your repositories.

If you'd like to see more examples of workflows and actions then check out these Learning Lab courses all about GitHub Actions:

- [GitHub Actions: Continuous Integration](https://lab.github.com/githubtraining/github-actions:-continuous-integration)
- [GitHub Actions: Continuous Delivery](https://lab.github.com/githubtraining/github-actions:-continuous-delivery)
- [GitHub Actions: Publish to GitHub Packages](https://lab.github.com/githubtraining/github-actions:-publish-to-github-packages)

### :keyboard: Activity: Modify my-workflow.yml to run our custom action

1. [Edit]({{workflowFile}}) the `my-workflow.yml` to contain the following:
    ```yaml
    name: JS Actions

    on: [push]

    jobs:
      action:

        runs-on: ubuntu-latest

        steps:
        - uses: actions/checkout@v1

        - name: hello-action
          uses: ./.github/actions/hello-world
    ```
1. Commit these file changes to this branch

---

I'll respond when I notice you've made these changes


Uh oh, I'm specifically looking to see whether `{{ filename }}` contains the following code:

```yaml
{{ code }}
```

I'll respond when I detect a new commit on this branch.

Got:
```yaml
{{ got }}
```

## On to your development environment

@{{user.login}} our JavaScript actions are going to leverage the [GitHub ToolKit](https://github.com/actions/toolkit) for developing GitHub Actions.

This is an external library that we will install using `npm` which means that you will need [Node.js](https://nodejs.org/) installed.

I find writing actions to be easier from a local environment vs trying to do everything right here in the repository. Doing these steps locally allows you to use the editor of your choice so that you have all the extensions and snippets you are used to when writing code.

If you do not have a preferred environment then I suggest following along with me exactly as you see on the screen, which means you'll need to install [Visual Studio Code](https://code.visualstudio.com/).

## Don't forget to set up your workstation 😉

Most of your work going forward will take place away from your Learning Lab repository, so before continuing with the course ensure you have the following installed on your **local machine**.

1. [ ] [Node.js](https://nodejs.org)
2. [ ] [Visual Studio Code](https://code.visualstudio.com/) or your editor of choice
3. [ ] [Git](https://git-scm.com/)

### :keyboard: Activity: Initialize a new JavaScript project

Once you have the necessary tools installed locally, follow these steps to begin creating your first action.

1. Open the **Terminal** (Mac and Linux) or **Command Prompt** (Windows) on your local machine
2. Clone your Learning Lab repo to your local machine:
   ```shell
   git clone {{repoUrl}}.git
   ```
3. Navigate to the folder you just cloned:
   ```shell
   cd {{ repo }}
   ```
4. Create a new branch named `hello-world`. This is the branch we will use to write our first action. **Please do not capitalize letters unless I do, I run case-sensitive checks to make sure I can help you along the way!**
   ```shell
   git checkout -b hello-world
   ```

5. Create a new folder for our actions files:
   ```shell
   mkdir -p .github/actions/hello-world
   ```
6. Navigate to the `hello-world` folder you just created:
   ```shell
   cd .github/actions/hello-world
   ```
7. Initialize a new project:
   ```shell
   npm init -y
   ```
8. Install the **core** dependency from the [GitHub ToolKit](https://github.com/actions/toolkit):
   ```shell
   npm install --save @actions/core
   ```
9. Commit those newly added files,we will remove the need to upload **node_modules** in a later step:
   ```shell
   git add .
   git commit -m 'add project dependencies'
   ```
10. Push your changes to your repository:
    ```shell
    git push -u origin hello-world
    ```

---

I will respond once you have finished.


## Great Job 👍

Your workflow is now set up to execute two actions when any `push` event happens on this repository.

For now, this workflow will fail.  It fails because we have not yet created the `hello-world` action, so this is expected.

Head [over here]({{issueUrl}}) to get started in creating the `hello-world` action!

You correctly pushed a new branch, but I was expecting that branch to be called `{{ expected }}`. Please push a new branch with the expected name.

I'll respond when I detect a new push to this repository.

Please ensure that on your `hello-world` branch, you've taken the following steps:

```shell
# 1. Created a folder with the name: .github/actions/hello-world
mkdir -p .github/actions/hello-world
cd .github/actions/hello-world

# 2. Inside the new folder, initialized it as a Node.js project:
npm init -y

# 3. Installed the core dependency from the GitHub Actions Toolkit:
npm install --save @actions/core

# 4. Staged, committed, and pushed all the files that were generated as a result:
git add .
git commit -m 'initial hello-world'
git push -u origin hello-world
```

This will generate a number of files, but I'm spot checking that:
- the following file exists: `.github/actions/hello-world/package.json`
- that it contains the core dependency from the GitHub Actions Toolkit (note: I'm not paying attention to the version number):
    ```
    "dependencies": {
      "@actions/core": "^1.2.1"
    }
    ```

## Anatomy of an action

Earlier you learned how the different pieces of the GitHub Actions feature work together. Now you will learn about the components that make up an individual action.

Remember, and action is the unit of work that a workflow file executes when it reaches that task. They are called by referencing them as the value to the `uses:` key in a workflow step.

### What makes up an action?

JavaScript actions are consist of two key components:

| Component                    | Description                                                                                                                                                                                                                 |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| JavaScript source code files | These files contain the logic of your action. This includes any dependencies or custom modules that your main logic may need.                                                                                               |
| Action metadata file         | This file contains information that the actions source code can use. An example of this is allowing a developer to specify an API key as an input variable for your action to consume. This file MUST be named `action.yml` |

### Let's take a look at how those components fit in with the workflow file.

<p align="center">
<img src="https://user-images.githubusercontent.com/38021615/72563499-ab4b2300-3862-11ea-98bf-97aa991d12a3.png" alt="Screenshot depicting the interaction between the JavaScript files, action metadata file and workflow file." />
</p>

_Although the **workflow** file is used to allow us to set the `inputs` and `outputs` using the `with:` keyword it is **not** a required component of an individual action._

### The failing workflow

Before we jump into the details of action metadata, it might be helpful to examine our workflow to understand the order that things happen. I have attached a screenshot below of the most recent workflow run, you can also follow along by clicking on the [Actions tab]({{actionsUrl}}) for your repository.

![This screenshot shows the results of a failing workflow run.  These result can be found by clicking the actions tab of this repository](https://i.imgur.com/FPOjK3R.png)

Notice that our third workflow step, the one that is looking for our action is failing. We expect this, but the magic ✨is in the error message!

That step is looking for a file named `action.yml`.

Because `action.yml` is non-existent in the `hello-world` directory we see this error. So let's start by talking about, and creating, the missing `action.yml` file.


## Great job 👍

I have created a [new pull request]({{pullUrl}}) where we will continue this lesson.  Click the link to meet me over there.

In the meantime I have closed this issue since we wont be needing it anymore 😄


## Action metadata

Every GitHub Action that we write needs to be accompanied by a metadata file. This file has a few rules to it, lets outline those now:

- Filename **must** be `action.yml`
- Required for both Docker container and JavaScript actions
- Written in YAML syntax

This file defines the following information about your action:

| Parameter   | Description                                                                                                                                            |      Required      |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ | :----------------: |
| Name        | The name of your action. Helps visually identify the actions in a job.                                                                                 | :white_check_mark: |
| Description | A summary of what your action does.                                                                                                                    | :white_check_mark: |
| Inputs      | Input parameters allow you to specify data that the action expects to use during runtime. These parameters become environment variables in the runner. |         ❌         |
| Outputs     | Specifies the data that subsequent actions can use later in the workflow after the action that defines these outputs has run.                          |         ❌         |
| Runs        | The command to run when the action executes.                                                                                                           | :white_check_mark: |
| Branding    | You can use a color and Feather icon to create a badge to personalize and distinguish your action in GitHub Marketplace.                               |         ❌         |

---

📖Read more about [Action metadata](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/metadata-syntax-for-github-actions)


## Enough talk, lets do this!

Now that we know what action metadata is, let's create the metadata for our current **hello-world** action.

### :keyboard: Activity: Create the metadata file

💡All of the following steps take place inside of the `.github/actions/hello-world` directory.

We will start with using the parameters that are **required** and later implement some optional parameters as our action evolves.

1. Create a new file in: `.github/actions/hello-world/action.yml`
1. Add the following contents to the `.github/actions/hello-world/action.yml` file:
   ```yaml
   name: "my hello action"

   description: "say hello with GitHub Actions"

   runs:
     using: "node12"
     main: "main.js"
   ```
2. Save the `action.yml` file
3. Commit the changes and push them to the `hello-world` branch:
   ```shell
   git add action.yml
   git commit -m 'create action.yml'
   git push
   ```
   
 ---

I'll respond here once I notice that you've pushed your changes.



Uh oh, I was expecting you to {{ expected }}. I will respond when you take this expected action.

Uh oh, I expected a file that I didn't find. Please make sure there is a file at the path: `{{ need }}`.

I'll respond when I detect a new commit on this branch.

## Runs

As you have learned `runs:` defines the command necessary to execute your action.

In our current case `runs:` takes 2 arguments

- `using:`
- `main:`

These are specific to JavaScript actions. It is our way of telling the runner to run the `main.js` file using `node12`

This is no different than running a local JavaScript file using Node like you see below:
![node example](https://media.giphy.com/media/W1kCFFsaoYlsmpVtxv/giphy.gif)

Which means that the value of `main:` would be different if your file was not named `main.js`.  
![different filename example](https://media.giphy.com/media/H7CCHqH06pVbQeWmlb/giphy.gif)
In this scenario our metadata block would look like this:

```yaml
runs:
  using: "node12"
  main: "bread.js"
```

#### From our workflows perspective

This execution is visible from within your workflow. To save time I have included a screenshot of what your workflow currently looks like. As always, you can follow along in the [Actions tab]({{actionUrl}}).

![A look into the failed run](https://i.imgur.com/nJtqEct.png)

Look 👀, now we have a new error! We are totally making progress here! What we can reason from this output is that our `action.yml` file was found and read. Since we defined the `main:` parameter to point to a file named `main.js` the workflow looked for that file in the root of the `hello-world` directory, but since it couldn't find it the workflow fails.

Let's fix this next!


## Time to code 💻

You may have noticed that your workflow has been running every time a change has been made. This is expected since it's trigger is a `push` event.

Hopefully you have also noticed that it fails when it reaches the `hello-action` step.

As we can see from the screenshot, as well as the [Actions]({{actionsUrl}}) tab, the failure occurs because the runner cannot find the action.

Lets fix that by creating the action it is looking for!

### :keyboard: Activity: Hello World

💡All of the following steps take place inside of the `.github/actions/hello-world` directory.

The first iteration of our action will follow the traditional path of logging "Hello World" 👋to the console. We will expand on this as we move forward, for now it's a good test to make sure all of our files are set up correctly 😄

1. Create and add the following contents to the `.github/actions/hello-world/main.js` file:

   ```javascript
   console.log("Hello World");
   ```

1. Save the `main.js` file
1. Commit the changes and push them to the `hello-world` branch:
   ```shell
   git add main.js
   git commit -m 'create main.js'
   git push
   ```

---

I'll respond here once the workflow has completed running. Remember, you need to **push** your changes to trigger it!


Uh oh, I was expecting you to {{ expected }}. I will respond when you take this expected action.

Uh oh, I expected a file that I didn't find. Please make sure there is a file at the path: `{{ need }}`.

I'll respond when I detect a new commit on this branch.

## Congratulations 🎉

Your very first JavaScript action has been written and executed within a workflow! You may be wondering how I know that and the truth is that GitHub Actions provide real-time logging of the events happening within the runner! Since our action prints to the console we can just expand that step in our workflow and look at the standard output that is on our screen.

You can do this in your own [Actions tab]({{actionsUrl}}) or you can settle for examining the screenshot below to see our **Hello World** statement in place of where our previous errors existed.

![hello world success](https://i.imgur.com/NDQjAx6.png)


## Using input parameters

Earlier I asked you to install the `@actions/core` package using `npm`. We did this so that we can expand our action to make it more flexible.

A "Hello World" message is great, but let's personalize it a little bit. We will do this by adding an **input** parameter to the `action.yml` and `main.js` files.

Although this example may seem a little lightweight input parameters have a very flexible use case. Consider a scenario where you need to access secret API key with your action, or when you need to specify the path to a given file. Inputs allows for these problems to be easily solved.

#### A quick example

To add inputs we need to add the `inputs:` parameter to the `action.yml` file. The `inputs:` parameter has a few parameters of its own.

| Parameter      | Description                                                        | Required                      |
| -------------- | ------------------------------------------------------------------ | ----------------------------- |
| `description:` | String describing the purpose of the input                         | True                          |
| `required:`    | Boolean value indicating if the input parameter is required or not | False (Default value is True) |
| `default:`     | String representing a default value for the input parameter        | False                         |

Let's take a look at how this fits into an `action.yml` file.

**action.yml**

```yaml
name: "my hello action"

description: "say hello with actions"

inputs:
  first-greeting:
    description: "who would you like to greet in the console"
    required: true
    default: "Hubot"

  second-greeting:
    description: "another person to greet"
    required: true
    default: "Mona the Octocat"

  third-greeting:
    description: "a third greeting"
    required: false
```

_The placement of your `inputs:` is not strictly enforced, however it has become commonplace to ensure the `runs:` statement is defined after your `inputs:` and `outputs:` in your `action.yml` file._

## So what is actually happening here?

Well, in the `my-workflow.yml` file we could specify values for inputs we just created:

- first-greeting
- second-greeting
- third-greeting

Or we could leave them out and rely on their default values.

The example below demonstrates a mix of both:

**my-workflow.yml**

```yaml
name: "JS Actions"

on: [push]

jobs:
  action:
    runs-on: "ubuntu-latest"
    steps:
      - uses: actions/checkout@v1

      - name: "hello-action"
        uses: ./.github/actions/hello-world
        with:
          first-greeting: "Learning Lab User"
```

Now that there are inputs in the action's metadata we can use the `@actions/core` package to handle them within our `main.js` file.

**main.js**

```javascript
const core = require("@actions/core");

const firstGreeting = core.getInput("first-greeting");
const secondGreeting = core.getInput("second-greeting");
const thirdGreeting = core.getInput("third-greeting");

console.log(`Hello ${firstGreeting}`);
console.log(`Hello ${secondGreeting}`);
if (thirdGreeting) {
    console.log(`Hello ${thirdGreeting}`);
}
```

By using `core.getInput()` we can specify the string of any input parameter we have placed inside of the `action.yml` file.

The `@actions/core` package brings a few more methods along with it to help us interact with the GitHub Actions platform. If writing actions is something you plan to continue doing it's work reading the [documentation](https://github.com/actions/toolkit/tree/main/packages/core) about this package.

---

📖Read more about the [input parameter](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/metadata-syntax-for-github-actions#inputs)


## Your turn!

### :keyboard: Activity: Add input parameters

That was a lot of information that you just learned. @{{user.login}} it is time for you to put it in practice.

1. Using your code editor change these files to reflect the code in the examples shown above:

     <details><summary><code>.github/actions/hello-world/main.js</code></summary>

   ```javascript
   const core = require("@actions/core");

   const firstGreeting = core.getInput("first-greeting");
   const secondGreeting = core.getInput("second-greeting");
   const thirdGreeting = core.getInput("third-greeting");

   console.log(`Hello ${firstGreeting}`);
   console.log(`Hello ${secondGreeting}`);
   if (thirdGreeting) {
     console.log(`Hello ${thirdGreeting}`);
   }
   ```

     </details>

     <details><summary><code>.github/actions/hello-world/action.yml</code></summary>

   ```yaml
   name: "my hello action"

   description: "say hello with actions"

   inputs:
     first-greeting:
       description: "who would you like to greet in the console"
       required: true
       default: "Hubot"

     second-greeting:
       description: "another person to greet"
       required: true
       default: "Mona the Octocat"

     third-greeting:
       description: "a third greeting"
       required: false

   runs:
     using: "node12"
     main: "main.js"
   ```

     </details>


      <details><summary><code>.github/workflows/my-workflow.yml</code></summary>

      ```yaml

      name: "JS Actions"

      on: [push]

      jobs:
        action:
          runs-on: "ubuntu-latest"
          steps:
            - uses: actions/checkout@v1

            - name: "hello-action"
              uses: ./.github/actions/hello-world
              with:
                first-greeting: "Learning Lab User"
      ```
      </details>

2. Save the changes to each file
3. Commit the changes to this branch and push them to GitHub:

   ```shell
   git add main.js action.yml workflow.yml
   git commit -m 'allow input in all action files'
   git push
   ```

---

I'll respond here when GitHub Actions reports it's finished.

<details><summary>Is your workflow failing?</summary>

If you workflow is failing, please double check your:
- JavaScript source code
- action metadata
- workflow file

Look for linter errors or any errors reported on the Actions tab. I will respond when I receive another workflow run is completed.
</details>


Uh oh, the workflow finished running, but I was expecting it to be successful. Instead, GitHub reports that its conclusion is: `{{ conclusion }}`.

Please double check your:
- JavaScript source code
- action metadata
- workflow file

Look for linter errors or any errors reported on the Actions tab. I will respond when I receive another workflow run is completed.

## Take a 👀 at what you made!

Great Job 👍 making those changes @{{user.login}}.  I will take just a moment to walk you through what happened.

If you look at the screenshot below you will see a very similar output to what your results should show.  If you'd like you can open your own [Actions tab]({{actionsUrl}}) to follow along.


![results from using input](https://i.imgur.com/QFKqDb2.png)


Your action now says hello to **Learning Lab User** which was the specified value for the `first-greeting` input parameter which was added to the `my-workflow.yml` file.

What's interesting though, is that we also see **Mona the Octocat** and if you recall that is the value of the `second-greeting` parameter in the `action.yml` file.

Why do we see the value of the `second-greeting` 🤔

If you remember, we made the `second-greeting` input parameter **required**.  This means that even if it is not specified in `my-workflow.yml` it will be executed by the `main.js` code using whatever value was set as **default**.  It cannot be ignored like our `third-greeting` was.

Circling back to the `fist-greeting` you may have noticed that you were able to overwrite the **default** value of `Hubot` by being explicit in the `my-workflow.yml` file.

Had you been explicit with `third-greeting` in the `my-workflow.yml` file then the `if` statement in the `main.js` file would have executed and you would have three inputs.


##  Time for you to explore

Take a few minutes to play with the current code you have.  I don't suggest editing the `main.js` file, rather I think there is a lot to gain by changing the `my-workflow.yml` file to include or exclude certain input parameters. 

### :keyboard: Activity: Try these things

1. Remove all the input parameters from the `my-workflow.yml` file.  What happens when your action executes?
2. Add all three input parameter and be explicit with their values in the `my-workflow.yml` file.  What happens when your action executes?
3. Specify only the `third-greeting` input parameter in the `my-workflow.yml` file.  what happens when your action executes?

When you are finished experimenting and examining the results merge this pull request into the **main** branch.  

Our next lesson will show you how to add external libraries to an action as well as interact with external APIs.

---

When I notice that you have merged this branch I will open a **new issue** in your repository to continue guiding you. 

Uh oh, I was expecting you to {{ expected }}. I will respond when you take this expected action.

## Who's there?

GitHub Actions... thats who!

The next action we write is going to reach out to an external API and fetch data for consumption. Although your action is bound to a step, which is bound to a workflow within your repository it is NOT bound to an isolated network. This means that we can leverage APIs from our favorite cloud providers, favorite pizza shops, social media or whatever API our developers need.

### What is an API

If you ask this question to anyone in the industry you'll likely get the obvious answer of "Application Programming Interface", which although true, doesn't exactly explain what one **is** or **does**.

Let's do a thought experiment to help understand the concept of an API.

I think most people are familiar with a car 🚗 either through personal experience or some form of media. I also think it's safe to say that most people understand the concepts behind driving a car. By examining how we drive a car we can understand how APIs work in a fun way.

**Car Components**
When driving a car there are a few components of the car that the driver interacts with directly. This wont be an all inclusive list, and each car varies to some degree, but so does each API. We will use the following components for our example:

- Gas pedal
- Brake pedal
- Steering wheel
- Gear shift

As the driver of the car when we push one of the pedals, move the gear shift position or turn the steering wheel the car responds. Most of us don't know **exactly** how it responds though. We actually don't even think about the system that is in place to amplify the force applied to the steering wheel when we make a turn. We probably don't know if our vehicle has a hydraulic, electro-hydraulic or fully electric power steering system. What we do know is that when we turn the steering wheel the car responds by turning.

The steering wheel has become an API between the driver and the inner workings of the power steering system and the systems that it communicates with. You see, steering the car eventually turns the wheels of the car and that takes place through further interconnected systems that are abstracted away from the driver.

The same is true with the gear shift. When we move our car into a different state using the gear shift a series of events take place throughout the car to reflect that change. This could be going from a stopped position to driving forward. It could be going from forward motion to reverse. It could even be cycling through gears in the case of a manual transmission. Ultimately, by moving the gear shift we tell the car what to do when we apply the gas pedal.

Very simply the gas pedal changes the speed of our car. We press it down to go faster or lift pressure off of it to stop going faster. What about if we want to fully stop? The gas pedal, gear shift and steering wheel wont exactly help us do that, hence the need for a brake pedal.

All of these systems, these APIs designed to help a human drive a car, are constantly communicating with one another to produce a moving vehicle. The driver didn't have to concern themselves with the implementation, platform, architecture, complex queries or manufacturer differences of each car. No, the driver just needed to concern themselves with how a steering wheel, gas pedal, brake pedal and gear shift work.

What gets even better is that the API for a car is pretty standard from one car to the next. Once you learn one steering wheel you pretty much know them all!

**Standard API Types:**

This concept is also prevalent in real world APIs. There are many **standard** types of APIs and if you understand each standard then you ultimately understand how to use that API to your advantage.

The most common types of API at the time this course was written are:

- REST
- SOAP
- XML-RPC
- JSON-RPC

Going into detail about each standard is beyond the scope of this course, however it's important to understand that there are many standards out there. Although there are many standards the purpose of each API is to give your program or service the ability to communicate easily with another program or service without the need to know the implementation details.

APIs also give you, the developer, the ability to give others access to specific functionality or resources within your own program or service.

📺 [Watch](https://www.youtube.com/watch?v=BWnDYH_59SY) this 30 second video on APIs

### What about our action?

We are now going to write an action that reaches out to a service through its REST API to get us a random joke. We will then display that joke on the [Actions tab]({{actionsUrl}}).

For our purposes the API we use will not require authentication, however that is a limitation of the course content and not the GitHub Actions platform. If you need to store secrets, like API keys, for your workflow to use you will need to configure [secrets](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets) as inputs.

We are also going to demonstrate having multiple files make up an action as well as importing other external libraries for your action to use.

What are we waiting for, let's get started 😉


## Congrats on your first Action 🎉

Congratulations {{user.login}} you have officially written your first GitHub JavaScript action!!!

That's super exciting news, but this lesson has just start, so let's head over to the [new issue I've opened]({{issueUrl}}) to continue writing GitHub Actions.


## Breaking our workflow

Before we continue we are going to need to do a few things. First and foremost our workflow is currently setup to run each time there is a `push` event to this repository. Let's comment out our current workflow to prevent things from running but preserve the things you've worked on up to this point.

### :keyboard: Activity: Setting up the next action

1. [Edit]({{workflowFile}}) your workflow file by commenting out every single line. _(To comment in `.yml`, add a `#` symbol to the beginning of every line)_.
    ```yaml
    # name: JS Actions

    # on: [push]

    # jobs:
    #   action:

    #     runs-on: ubuntu-latest

    #     steps:
    #     - uses: actions/checkout@v1

    #     - name: hello-action
    #       uses: ./.github/actions/hello-world
    ```
2. Commit the changes to a new branch, you can name it `action-two`.
3. Create a pull request named **External APIs**
4. Supply the pull request with body content. Remember, this area can be used a notes later.
5. Click `Create pull request`.

You will still see the workflow trying to execute with every push if you look at the [Actions tab]({{actionsUrl}}), however it will seem as though it fails. This is because there is a workflow file in the `.github/workflows` directory. The failure isn't actually a failure either, if you expand it you will see that there is simple no triggers for that given workflow and therefore it doesn't run. I have placed a screenshot below so you can become familiar with what this error looks like without the need to go to your [Actions tab]({{actionsUrl}}).

![No trigger screenshot](https://i.imgur.com/rARtXc1.png)


---

Like our first action, I'll respond in the new pull request when I detect it has been opened.


## Oh no...  I found an error ⚠️

**Error**
The title of this pull request isn't what I expected!

**Solution**
Verify the name of your pull request is **{{title}}** and keep in mind that this is case-sensitive.

Follow these steps to rename your pull request:
1. Click on **Edit** next to the pull request's title. 
1. The title will turn to a text field, **{{ title }}** in the title field.
1. Click **Save**.

I'll respond when I detect this pull request has been renamed.

Uh oh, I expected a file that I didn't find. Please make sure there is a file at the path: `{{ need }}`.

I'll respond when I detect a new commit on this branch.

## {{user.login}} you're doing great 👍

Just like the first action you wrote, you are going to need to setup a few directories and files.

### :keyboard: Activity: Configure your second action

Now that you have all the necessary tools installed locally, follow these steps to ensure your environment is configured and ready for actions.

1. Open the **Terminal** (Mac and Linux) or **Command Prompt** (Windows) on your local machine
1. Navigate to the `.github/` directory.
1. Checkout the `main` branch
   ```shell
   git checkout main
   ```
1. Update the contents of your Learning Lab repo to your local machine:
   ```shell
   git pull
   ```
1. Checkout the `{{ branch }}` branch you created for this pull request.
   ```shell
   git checkout {{ branch }}
   ```
1. Create a new folder for our actions files. **The full path should be `.github/actions/joke-action`**.
   ```shell
   mkdir actions/joke-action
   ```
1. Navigate to the `joke-action` folder you just created:
   ```shell
   cd actions/joke-action
   ```
1. Initialize a new project:
   ```shell
   npm init -y
   ```
1. Install the **request**, **request-promise** and **@actions/core** dependencies using `npm`:
   ```shell
   npm install --save request request-promise @actions/core
   ```
1. Commit those newly added files. We will remove the need to upload **node_modules** in a later step. Push your changes to GitHub:
   ```shell
   git add .
   git commit -m 'add joke action dependencies'
   git push
   ```

---

I will respond once you push a new commit to the `{{ branch }}` branch.


Uh oh, I was expecting you to {{ expected }}. I will respond when you take this expected action.

Please ensure that on this branch, you've taken the following steps:

```shell
# 1. Created a folder with the name: .github/actions/joke-action
mkdir -p .github/actions/joke-action
cd .github/actions/joke-action

# 2. Inside the new folder, initialized it as a Node.js project:
npm init -y

# 3. Installed the core dependency from the GitHub Actions Toolkit, the `request` and `request-promise` dependencies:
npm install --save request request-promise @actions/core

# 4. Staged, committed, and pushed all the files that were generated as a result:
git add .
git commit -m 'add joke dependencies'
git push
```

This will generate a number of files, but I'm spot checking that:
- the following file exists: `.github/actions/joke-action/package.json`
- that it contains the core dependency from the GitHub Actions Toolkit, `request`, and `request-promise` (note: I'm not paying attention to the version number):
    ```
    "dependencies": {
      "@actions/core": "^1.2.1"
      "request": "^2.88.2",
      "request-promise": "^4.2.5"
    }
    ```

### :keyboard: Activity: Create the metadata file

💡All of the following steps take place inside of the `.github/actions/joke-action` directory.

Our action does not require much metadata for it to run correctly. We will not be accepting any inputs, we will however be setting a single output this time.

We will not use the `joke-output` in in this portion of the course. There will be a later step that will rely on this actions output.

1. Create the action metadata file `.github/actions/joke-action/action.yml` with the following content:
   ```yaml
   name: "external API action"

   description: "use an external API to retrieve and display a joke"

   outputs:
     joke-output:
       description: The resulting joke from the icanhazdadjokes API

   runs:
     using: "node12"
     main: "main.js"
   ```
2. Save the `action.yml` file
3. Commit the changes and push them to GitHub:
   ```shell
   git add action.yml
   git commit -m 'add metadata for the joke action'
   git push
   ```

---

I'll respond when you push to this branch. 


Uh oh, I was expecting you to {{ expected }}. I will respond when you take this expected action.

Uh oh, I expected a file that I didn't find. Please make sure there is a file at the path: `{{ need }}`.

I'll respond when I detect a new commit on this branch.

## Files? 🤔

Yes... files... plural. As you probably know, in JavaScript and other programming languages it is common to break your code into modules so that it is easier to read and maintain going forward. Since JavaScript actions are just programs written in JavaScript that run based on a specific trigger we are able to make our action code modular as well.

To do so we will create two files. One of them will contain the logic to reach out to an external API and retrieve a joke for us, the other will call that module and print the joke to the actions console for us. We will be extending this functionality in our third and final action.

### Fetching a joke

**Joke API**

The first file will be `joke.js` and it will fetch our joke for us. We will be using the [icanhazdadjoke API](https://icanhazdadjoke.com/api) for our action. This API does not require any authentication, but it does however that we set a few parameters in the [HTTP headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers). I'll point out what those are when we get to the code, however it is outside of the scope of this course to cover HTTP in any depth.

When we make our request to this API we will get back a JSON Object in the response. That Object looks like this:

```
{
  id: '0LuXvkq4Muc',
  joke: "I knew I shouldn't steal a mixer from work, but it was a whisk I was willing to take.",
  status: 200
}
```

It contains 3 key:value pairs of data that we can use in our own program or service. In our case, we are only interested in the `joke` field.

**Joke Module**

We will create a file named `joke.js` and it will reside in the `.github/action/joke-action` directory.

The joke module will look like this:

```javascript
const request = require("request-promise");

const options = {
  method: "GET",
  uri: "https://icanhazdadjoke.com/",
  headers: {
    Accept: "application/json",
    "User-Agent":
      "Writing JavaScript action GitHub Learning Lab course.  Visit lab.github.com or to contact us."
  },
  json: true
};

async function getJoke() {
  const res = await request(options);
  return res.joke;
}

module.exports = getJoke;
```

<details><summary>Need an advanced description of the <code>joke.js</code> source code?</summary>
We first bring in the `request-promise` library that we installed earlier using `npm`.

Next we define a set of `options` that the `request-promise` library will use when it makes the request.

📖Read more about [request-promise](https://github.com/request/request-promise/)

Inside of the `options` block we add a key named `headers`. This defines the HTTP headers that the **icanhazdadjoke** API expects in each request that comes it's way.

**icanhazdadjoke** cares the most about the keys, **Accept** and **User-Agent**, so we need to make sure we fill them in.

Next we define an **asynchronous JavaScript function** to make the request for us, storing the JSON Object that is returned in a variable named `res`.

Lastly, we `return` the `res.joke` which is only the value associated with the `joke` key of the JSON Object. This value will be random every time our action runs because of how we are interacting with the **icanhazdadjoke** API.

This file finishes up by exporting the newly created function so that we can use it in our `main.js` file.

</details>

### Creating the main entry point for your second action

**Main Module**

We will also create a file named `main.js` that resides inside of the `.github/actions/joke-action` directory.

That file will look like this:

```javascript
const getJoke = require("./joke");
const core = require("@actions/core");

async function run() {
  const joke = await getJoke();
  console.log(joke);
  core.setOutput("joke-output", joke);
}

run();
```

<details><summary>Need an advanced description of the <code>main.js</code> source code?</summary>
Like we did in the `joke.js` file, we are first going to bring in our dependencies. Only this time, our dependencies include something we wrote! To do that we simply use `require()` to point to the location of the file we wish to bring in.

We also bring in `@actions/core` so that we can set the output of our action.

Next we write another **asynchronous JavaScript function** that stores the return value of `getJoke()` in a variable called **joke**.

Then we log the joke to the console.

Finally we finish the function with by setting the contents of the joke as the value of the `joke-output` output parameter. We will use this output later in the course.
_Don't forget to call the `run()` function._

</details>

---

### :keyboard: Activity: Creating the JavaScript files for your new action.

1. Create and add the following contents to the `.github/actions/joke-action/joke.js` file:

   ```javascript
   const request = require("request-promise");

   const options = {
     method: "GET",
     uri: "https://icanhazdadjoke.com/",
     headers: {
       Accept: "application/json",
       "User-Agent":
         "Writing JavaScript action GitHub Learning Lab course.  Visit lab.github.com or to contact us."
     },
     json: true
   };

   async function getJoke() {
     const res = await request(options);
     return res.joke;
   }

   module.exports = getJoke;
   ```

2. Save the `joke.js` file.
3. Create and add the following contents to the `.github/actions/joke-action/main.js` file:

   ```javascript
   const getJoke = require("./joke");
   const core = require("@actions/core");

   async function run() {
     const joke = await getJoke();
     console.log(joke);
     core.setOutput("joke-output", joke);
   }

   run();
   ```

4. Save the `main.js` file.
5. Commit the changes to this branch and push them to GitHub:
   ```shell
   git add joke.js main.js
   git commit -m 'creating joke.js and main.js'
   git push
   ```

---

I'll respond in this pull request when you have pushed to this branch.


Uh oh, I was expecting you to {{ expected }}. I will respond when you take this expected action.

Uh oh, I expected a file that I didn't find. Please make sure there is a file at the path: `{{ need }}`.

I'll respond when I detect a new commit on this branch.

## Using your new action

At this point we can't expect much from our workflow, if you remember all of its contents are commented out. Let's go ahead and fix that now so that we can see our action fetch us a joke.

We are going to add a new trigger to our workflow to make it easier for us to trigger it without the need to push changes to the repository. Remember that every time our workflow runs this action we should see a new joke which means we need a good way to make it run a few times. If you recall there are many [events](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/events-that-trigger-workflows#webhook-events) that trigger a workflow run.

We will use the `pull_request` event and specify the activity type to be when an issue get's `labeled`. This will allow us to trigger our workflow by simply placing a label on this pull request.

### :keyboard: Activity: Restore the workflow file

Let's change the tigger and add the joke action

1. [Edit]({{workflowFile}}) your current workflow file to contain the following:
    ```yaml
    name: JS Actions

    on:
      pull_request:
        types: [labeled]

    jobs:
      action:
        runs-on: ubuntu-latest

        steps:
          - uses: actions/checkout@v1

          - name: hello-action
            uses: ./.github/actions/hello-world

          - name: ha-ha
            uses: ./.github/actions/joke-action
    ```
2. Commit the changes to the `action-two` branch



---

I'll respond once you commit your changes


Uh oh, I was expecting you to {{ expected }}. I will respond when you take this expected action.

Uh oh, I expected a file that I didn't find. Please make sure there is a file at the path: `{{ need }}`.

I'll respond when I detect a new commit on this branch.

Uh oh, I'm specifically looking to see whether `{{ filename }}` contains the following code:

```yaml
{{ code }}
```

I'll respond when I detect a new commit on this branch.

Got:
```yaml
{{ got }}
```

## {{user.login}} get ready to laugh

Great job! Everything is all set up and now we are ready to start laughing 🤣. You will find you have some joke related labels available to you in this repository. You don't have to use them, any label will trigger our workflow, but it might be easier to follow along with me if you use the labels I suggest.

### :keyboard: Trigger a joke

1. Apply the `first-joke` label to this pull request
2. Wait a few seconds and then apply the `second-joke` label to this pull request
3. Check the workflow results on the [Actions tab]({{actionsUrl}})

---

Feel free to continue adding labels to this pull request if you want to see more jokes.

When you are ready to move forward in the lesson merge this pull request into the `main` branch.


Uh oh, I was expecting you to {{ expected }}. I will respond when you take this expected action.

## Action three

Two actions down, one more to go! Before we move on with building our final action let's take a second to do a quick recap since this lesson has thrown a lot of information at you.

**The workflow**
We started out by explaining what a workflow is and how it pertains to the GitHub Actions platform. You learned about how a defined event sets your workflow orchestra in motion.

You learned about runners, jobs, steps and have dabbled in the syntax of a workflow file at every step in this course. I don't want to spoil too much here, but you'll be doing it again in this one as well 😉.

**Action metadata**
You learned that every action is accompanied by an `action.yml` file which contains a series of metadata for how the action behaves. This file defines all of an actions inputs, outputs, runtime environment, name, description and even branding.

**Hello action**
Your first JavaScript action took the traditional path of a "Hello World" introduction. You ended up expanding that action to accept `inputs` to help make it a little more dynamic. Ultimately, the key takeaway was to understand that you can pass input that is defined in the workflow to an action as long as the action's metadata supports it.

When consuming or creating actions it is incredibly helpful to take care to understand that actions metadata file.

**Joke action**
You second JavaScript action demonstrated that your workflow environment is capable of communicating outside of it's own network. We reached out to an external API and used that information to set `outputs` for another action to consume. As with `inputs` your actions metadata must support the ability to set `outputs` if you want to use this option.

**What next?**
Your third, and final, JavaScript action of this course is going to use yet another library from the [Actions ToolKit](https://github.com/actions/toolkit). It is also going to consume the `outputs` of your joke action and use them to help create issues in your repository.

We need to make some edits to the `my-workflow.yml` file to get it configured to use this final action.

### :keyboard: Activity: Final workflow edit

1. [Edit]({{workflowFile}}) your `my-workflow.yml` file to contain the following:
    ```yaml
    name: JS Actions

    on:
      pull_request:
        types: [labeled]

    jobs:
      action:
        runs-on: ubuntu-latest

        steps:
          - uses: actions/checkout@v1

          - name: hello-action
            uses: ./.github/actions/hello-world

          - name: ha-ha
            uses: ./.github/actions/joke-action
            id: jokes

          - name: create-issue
            uses: ./.github/actions/issue-maker
            with:
              repo-token: {% raw %}${{secrets.GITHUB_TOKEN}}{% endraw %}
              joke: {% raw %}${{steps.jokes.outputs.joke-output}}{% endraw %}
    ```
2. Commit the changes to a new branch, you can name it `action-three`.
3. Create a pull request named **Use outputs**



---

Like our other actions, I'll respond in the new pull request when I detect it has been opened.


## Congrats on your second action 🎉

Congratulations {{user.login}} you have officially written two GitHub JavaScript actions!!!

Next, you'll write your final action of this course, so let's head over to the [new issue I've opened]({{issueUrl}}) to continue.


## Oh no...  I found an error ⚠️

**Error**
The title of this pull request isn't what I expected!

**Solution**
Verify the name of your pull request is **{{title}}** and keep in mind that this is case-sensitive.

Follow these steps to rename your pull request:
1. Click on **Edit** next to the pull request's title. 
1. The title will turn to a text field, **{{ title }}** in the title field.
1. Click **Save**.

I'll respond when I detect this pull request has been renamed.

Uh oh, I expected a file that I didn't find. Please make sure there is a file at the path: `{{ need }}`.

I'll respond when I detect a new commit on this branch.

Uh oh, I'm specifically looking to see whether `{{ filename }}` contains the following code:

```yaml
{{ code }}
```

I'll respond when I detect a new commit on this branch.

Got:
```yaml
{{ got }}
```

Uh oh, I'm specifically looking to see whether `{{ filename }}` contains the following code:

```yaml
{{ code }}
```

I'll respond when I detect a new commit on this branch.

Got:
```yaml
{{ got }}
```

## {{user.login}} it's time to get ready for the third action 🎉

As with the other actions we wrote, we are going to need to setup a few directories and files.

### :keyboard: Activity: Configure your third action

Let's create our final project directory and install all the necessary dependencies. We will take this a step further near the end of this action and we will show you how to avoid needing to check in `node_modules`.

1. Open the **Terminal** (Mac and Linux) or **Command Prompt** (Windows) on your local machine
1. navigate to the `.github/actions` directory.
1. Checkout the `main` branch
   ```shell
   git checkout main
   ```
1. Update the contents of your Learning Lab repo to your local machine:
   ```shell
   git pull
   ```
1. Checkout the `{{ branch }}` branch you created for this pull request.
   ```shell
   git checkout {{ branch }}
   ```
1. Create a new folder for our actions files. **The full path should be `.github/actions/issue-maker`**.
   ```shell
   mkdir issue-maker
   ```
1. Navigate to the `issue-maker` folder you just created. **The full path should be `.github/actions/issue-maker`**
   ```shell
   cd issue-maker
   ```
1. Initialize a new project:
   ```shell
   npm init -y
   ```
1. Install the **@actions/core** and **@actions/github** dependencies using `npm`:
   ```shell
   npm install --save @actions/core @actions/github
   ```
1. Commit those newly added files,we will remove the need to upload **node_modules** in a later step. Push your changes to GitHub:
   ```shell
   git add .
   git commit -m 'add issue maker dependencies'
   git push
    ```

---

I will respond once you have pushed to this branch.


Uh oh, I was expecting you to {{ expected }}. I will respond when you take this expected action.

Please ensure that on this branch, you've taken the following steps:

```shell
# 1. Created a folder with the name: .github/actions/issue-maker
mkdir -p .github/actions/issue-maker
cd .github/actions/issue-maker

# 2. Inside the new folder, initialized it as a Node.js project:
npm init -y

# 3. Installed the core AND github dependencies from the GitHub Actions Toolkit:
npm install --save @actions/core @actions/github

# 4. Staged, committed, and pushed all the files that were generated as a result:
git add .
git commit -m 'add issue maker dependencies'
git push
```

This will generate a number of files, but I'm spot checking that:
- the following file exists: `.github/actions/issue-maker/package.json`
- that it contains the core and github dependency from the GitHub Actions Toolkit  (note: I'm not paying attention to the version number):
    ```
    "dependencies": {
      "@actions/core": "^1.2.3",
      "@actions/github": "^2.1.1"
    }
    ```

## Create and edit the third actions action.yml file

Like our "hello world" action, this action will require at least one `input:` parameter. We need this parameter so that our JavaScript for this action has access to the `output:` from the joke action.

If you recall, in the `my-workflow.yml` file, we stated this action would take a specific input named `joke:` and we set it's value to the output of the previous action.

```yaml
- name: create-issue
  uses: ./.github/actions/issue-maker
  with:
    joke: {% raw %}${{steps.jokes.outputs.joke-output}}{% endraw %}
```

Because of this, we need to define `joke:` as one of our `inputs:` for this action. Remember when we did this with the first action? It looked a little like this:

```yaml
inputs:
  first-greeting:
    description: who you would like to greet in the console
    required: true
    default: Hubot
```

Now, we will do something similar so that our action matches what our workflow expects.

### :keyboard: Activity: Create the final metadata file

💡All of the following steps take place inside of the `.github/actions/issue-maker` directory.

We will use the joke output, an `issue-title`, and the `repo-token` in this portion of the course as `inputs:` for our action.

1. Create a file named `action.yml` with the following contents:
    ```yaml
    name: "I have issues"

    description: "consume the output of the previous action and create a new issue in the repository"

    inputs:
      joke:
        description: "This will become the body of the created issue"
      issue-title:
        description: "Every issue needs a title, it's nice to supply one, even though you could do this dynamically within your code"
        default: "a joke for you"
        required: true
      repo-token:
        description: "Token with permissions to do repo things"

    runs:
      using: "node12"
      main: "index.js"
    ```
2. Save the `action.yml` file
3. Commit the changes and push them to GitHub:
   ```shell
   git add action.yml
   git commit -m 'create action.yml'
   git push
   ```



---

I will respond when you commit to this branch.


Uh oh, I was expecting you to {{ expected }}. I will respond when you take this expected action.

Uh oh, I expected a file that I didn't find. Please make sure there is a file at the path: `{{ need }}`.

I'll respond when I detect a new commit on this branch.

## Let's write some JavaScript

@{{user.login}} your **joke-action** stores a value in an `output:` parameter. We are going to use that value to create a new issue inside this repository!

Sometimes going from code-to-cloud requires more automation than CI/CD can provide. Actions can be used for this automation and hopefully after you learn how to interact with this repository through writing this action you'll go on to write many more amazing pieces of automation.

**Scenario**

You run an open source repository that is community driven. Every month you are getting tons of contributions from random developers within the community. Sometimes these contributions are amazing because the developers have read your contributing guidelines. Sometimes the opposite occurs. In both events you would like to thank your community for their contribution and ensure that every contributor is aware that you do in fact have guidelines for contributions. How would you do this?

You can imagine just how much time would be consumed if we sent a human... if we can call developers human in the first place 😉, to respond to all of our projects first time contributors with the same kind of message. Enter GitHub Actions! We can easily automate this process and many more using what you've learned up to this point.

Allow me to show you the final piece and get you started with interacting with your repository through an action.

### About the issue maker action

**Our action**
Unlike the joke action you wrote, this issue maker will have only one JavaScript file.

Let's take a look at what the source code for this action will look like and I'll explain what is happening before having your write it.

**Importing packages**

The first two lines will import packages from the [Actions ToolKit](https://github.com/actions/toolkit). You'll find yourself using these libraries a lot, so its good to get familiar with them.

```javascript
const core = require("@actions/core");
const github = require("@actions/github");
```

**Creating the main function**
Next we declare an asynchronous function since we are going to be using the HTTP protocol with octokit later.  
Wrapping our code in a try/catch block is good practice for error handling, so we will go ahead and do that here. Once that is complete we define a few variables.

```javascript
async function run() {
  try {
  } catch (err) {}
}

run();
```

**Getting input for the issue title**
Every issue on GitHub needs a title. If you recall we had the `issue-title` property set in our `action.yml` file for this action, so let's read that in from the workflow file. We do that by calling `core.getInput("name of the input")`. In our case the input is named `issue-title` so we will use that.

Wait a minute... I know what you're thinking. I said read this property from the workflow file, but we never actually defined it in the workflow. You're right, but why does this work? Do you remember what happens when we give a property a default value and enforce that it is required?

Since the default value can be overwritten we will include it in our code just in case you decide to provide a different title for your joke issues.

```javascript
async function run() {
  try {
    const issueTitle = core.getInput("issue-title");
  } catch (err) {}
}

run();
```

**Using the other inputs from the metadata**
Okay, what about the other variables we set up:

- `jokeBody`
- `token`
- `octokit`

The `jokeBody` uses the `core.getInput()` method but this time that input is going to be defined by the previous action. If you recall, in the workflow we specified `joke: {% raw %}${{steps.jokes.outputs.joke-output}}{% endraw %}` to be used `with:` this action. This is one way we can pass the output of one action to the another one in the workflow.

We also need to define a `token`. This token allows us to interact with the GitHub API, which we will do using [octokit/rest.js](https://octokit.github.io/rest.js/).

Where does the `token` come from?

We specified a `repo-token:` parameter for use `with:` this action and gave it a value of `{% raw %}${{secrets.GITHUB_TOKEN}}{% endraw %}`. I didn't tell you where we got the `GITHUB_TOKEN` from so let me do that now.

GitHub sets default environment variables that are available to every step in a workflow run. You also have access to any [secrets](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets#creating-encrypted-secrets) you have setup in your repository, to include this action specific `GITHUB_TOKEN` that is automatically set for you.

You can [read more](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/authenticating-with-the-github_token) about using the `GITHUB_TOKEN` for authentication purposes.

Its also worth taking a look at the different [Contexts and expressions](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/contexts-and-expression-syntax-for-github-actions) that you can use with GitHub Actions.

**Adding the octokit client**
Long story short, we use the default `GITHUB_TOKEN` for authentication with the Octokit client.

```javascript
async function run() {
  try {
    const issueTitle = core.getInput("issue-title");
    const jokeBody = core.getInput("joke");
    const token = core.getInput("repo-token");

    const octokit = github.getOctokit(token);
  } catch (err) {}
}

run();
```

**Creating an issue in the repository**
Next we use that octokit client to create an issue in your repository, which will make the HTTP request to the GitHub API for us. [Look here](https://octokit.github.io/rest.js/#octokit-routes-issues-create) to learn more about `octokit.issues.create()`.

```javascript
async function run() {
  try {
    const issueTitle = core.getInput("issue-title");
    const jokeBody = core.getInput("joke");
    const token = core.getInput("repo-token");

    const octokit = github.getOctokit(token);

    const newIssue = await octokit.issues.create({
        repo: github.context.repo.repo,
        owner: github.context.repo.owner,
        title: issueTitle,
        body; jokeBody
    });
  } catch (err) {}
}

run()
```

💡Octokit makes interacting with the GitHub API easy, but if you are writing actions using a different language, or you prefer to not use a library, the same issue can be created with [this API endpoint](https://developer.github.com/v3/issues/#create-an-issue)

**Let's handle any errors**
Lastly, we write the `catch` portion of our try/catch block and you use `core.setFailed()` method to force our action to fail if something goes wrong, but also produce an error message in the workflow logs.

```javascript
async function run() {
  try {
    const issueTitle = core.getInput("issue-title");
    const jokeBody = core.getInput("joke");
    const token = core.getInput("repo-token");

    const octokit = github.getOctokit(token);

    const newIssue = await octokit.issues.create({
        repo: github.context.repo.repo,
        owner: github.context.repo.owner,
        title: issueTitle,
        body; jokeBody
    });
  } catch (err) {
      core.setFailed(err.message);
  }
}

run()
```

_Don't forget to call the function, `run()`, on the last line so that your action executes!_


### :keyboard: Activity: Create the final JavaScript file

I'm counting on you this time! In the previous steps I have guided you heavily on what to type along the way. This time I ask that you look back on the things you've done in this course and pull from the knowledge you already have to accomplish these tasks.

1. Create a file named `index.js`. **Its full path should be: `.github/actions/issue-maker/index.js`.**
2. Create the `core` and `github` variables
3. Create an asynchronous function named `run()`
4. Inside a try/catch block define the `issueTitle`, `jokeBody`, `token` and `octokit` variables
5. Use the `issues.create()` octokit method to define your API request
6. Add the catch portion of the try/catch block
7. Use the `setFailed()` method from the `@actions/core` package to stop your action and log and error if something goes wrong
8. Save the file
9. Commit and push the changes to this branch
   ```shell
   git add index.js
   git commit -m 'create index.js'
   git push
   ```

I'll respond once you push to this branch.

---

<details><summary>View the complete file</summary>

```javascript
const core = require("@actions/core");
const github = require("@actions/github");

async function run() {
  try {
    const issueTitle = core.getInput("issue-title");
    const jokeBody = core.getInput("joke");
    const token = core.getInput("repo-token");

    const octokit = new github.getOctokit(token);

    const newIssue = await octokit.issues.create({
      repo: github.context.repo.repo,
      owner: github.context.repo.owner,
      title: issueTitle,
      body: jokeBody
    });
  } catch (error) {
    core.setFailed(error.message);
  }
}

run();
```

</details>


Uh oh, I was expecting you to {{ expected }}. I will respond when you take this expected action.

Uh oh, I expected a file that I didn't find. Please make sure there is a file at the path: `{{ need }}`.

I'll respond when I detect a new commit on this branch.

# Trigger all the things 🎉

Let's trigger your new workflow! Add a label to this pull request, it can be any label you choose.

After adding a label head over to your [Actions tab]({{actionsUrl}}) if you want to watch the workflow.

Once your workflow has completed check your [issues tab]({{repoUrl}}/issues) and you should see a new issue with a hilarious joke as the body!

Continue experimenting with this workflow for as long as you'd like.

Try adding another label and see if you get a new joke!

---

When you have finished experimenting, merge this pull request. I'll open a new issue containing the next steps once I detect you've closed this.


Uh oh, I was expecting you to {{ expected }}. I will respond when you take this expected action.

# Great job!

You did it 🎉

You have successfully written three different JavaScript actions.

Let's take a quick look at all the things you learned in this course:

**Workflows**
Along the way you learned a little about workflows and how to configure them. You managed to accomplish all these things:

- Define two different event triggers
- Filter an event trigger to run only when a label is added to a pull request
- You configured one unique job containing three unique steps within a workflow
- You learned how to overwrite default action values by defining them in a workflow
- One of your steps consumed a secret
- One of your steps consumed the output of a previous step

That's quite a bit for a course that doesn't cover workflows!

**Action metadata**

- You became familiar with over 1/2 of the syntax keywords that can be used in an `action.yml` file
- Using `inputs:` and `outputs:` allowed you to create more dynamic and reusable metadata files for your actions.
- You've mow written the metadata for three different actions

**JavaScript actions**
Wow, what a series of tasks! You started with the traditional `hello world` in the console, which was then expanded to use the `input:` parameters specified in the actions metadata. Through the use of that metadata you were able to be flexible with your greeting.

You learned how GitHub Actions behave when consuming external APIs and you also used the response from an external API as an `output:` parameter for a later step in the workflow.

Lastly you saw how to use actions to interact with a repository by creating an issue containing a joke.

You used multiple packages in your action source code, you consumed `inputs:` and set `outputs:`.

You learned how to use the `@actions/core` package to write errors and terminate a misbehaving action.

At this point you are armed with everything you need to know to go out there and begin creating your own custom JavaScript actions.

### We aren't done yet 😉

Throughout this course I have promised to show you how to get rid of the `node_modules` folder in your repository.

I also want to take a few minutes to point you to the information you need to place your own custom actions on the [GitHub Marketplace](https://github.com/marketplace?type=actions) for others to use.


## Getting rid of node_modules

We typically don't commit a `node_modules` folder in a repository. These can often grow to be huge if your project has many dependencies. Because of the way Node works this folder is a necessary evil, but there is a way to get rid of it!

First you need to install a tool called [ncc](https://github.com/zeit/ncc). You'll want to install this tool globally so that you can use as if it's any other CLI tool on your machine.

What **ncc** does is take all the dependencies within your project and compile them into a single JavaScript file. This allows you to avoid committing the `node_modules` folder in your actions source code.

**Install ncc**
`npm install -g @zeit/ncc`

**Using ncc**
When you use ncc:

`ncc build <input-file>`

A new directory named `dist` will be created. Within that directory you will find a file named `index.js`. To tell GitHub Actions that this new `index.js` file is the one that should run when your action is used a small edit to the `action.yml` file needs to be made.

_before:_

```yaml
runs:
  using: "node12"
  main: "index.js"
```

_after:_

```yaml
runs:
  using: "node12"
  main: "dist/index.js"
```

Once you make this change you can delete the `node_modules` folder and commit those changes to the repository that contains your Actions source code.

---

📖Further help [using ncc](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-a-javascript-action#commit-and-push-your-action-to-github) is in the GitHub Actions documentation.


## Publishing your actions

Publishing your actions is a great way to help others in your team and across the GitHub community. Although actions do not need to be published to be consumed by adding them to the marketplace you make them easier to find.

Some notable actions you will find on the marketplace are:

- [Actions for Discord](https://github.com/marketplace/actions/actions-for-discord)
- [GitHub Action for Slack](https://github.com/marketplace/actions/github-action-for-slack)
- [Jekyll action](https://github.com/marketplace/actions/jekyll-action)
- [Run Jest](https://github.com/marketplace/actions/run-jest)

And that just scratches the surface of the 1600+ and counting actions you will find on the marketplace 😄

📖Follow [this guide](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/publishing-actions-in-github-marketplace#publishing-an-action) to learn how to publish your actions to the GitHub Marketplace


## The End 😭

It was so fun having you as a student while taking this course. I'll forever cherish our time together {{user.login}}

You can keep this repository forever to remember our time... I actually encourage you to do so! This has now become your central point for notes on writing JavaScript actions 😄

I really do think of everything!

Make sure to visit [Learning Lab](//lab.github.com) for more courses on GitHub Actions and other awesome tech content.

We would love to hear what you thought about this course, share your experience with us and others in the [Community forum](https://github.community/t5/GitHub-Learning-Lab/bd-p/learn)

---

To fully complete your course **close this issue**

--- 
Great! Go to the [final issue]({{ url }}).

Get help: [Post in our community forum](https://github.community/c/education/github-learning-lab/34) &bull; [Review the GitHub status page](https://www.githubstatus.com/)

&copy; 2022 GitHub &bull; [Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/code_of_conduct.md) &bull; [CC-BY-4.0 License](https://creativecommons.org/licenses/by/4.0/legalcode)
