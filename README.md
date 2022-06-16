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

<details id=0 open>
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

<details id=1 closed>
<summary><strong>:zap: Step 1: Initialize a new JavaScript project</strong></summary>

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
   git clone <this repository URL>.git
   ```
3. Navigate to the folder you just cloned:
   ```shell
   cd <local folder with cloned repo>
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

</details>
  
<details id=2 closed>
<summary><strong>:zap: Step 2: Configure your action</strong></summary>

Learning content: 
Grab content from Action Metadata
Activity: Activity: configure your second action 
Replace title of step to “Configure your action”
(steps 1-10) If we are using GitHub codespaces, we can remove the steps 1, 3, and 4. 
We will need to modify step 5 to have the learner create a new branch instead of using an existing branch. `git checkout -b {branch}` 
At the bottom of these steps, there is a small content section “This will generate a number of files, but I'm spot checking that:”. Let's add this content section without the spot checking wording to explain what installing these dependencies will do. 
  
</details>
  
<details id=3 closed>
<summary><strong>:zap: Step 3: Create the metadata file</strong></summary>

Activity: Create the metadata file
Remove the sentence, “We will not use the joke-output in in this portion of the course. There will be a later step that will rely on this actions output.” 
  
</details>
  
<details id=4 closed>
<summary><strong>:zap: Step 4: Create the JavaScript files for your action</strong></summary>

Learning content: Use content from Files, fetching a joke, and creating a main entry point for your second action
Remove reference to second action since we’re only adding one action
Activity: Create the JavaScript files for your action
 
</details>
  
<details id=5 closed>
<summary><strong>:zap: Step 5: Add your action to the workflow file</strong></summary>

Learning content: Mention to the learner that we need to add the action to the workflow file that’s already in the repo. 
Activity: Have the leaner add the following to the bottom of their workflow file:
   - name: ha-ha
     uses: ./.github/actions/joke-action
Here is what the full file should look like (we’re using issues instead of the pull request event  and removing the reference to the hello world action. 
   - name: JS Actions


on:
  issues:
    types: [labeled]


jobs:
  action:
     runs-on: ubuntu-latest


     steps:
       - uses: actions/checkout@v3


     	 - name: ha-ha
         uses: ./.github/actions/joke-action
 
</details>
  
<details id=6 closed>
<summary><strong>:zap: Step 6: Trigger the joke action</strong></summary>

Learning content: New title but use content from here
Activity: Trigger a joke
We’re using issues not pull requests as originally instructed
 
</details>

--- 
Great! Go to the [final issue]({{ url }}).

Get help: [Post in our community forum](https://github.community/c/education/github-learning-lab/34) &bull; [Review the GitHub status page](https://www.githubstatus.com/)

&copy; 2022 GitHub &bull; [Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/code_of_conduct.md) &bull; [CC-BY-4.0 License](https://creativecommons.org/licenses/by/4.0/legalcode)
