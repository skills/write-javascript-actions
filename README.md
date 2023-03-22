<!--
  <<< Author notes: Header of the course >>>
  Include a 1280×640 image, course name in sentence case, and a concise description in emphasis.
  In your repository settings: enable template repository, add your 1280×640 social image, auto delete head branches.
  Next to "About", add description & tags; disable releases, packages, & environments.
  Add your open source license, GitHub uses Creative Commons Attribution 4.0 International.
-->

# Write JavaScript Actions

_Write your own GitHub JavaScript Action and automate customized tasks unique to your workflow._

<!--
  <<< Author notes: Start of the course >>>
  Include start button, a note about Actions minutes,
  and tell the learner why they should take the course.
  Each step should be wrapped in <details>/<summary>, with an `id` set.
  The start <details> should have `open` as well.
  Do not use quotes on the <details> tag attributes.
-->

<details id=0 open>
<summary><h2>Welcome</h2></summary>

Write your own GitHub JavaScript Action and automate customized tasks unique to your workflow.

- **Who is this for**: Developers, GitHub users, users new to Git, students, managers, and for teams.
- **What you'll learn**: How to consume actions within a workflow file, create custom JavaScript based actions and publish your newly created action to the marketplace.
- **Prerequisites**: Before you start, you should be familiar with GitHub, GitHub Actions, and Continuous Integration with GitHub Actions.
- **How long**: This course is 6 steps long and takes about 1 to 2 hours to be completed.

## How to start this course

1. Right-click **Start course** and open the link in a new tab.
   <br />[![start-course](https://user-images.githubusercontent.com/1221423/218596841-0645fe1a-4aaf-4f51-9ab3-8aa2d3fdd487.svg)](https://github.com/skills/writing-javascript-actions/generate)
2. In the new tab, follow the prompts to create a new repository.
   - For owner, choose your personal account or an organization to host the repository.
   - We recommend creating a public repository—private repositories will [use Actions minutes](https://docs.github.com/en/billing/managing-billing-for-github-actions/about-billing-for-github-actions).
   ![Create a new repository](https://user-images.githubusercontent.com/1221423/218594143-e60462b6-9f2a-4fa3-80de-063ac5429aab.png)
3. After your new repository is created, wait about 20 seconds, then refresh the page. Follow the step-by-step instructions in the new repository's README.

</details>

<!--
  <<< Author notes: Step 1 >>>
  Choose 3-5 steps for your course.
  The first step is always the hardest, so pick something easy!
  Link to docs.github.com for further explanations.
  Encourage users to open new tabs for steps!
-->

<details id=1>

<summary><h2> Step 1: Initialize a new JavaScript project</h2></summary>

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
11. Wait about 20 seconds then refresh this page for the next step.

</details>
  
<details id=2>
<summary><h2> Step 2: Configure Your Action</h2></summary>

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
5. Wait about 20 seconds then refresh this page for the next step.

</details>
  
<details id=3>
<summary><h2> Step 3: Create the metadata file</h2></summary>

_Nice working configuring your action :smile:_

## Action metadata

Every GitHub Action that we write needs to be accompanied by a metadata file. This file has a few rules to it, as are indicated below:

- Filename **must** be `action.yml`.
- Required for both Docker container and JavaScript actions.
- Written in YAML syntax.

This file defines the following information about your action:

| Parameter   | Description                                                                                                                                            |      Required      |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ | :----------------: |
| Name        | The name of your action. Helps visually identify the actions in a job.                                                                                 | :white_check_mark: |
| Description | A summary of what your action does.                                                                                                                    | :white_check_mark: |
| Inputs      | Input parameters allow you to specify data that the action expects to use during runtime. These parameters become environment variables in the runner. |        :x:        |
| Outputs     | Specifies the data that subsequent actions can use later in the workflow after the action that defines these outputs has run.                          |        :x:        |
| Runs        | The command to run when the action executes.                                                                                                           | :white_check_mark: |
| Branding    | You can use a color and Feather icon to create a badge to personalize and distinguish your action in GitHub Marketplace.                               |        :x:        |

---

Read more about [Action metadata](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/metadata-syntax-for-github-actions)

### :keyboard: Activity 1: Create the metadata file
  
All of the following steps take place inside of the `.github/actions/joke-action` directory.

Our action does not require much metadata for it to run correctly. We will not be accepting any inputs, we will however be setting a single output this time.

1. Update the action metadata file `.github/actions/joke-action/action.yml` with the following content:
   ```yaml
   name: "my joke action"

   description: "use an external API to retrieve and display a joke"

   outputs:
     joke-output:
       description: The resulting joke from the icanhazdadjokes API

   runs:
     using: "node16"
     main: "main.js"
   ```
2. Save the `action.yml` file
3. Commit the changes and push them to GitHub:
   ```shell
   git add action.yml
   git commit -m 'add metadata for the joke action'
   git pull
   git push
   ```
4. Wait about 20 seconds then refresh this page for the next step.

</details>
  
<details id=4>
<summary><h2> Step 4: Create the JavaScript files for your action</h2></summary>

_Good job adding the metadata file! :dancer:_

## Files

As you probably know, in JavaScript and other programming languages it is common to break your code into modules so that it is easier to read and maintain going forward. Since JavaScript actions are just programs written in JavaScript that run based on a specific trigger we are able to make our action code modular as well.

To do so we will create two files. One of them will contain the logic to reach out to an external API and retrieve a joke for us, the other will call that module and print the joke to the actions console for us. We will be extending this functionality in our third and final action.

### Fetching a joke

**Joke API**


The first file will be `joke.js` and it will fetch our joke for us. We will be using the [icanhazdadjoke API](https://icanhazdadjoke.com/api) for our action. This API does not require any authentication, but it does however that we set a few parameters in the [HTTP headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers). We need to point out what those are when we get to the code, however it is outside of the scope of this course to cover HTTP in any depth.

When we make our request to this API we will get back a JSON Object in the response. That Object looks like this:

```
{
  id: '0LuXvkq4Muc',
  joke: "I knew I shouldn't steal a mixer from work, but it was a whisk I was willing to take.",
  status: 200
}
```

It contains 3 key/value pairs of data that we can use in our own program or service. In our case, we are only interested in the `joke` field.

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
      "Writing JavaScript action GitHub Skills course."
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

Read more about [request-promise](https://github.com/request/request-promise/)

Inside of the `options` block we add a key named `headers`. This defines the HTTP headers that the **icanhazdadjoke** API expects in each request that comes it's way.

**icanhazdadjoke** cares the most about the keys, **Accept** and **User-Agent**, so we need to make sure we fill them in.

Next we define an **asynchronous JavaScript function** to make the request for us, storing the JSON Object that is returned in a variable named `res`.

Lastly, we `return` the `res.joke` which is only the value associated with the `joke` key of the JSON Object. This value will be random every time our action runs because of how we are interacting with the **icanhazdadjoke** API.

This file finishes up by exporting the newly created function so that we can use it in our `main.js` file.
  
</details>

### Creating the main entry point for your action

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
  
### :keyboard: Activity 1: Creating the JavaScript files for your new action.

1. Create and add the following contents to the `.github/actions/joke-action/joke.js` file:

   ```javascript
   const request = require("request-promise");

   const options = {
     method: "GET",
     uri: "https://icanhazdadjoke.com/",
     headers: {
       Accept: "application/json",
       "User-Agent":
         "Writing JavaScript action GitHub Skills course."
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
   git pull
   git push
   ```

</details>
  
<details id=5>
<summary><h2> Step 5: Add your action to the workflow file</h2></summary>

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

</details>
  
<details id=6>

<summary><h2> Step 6: Trigger the joke action</h2></summary>

_Great job! :heart:_

Everything is all set up and now we are ready to start laughing. You will find you have some joke related labels available to you in this repository. You don't have to use them, any label will trigger our workflow, but the easiest way to follow along would be to use suggested labels.

### Trigger a joke

1. Open issue #1 in the "Issues tab"
2. Apply the `first-joke` label to the issue
3. Wait a few seconds and then apply the `second-joke` label to the issue
4. Check the `JS Actions` workflow results on the "Actions tab"
 
</details>

<details id=X>
<summary><h2>Finish</h2></summary>

<img src=https://octodex.github.com/images/poptocat_v2.png alt=celebrate width=300 align=right>

### Congratulations, you've completed this course! 

In this course, you've learned a lot about developing custom actions using JavaScript and Actions Toolkit.

## Publishing your actions

Publishing your actions is a great way to help others in your team and across the GitHub community. Although actions do not need to be published to be consumed, by adding them to the marketplace you make them easier to find.

Some notable actions you will find on the marketplace are:

- [Actions for Discord](https://github.com/marketplace/actions/actions-for-discord)
- [GitHub Action for Slack](https://github.com/marketplace/actions/github-action-for-slack)
- [Jekyll action](https://github.com/marketplace/actions/jekyll-action)
- [Run Jest](https://github.com/marketplace/actions/run-jest)

And that just scratches the surface of the 1600+ and counting actions you will find on the marketplace 

Follow [this guide](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/publishing-actions-in-github-marketplace#publishing-an-action) to learn how to publish your actions to the GitHub Marketplace
  
### What's next?

- [Take another GitHub Skills course](https://github.com/githubskills).
- [Read the GitHub Getting Started docs](https://docs.github.com/en/get-started).
- To find projects to contribute to, check out [GitHub Explore](https://github.com/explore).

</details>

---

Get help: [Post in our discussion board](https://github.com/skills/.github/discussions) &bull; [Review the GitHub status page](https://www.githubstatus.com/)

&copy; 2022 GitHub &bull; [Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/code_of_conduct.md) &bull; [MIT License](https://gh.io/mit)

