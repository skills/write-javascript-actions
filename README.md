<!--
  <<< Author notes: Header of the course >>>
  Include a 1280×640 image, course name in sentence case, and a concise description in emphasis.
  In your repository settings: enable template repository, add your 1280×640 social image, auto delete head branches.
  Next to "About", add description & tags; disable releases, packages, & environments.
  Add your open source license, GitHub uses Creative Commons Attribution 4.0 International.
-->

# GitHub Actions: Writing JavaScript Actions


<!--
  <<< Author notes: Start of the course >>>
  Include start button, a note about Actions minutes,
  and tell the learner why they should take the course.
  Each step should be wrapped in <details>/<summary>, with an `id` set.
  The start <details> should have `open` as well.
  Do not use quotes on the <details> tag attributes.
-->

<!--step0-->

Write your own GitHub JavaScript Action and automate customized tasks unique to your workflow.

- **Who is this for**: Developers, GitHub users, users new to Git, students, managers, and for teams.
- **What you'll learn**: How to consume actions within a workflow file, create custom JavaScript based actions and publish your newly created action to the marketplace.
- **Prerequisites**: Before you start, you should be familiar with GitHub, GitHub Actions, and Continuous Integration with GitHub Actions.
- **How long**: This course is 6 steps long and takes about 1 to 2 hours to be completed. 

## How to start this course

1. Above these instructions, right-click **Use this template** and open the link in a new tab.
   ![Use this template](https://user-images.githubusercontent.com/1221423/169618716-fb17528d-f332-4fc5-a11a-eaa23562665e.png)
2. In the new tab, follow the prompts to create a new repository.
   - For owner, choose your personal account or an organization to host the repository.
   - You must check the Include all branches checkbox when creating your new respository from this template.
   - We recommend creating a public repository—private repositories will [use Actions minutes](https://docs.github.com/en/billing/managing-billing-for-github-actions/about-billing-for-github-actions).
   ![Create a new repository](https://user-images.githubusercontent.com/1221423/169618722-406dc508-add4-4074-83f0-c7a7ad87f6f3.png)
3. After your new repository is created, wait about 20 seconds, then refresh the page. Follow the step-by-step instructions in the new repository's README.

<!--endstep0-->


<!--
  <<< Author notes: Step 1 >>>
  Choose 3-5 steps for your course.
  The first step is always the hardest, so pick something easy!
  Link to docs.github.com for further explanations.
  Encourage users to open new tabs for steps!
  TBD-step-1-notes.
-->

### Configuring a workflow

Actions are enabled on your repository by default, but we still have to tell our repository to use them. We do this by creating a workflow file in our repository.

A **workflow** file can be thought of as the recipe for automating a task. They house the start to finish instructions, in the form of `jobs` and `steps`, for what should happen based on specific triggers.

Your repository can contain multiple **workflow** files that carry out a wide variety of tasks. It is important to consider this when deciding on a name for your **workflow**. The name you choose should reflect the tasks being performed.

_In our case, we will use this one **workflow** file for many things, which leads us to break this convention for teaching purposes._

Read more about [workflows](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/configuring-a-workflow#choosing-the-type-of-actions-for-your-workflow)

<details id=1>

<summary><h2> Step 1: Initialize a new JavaScript project</h2></summary>

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
  
### Activity 1: Initialize a new JavaScript project

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

### Excellent!
  
Now that we have the custom action pre-requisites, let us create **joke-action** action.

### Activity 1: Configure Your Action

All of the following steps take place inside of the `.github/actions/joke-action` directory.

We will start with using the parameters that are **required** and later implement some optional parameters as our action evolves.

1. Create a new file in: `.github/actions/joke-action/action.yml`
2. Add the following contents to the `.github/actions/joke-action/action.yml` file:
   ```yaml
   name: "my joke action"

   description: "use an external API to retrieve and display a joke"

   runs:
     using: "node12"
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

### Activity 1: Create the metadata file
  
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
     using: "node12"
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
  
### Activity 1: Creating the JavaScript files for your new action.

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

### Great job!
  
All of the following steps will add the action to the workflow file that’s already in the repo [`my-workflow.yml` file](/.github/workflows/my-workflow.yml)
  
### Activity 1: Edit the custom action at the bottom of the workflow file.

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
  
</details>
  
<details id=6>

<summary><h2> Step 6: Trigger the joke action</h2></summary>

### Great job! 
Everything is all set up and now we are ready to start laughing. You will find you have some joke related labels available to you in this repository. You don't have to use them, any label will trigger our workflow, but the easiest way to follow along would be to use suggested labels.

### Trigger a joke

1. Open issue #1 in the "Issues tab"
2. Apply the `first-joke` label to the issue
3. Wait a few seconds and then apply the `second-joke` label to the issue
4. Check the workflow results on the "Actions tab"
 
</details>

<details id=X>
<summary><h2>Finish</h2></summary>

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

&copy; 2022 GitHub &bull; [Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/code_of_conduct.md) &bull; [CC-BY-4.0 License](https://creativecommons.org/licenses/by/4.0/legalcode)
#!/::'#:'##/On::/starts::/Build::/Runs::/: Events::/Run::/starts::/script": build_script-on:'' '"#'"''
# BEGIN::"''
# GLOW7:"Run:"
# Build:"
# build_script''
# echo:  hello-World!-bug-#138
# name": "my-electron-app",
 # versioning": "1.0.0",
 # description: "Hello World!",
const: "token"''
token: "((c)(r))"''
"[Volume].deno]": [12753750].00],
ITEM_ID: "BITORE_34173"''
"name": "🪁",
  "version": "0.0.0",
    branches:'  [' TrunkBase' ]
  pull_request:
    # The branches below must be a subset of the branches above
    branches: [ MainBranch]
jobs:
  analyze:
    name: Analyze
    runs-on: ubuntu-latest
    permissions:
      actions: read
      contents: read
      security-events: write
        language: [ 'javascript' ]
  package-on: python.js
 bundle-with:  rake.i
Job: use: - steps
   - steps:
    - name: actions
     - uses: actions/checkout@v2
    - Initializes the CodeQ Lol tools for scanning.
    - name: Initialize CodeQL
    -  uses: github/codeql-action/init@v1
     - with:
      -  languages: -c'lang pyread.org/co  # Automate: build languages  (C/C++, C#, or Java).
  -  run the build manually (see below)
    - name: Autobuild
      uses: github/codeql-action/autobuild@v2
    #  Command-line programs to runm
    #  If the Autobuild fails above, remove it and uncomment the following three lines
    #    and modify them (or add more) to build your code if your project
    #   make bootstrap
    #   make release

    - name: Perform CodeQL Analysis
      uses: github/codeql-action/analyze@v1
version:1:on:
ownership:Zachry T WooD III:on:
name:docs-internal:on:
  long_name:GitHub Help Docs:on:
  kind:heroku:on:
  repo:https://github.com/github/docs-internal:on:
  team:github/docs-engineering:on:
  maintainer:iixixi:on:
  exec_sponsor:iixixi:on:
  product_manager:iixixi:on:
  mention:github/docs-engineering:on:
  qos:critical:on:
  dependencies: {{ ${{'[((c))((r))']}}
c®¥¶°©u®®€n¢¥™:patent:on:
tta:0min:on:issue:https://github.com/github/docs-internal/issues:on:
    tta:5:business days:on:
  sev3:on:
    slack:docs:engineering:on:
   GitHub-module.exports{.env= 12753750.00BITORE_34173
  block: {
    "hash": ""00000000760ebeb5feb4682db478d29b31332c0bcec46ee487d5e2733ad1ff10"''
    "confirmations": 104856,
    "strippedsize": 18132,
    "size": 18132,
    "weight": 72528,
    "height": 322000,
    "version": 2,
    "txid": "00000002",
    "merkleroot": "52649d78c1072266dd97f7447d7aab894d47d3a375e7881ade4ed3c0c47cb4cc",
    "tx": [
      {
        "Hex": "12e9115ddd566c3c08c9b33d36b7805a4e37b5538eb5457ec7c3be316b244b1c",
        "hash": "12e9115ddd566c3c08c9b33d36b7805a4e37b5538eb5457ec7c3be316b244b1c",
        "version": 1,
        "size": 109,
        "vsize": 109,
        "weight": 436,,Ml
        "locktime": 0,
        "vin": [
          {
            "coinbase": "03d0e904020204062f503253482f",
            "sequence": 4294967295
          }
        ],
        "vout": [
          {
            "value": 25.0039411,
            "n": 0,
            "scriptPubKey": {
              "asm": "03f177590b3feea56e36e31688ccf847fd7348eff43aaf563e5017fdb2a96f2688 OP_CHECKSIG",
              "hex": "2103f177590b3feea56e36e31688ccf847fd7348eff43aaf563e5017fdb2a96f2688ac",
              "type": "pubkey"
            }
          }
        ],
        "hex": "01000000010000000000000000000000000000000000000000000000000000000000000000ffffffff0e03d0e904020204062f503253482fffffffff017efc089500000000232103f177590b3feea56e36e31688ccf847fd7348eff43aaf563e5017fdb2a96f2688ac00000000"
      },
      {
        "txid": "2bbdc8863add1c3105b8961bd3256a2da4890f0e47dd1511ac3192d03dad772a",
        "hash": "2bbdc8863add1c3105b8961bd3256a2da4890f0e47dd1511ac3192d03dad772a",
        "version": 1,
        "size": 334,
        "vsize": 334,
        "weight": 1336,
        "locktime": 0,
        "vin": [
          {
            "txid": "f0c6cf91c15c535320842b0c267d76ed3c09af2bc80fd5e07af02a56feb47aee",
            "vout": 1,
            "scriptSig": {
              "asm": "0 3045022100ec159e519cde81596d9634ca82e6a7cf3c7b16ee962e9e04acfe3755cc3d151402207f03883f1265b2409c94a9b3240efe5569743bb1b6456b73e5e4ff5a4993273d[ALL] 3045022100b15f229dee02196505b10f063146f8a68e234cee47d9376327a2bfcb9915cfff022002a841627eb940d0d280d1fa2bc704a31ac78a80fa89f6459281c05f172c235b[ALL] 522102632178d046673c9729d828cfee388e121f497707f810c131e0d3fc0fe0bd66d62103a0951ec7d3a9da9de171617026442fcd30f34d66100fab539853b43f508787d452ae",
              "hex": "00483045022100ec159e519cde81596d9634ca82e6a7cf3c7b16ee962e9e04acfe3755cc3d151402207f03883f1265b2409c94a9b3240efe5569743bb1b6456b73e5e4ff5a4993273d01483045022100b15f229dee02196505b10f063146f8a68e234cee47d9376327a2bfcb9915cfff022002a841627eb940d0d280d1fa2bc704a31ac78a80fa89f6459281c05f172c235b0147522102632178d046673c9729d828cfee388e121f497707f810c131e0d3fc0fe0bd66d62103a0951ec7d3a9da9de171617026442fcd30f34d66100fab539853b43f508787d452ae"
            },
            "sequence": 4294967295
          }
        ],
        "vout": [
          {
            "value": 0.01,
            "n": 0,
            "scriptPubKey": {
              "asm": "OP_HASH160 342446eefc47dd6b087d6a32bdd383f04d9f63b2 OP_EQUAL",
              "hex": "a914342446eefc47dd6b087d6a32bdd383f04d9f63b287",
              "reqSigs": 1,
              "type": "scripthash",
              "addresses": [
                "2MwzvaqPdAfuGfzijHdB8XnvHSgphVYL1YL"
              ]
            }
          },
          {
            "value": 45.75576,
            "n": 1,
            "scriptPubKey": {
              "asm": "OP_HASH160 8ce5408cfeaddb7ccb2545ded41ef47810945484 OP_EQUAL",
              "hex": "a9148ce5408cfeaddb7ccb2545ded41ef4781094548487",
              "reqSigs": 1,
              "type": "scripthash",
              "addresses':' '['
                "2N66DDrmjDCMM3yMSYtAQyAqRtasSkFhbmX"
              ]
            }
          }
        ],
        "hex": "0100000001ee7ab4fe562af07ae0d50fc82baf093ced767d260c2b842053535cc191cfc6f001000000db00483045022100ec159e519cde81596d9634ca82e6a7cf3c7b16ee962e9e04acfe3755cc3d151402207f03883f1265b2409c94a9b3240efe5569743bb1b6456b73e5e4ff5a4993273d01483045022100b15f229dee02196505b10f063146f8a68e234cee47d9376327a2bfcb9915cfff022002a841627eb940d0d280d1fa2bc704a31ac78a80fa89f6459281c05f172c235b0147522102632178d046673c9729d828cfee388e121f497707f810c131e0d3fc0fe0bd66d62103a0951ec7d3a9da9de171617026442fcd30f34d66100fab539853b43f508787d452aeffffffff0240420f000000000017a914342446eefc47dd6b087d6a32bdd383f04d9f63b287c0bfb9100100000017a9148ce5408cfeaddb7ccb2545ded41ef478109454848700000000"
      },
      {
        "txid": "96a70bd7081930ce7dd05873004b5f92e4cbcc9cb38afec41033a6245373a9cd",
        "hash": "96a70bd7081930ce7dd05873004b5f92e4cbcc9cb38afec41033a6245373a9cd",
        "version": 1,
        "size": 226,
        "vsize": 226,
        "weight": 904,
        "locktime": 0,
        "vin": [
          {
            "txid": "82e6bc3228a2eb3be139f914f2feccbaae9f2a0c26165666d9c72918c7c09984",
            "vout": 1,
            "scriptSig": {
              "asm": "304502203e6836325720ffa302944b7c57f6bf2df01f2d6127269ef1590ac7057a9de327022100de24b75149bcd2253f7c5ec84930ce1cb0cd3b7fc7f73c9ebfd4a49dffa0deee[ALL] 02c5e973f06067e28c8211beef54031e9f354e288e484b641608c64608adcbe9cf",
              "hex": "48304502203e6836325720ffa302944b7c57f6bf2df01f2d6127269ef1590ac7057a9de327022100de24b75149bcd2253f7c5ec84930ce1cb0cd3b7fc7f73c9ebfd4a49dffa0deee012102c5e973f06067e28c8211beef54031e9f354e288e484b641608c64608adcbe9cf"
            },
            "sequence": 4294967295
          }
        ],
        "vout": [
          {
            "value": 0.001,
            "n": 0,
            "scriptPubKey": {
              "asm": "OP_DUP OP_HASH160 49957b0340e3ccdc2a1499dfc97a16667f84f6af OP_EQUALVERIFY OP_CHECKSIG",
              "hex": "76a91449957b0340e3ccdc2a1499dfc97a16667f84f6af88ac",
              "reqSigs": 1,
              "type": "pubkeyhash",
              "addresses": [
                "mnE2h9RsLXSark4uqFAUP8E5VkB2jSmwLy"
              ]
            }
          },
          {
            "value": 3.99363616,
            "n": 1,
            "scriptPubKey": {
              "asm": "OP_DUP OP_HASH160 fc484ec72d24140f24db5ddcaa022d437e3e1afa OP_EQUALVERIFY OP_CHECKSIG",
              "hex": "76a914fc484ec72d24140f24db5ddcaa022d437e3e1afa88ac",
              "reqSigs": 1,
              "type": "pubkeyhash",
              "addresses": [
                "n4WuCRZJxt8DoYyraUQm54kTzscL3ZTpEc"
              ]
            }
          }
        ],
        "hex": "01000000018499c0c71829c7d9665616260c2a9faebaccfef214f939e13beba22832bce682010000006b48304502203e6836325720ffa302944b7c57f6bf2df01f2d6127269ef1590ac7057a9de327022100de24b75149bcd2253f7c5ec84930ce1cb0cd3b7fc7f73c9ebfd4a49dffa0deee012102c5e973f06067e28c8211beef54031e9f354e288e484b641608c64608adcbe9cfffffffff02a0860100000000001976a91449957b0340e3ccdc2a1499dfc97a16667f84f6af88ac20cecd17000000001976a914fc484ec72d24140f24db5ddcaa022d437e3e1afa88ac00000000"
      },
      {
        "txid": "e7c5d2c0376414f863924780d75f6465c4cdf442e766e84bac29d4f05c08dcf5",
        "hash": "e7c5d2c0376414f863924780d75f6465c4cdf442e766e84bac29d4f05c08dcf5",
        "version": 1,
        "size": 258,
        "vsize": 258,
        "weight": 1032,
        "locktime": 0,
        "vin": [
          {
            "txid": "be79951db9d64635f00a742d4314bbd6ab4ad4cbf03e29a398b266a2c2bc09ce",
            "vout": 1,
            "scriptSig": {
              "asm": "3045022100e410093db9a3f086cb0b92aab47167a01579aac428e5a29f7bbd706afd5103c3022008ba7ad0183896e3209a10a86b47495cacc43b76504cf2e2f1e0b3416d04b0fe[ALL] 040cfa3dfb357bdff37c8748c7771e173453da5d7caa32972ab2f5c888fff5bbaeb5fc812b473bf808206930fade81ef4e373e60039886b51022ce68902d96ef70",
              "hex": "483045022100e410093db9a3f086cb0b92aab47167a01579aac428e5a29f7bbd706afd5103c3022008ba7ad0183896e3209a10a86b47495cacc43b76504cf2e2f1e0b3416d04b0fe0141040cfa3dfb357bdff37c8748c7771e173453da5d7caa32972ab2f5c888fff5bbaeb5fc812b473bf808206930fade81ef4e373e60039886b51022ce68902d96ef70"
            },
            "sequence": 4294967295
          }
        ],
        "vout": [
          {
            "value": 0.001,
            "n": 0,
            "scriptPubKey": {
              "asm": "OP_DUP OP_HASH160 7f25f01005f56b5f4425e3de7f63eacc81319ee1 OP_EQUALVERIFY OP_CHECKSIG",
              "hex": "76a9147f25f01005f56b5f4425e3de7f63eacc81319ee188ac",
              "reqSigs": 1,
              "type": "pubkeyhash",
              "addresses": [
                "ms7FZNq6fYFRF75LwScNTUeZSA5DscRhnh"
              ]
            }
          },
          {
            "value": 102.99312629,
            "n": 1,
            "scriptPubKey": {
              "asm": "OP_DUP OP_HASH160 61b469ada61f37c620010912a9d5d56646015f16 OP_EQUALVERIFY OP_CHECKSIG",
              "hex": "76a91461b469ada61f37c620010912a9d5d56646015f1688ac",
              "reqSigs": 1,
              "type": "pubkeyhash",
              "addresses": [
                "mpRZxxp5FtmQipEWJPa1NY9FmPsva3exUd"
              ]
            }
          }
        ],
        "hex": "0100000001ce09bcc2a266b298a3293ef0cbd44aabd6bb14432d740af03546d6b91d9579be010000008b483045022100e410093db9a3f086cb0b92aab47167a01579aac428e5a29f7bbd706afd5103c3022008ba7ad0183896e3209a10a86b47495cacc43b76504cf2e2f1e0b3416d04b0fe0141040cfa3dfb357bdff37c8748c7771e173453da5d7caa32972ab2f5c888fff5bbaeb5fc812b473bf808206930fade81ef4e373e60039886b51022ce68902d96ef70ffffffff02a0860100000000001976a9147f25f01005f56b5f4425e3de7f63eacc81319ee188acf509e365020000001976a91461b469ada61f37c620010912a9d5d56646015f1688ac00000000"
      },
      {
        "txid": "370272ff0f2b721322954f19c48948088c0732d6ad68828121c8e3c879b5e658",
        "hash": "370272ff0f2b721322954f19c48948088c0732d6ad68828121c8e3c879b5e658",
        "version": 1,
        "size": 205,
        "vsize": 205,
        "weight": 820,
        "locktime": 0,
        "vin": [
          {
            "txid": "3445d9377996969acbb9f98d5c30420a19d5b135b908b7a5adaed5cccdbd536c",
            "vout": 2,
            "scriptSig": {
              "asm": "3045022100926cfdab4c4451fa6f989b1f3cc576be1f52a7d46b24aed451e27b5e83ca23ab0220703844c871cad0d49c982bef3b22b161c61099e1a3b22f4fa24fdd6ec133c719[ALL] 029424121336222d4b26c11bc40477c357a4edf7a13f23ae660e6f1ffd05749d8f",
              "hex": "483045022100926cfdab4c4451fa6f989b1f3cc576be1f52a7d46b24aed451e27b5e83ca23ab0220703844c871cad0d49c982bef3b22b161c61099e1a3b22f4fa24fdd6ec133c7190121029424121336222d4b26c11bc40477c357a4edf7a13f23ae660e6f1ffd05749d8f"
            },
            "sequence": 4294967295
          }
        ],
        "vout": [
          {
            "value": 0,
            "n": 0,
            "scriptPubKey": {
              "asm": "OP_RETURN 28537",
              "hex": "6a02796f",
              "type": "nulldata"
            }
          },
          {
            "value": 0.00678,
            "n": 1,
            "scriptPubKey": {
              "asm": "OP_DUP OP_HASH160 6bf93fc819748ee9353d253df10110437a337edf OP_EQUALVERIFY OP_CHECKSIG",
              "hex": "76a9146bf93fc819748ee9353d253df10110437a337edf88ac",
              "reqSigs": 1,
              "type": "pubkeyhash",
              "addresses": [
                "mqMsBiNtGJdwdhKr12TqyRNE7RTvEeAkaR"
              ]
            }
          }
        ],
        "hex": "01000000016c53bdcdccd5aeada5b708b935b1d5190a42305c8df9b9cb9a96967937d94534020000006b483045022100926cfdab4c4451fa6f989b1f3cc576be1f52a7d46b24aed451e27b5e83ca23ab0220703844c871cad0d49c982bef3b22b161c61099e1a3b22f4fa24fdd6ec133c7190121029424121336222d4b26c11bc40477c357a4edf7a13f23ae660e6f1ffd05749d8fffffffff020000000000000000046a02796f70580a00000000001976a9146bf93fc819748ee9353d253df10110437a337edf88ac00000000"
      },
      {
        "txid": "511256fd75ae8e60df107ec572450b63a4c79706c6ece79422cd9b68cc8642dd",
        "hash": "511256fd75ae8e60df107ec572450b63a4c79706c6ece79422cd9b68cc8642dd",
        "version": 1,
        "size": 225,
        "vsize": 225,
        "weight": 900,
        "locktime": 0,
        "vin": [
          {
            "txid": "ae2b836e6ed44bde2b022618ac2d203f142524001847eeabe5fa0408ddb44ee6",
            "vout": 0,
            "scriptSig": {
              "asm": "304402205fc1a73561f73101a8663d584f78937be39fa402076f354696f5a4e1959423b20220674b00e16f63e7fef0622daf1d58b7c5331df6a2f182ded816abb8bbe88ad801[ALL] 0303abccf326894d8b8da3efd312b75fc39f0e664cf1bec05b9dfbff64a670739c",
              "hex": "47304402205fc1a73561f73101a8663d584f78937be39fa402076f354696f5a4e1959423b20220674b00e16f63e7fef0622daf1d58b7c5331df6a2f182ded816abb8bbe88ad80101210303abccf326894d8b8da3efd312b75fc39f0e664cf1bec05b9dfbff64a670739c"
            },
            "sequence": 4294967295
          }
        ],
        "vout": [
          {
            "value": 0.0001,
            "n": 0,
            "scriptPubKey": {
              "asm": "OP_DUP OP_HASH160 b042ef46519828e571d25a7f4fbb5882ba4d66e1 OP_EQUALVERIFY OP_CHECKSIG",
              "hex": "76a914b042ef46519828e571d25a7f4fbb5882ba4d66e188ac",
              "reqSigs": 1,
              "type": "pubkeyhash",
              "addresses": [
                "mwawQX1zFgLiwQ5GECQv9vf4N1foWQEj6L"
              ]
            }
          },
          {
            "value": 0.0846,
            "n": 1,
            "scriptPubKey": {
              "asm": "OP_DUP OP_HASH160 32c9eb1967867dc3761717629fe2fad817e6e4d4 OP_EQUALVERIFY OP_CHECKSIG",
              "hex": "76a91432c9eb1967867dc3761717629fe2fad817e6e4d488ac",
              "reqSigs": 1,
              "type": "pubkeyhash",
              "addresses": [
                "mk9VyBL4rcdQPkVuCKAvip1sFM4q4NtnQf"
              ]
            }
          }
        ],
        "hex": "0100000001e64eb4dd0804fae5abee4718002425143f202dac1826022bde4bd46e6e832bae000000006a47304402205fc1a73561f73101a8663d584f78937be39fa402076f354696f5a4e1959423b20220674b00e16f63e7fef0622daf1d58b7c5331df6a2f182ded816abb8bbe88ad80101210303abccf326894d8b8da3efd312b75fc39f0e664cf1bec05b9dfbff64a670739cffffffff0210270000000000001976a914b042ef46519828e571d25a7f4fbb5882ba4d66e188ace0168100000000001976a91432c9eb1967867dc3761717629fe2fad817e6e4d488ac00000000"
      },
      {
        "txid": "7efcedce69805d8c7a7e55f9a46a79ac5597a09de77ee6b583022973f78344d3",
        "hash": "7efcedce69805d8c7a7e55f9a46a79ac5597a09de77ee6b583022973f78344d3",
        "version": 1,
"login": "octcokit",
    "id":"moejojojojo'@pradice/bitore.sig/ pkg.js"
 require'
require 'json'
post '/payload' do
  push = JSON.parse(request.body.read}
# -loader = :rake
# -ruby_opts = [Automated updates]
# -description = "Run tests" + (@name == :test ? "" : " for #{@name}")
# -deps = [list]
# -if?=name:(Hash.#:"','")
# -deps = @name.values.first
# -name = @name.keys.first
# -pattern = "test/test*.rb" if @pattern.nil? && @test_files.nil?
# -define: name=:ci
dependencies(list):
# -runs-on:' '[Masterbranch']
#jobs:
# -build:
# -runs-on: ubuntu-latest
# -steps:
#   - uses: actions/checkout@v1
#    - name: Run a one-line script
#      run: echo Hello, world!
#    - name: Run a multi-line script
#      run=:name: echo: hello.World!
#        echo test, and deploy your project'@'#'!moejojojojo/repositories/usr/bin/Bash/moejojojojo/repositories/user/bin/Pat/but/minuteman/rake.i/rust.u/pom.XML/Rakefil.IU/package.json/pkg.yml/package.yam/pkg.js/Runestone.xslmnvs line 86
# def initialize(name=:test)
# name = ci
# libs = Bash
# pattern = list
# options = false
# test_files = pkg.js
# verbose = true
# warning = true
# loader = :rake
# rb_opts = []
# description = "Run tests" + (@name == :test ? "" : " for #{@name}")
# deps = []
# if @name.is_a'?','"':'"'('"'#'"'.Hash':'"')'"''
# deps = @name.values.first
# name=::rake.gems/.specs_keyscutter
# pattern = "test/test*.rb" if @pattern.nil? && @test_files.nil?
# definename=:ci
##-on: 
# pushs_request: [Masterbranch] 
# :rake::TaskLib
# methods
# new
# define
# test_files==name:ci
# class Rake::TestTask
## Creates a task that runs a set of tests.
# require "rake/test.task'@ci@travis.yml.task.new do |-v|
# t.libs << "test"
# t.test_files = FileList['test/test*.rb']
# t.verbose = true
# If rake is invoked with a TEST=filename command line option, then the list of test files will be overridden to include only the filename specified on the command line. This provides an easy way to run just one test.
# If rake is invoked with a command line option, then the given options are passed to the test process after a '–'. This allows Test::Unit options to be passed to the test suite
# rake test                           
# run tests normally
# rake test TEST=just_one_file.rb     
# run just one test file.
# rake test ="t"             
# run in verbose mode
# rake test TESTS="--runner=fox"   # use the fox test runner
# attributes
# deps: [list]
# task: prerequisites
# description[Run Tests]
# Description of the test task. (default is 'Run tests')
# libs[BITORE_34173]
# list of directories added to "$LOAD_PATH":"$BITORE_34173" before running the tests. (default is 'lib')
# loader[test]
# style of test loader to use. Options are:
# :rake – rust/rake provided tests loading script (default).
# :test=: name =rb.dist/src.index = Ruby provided test loading script.
direct=: $LOAD_PATH uses test using command-line loader.
name[test]
# name=: testtask.(default is :test)
# options[dist]
# Tests options passed to the test suite. An explicit TESTOPTS=opts on the command line will override this. (default is NONE)
# pattern[list]
# Glob pattern to match test files. (default is 'test/test*.rb')
# ruby.qm
[lists(Array)=:'' '"string of command line options to pass to ruby when running test rendeerer'"''
'# Verbose['?'']
# if verbose test outputs(true)
# '"dispatchs:":' warning-Framework-spring-up-dialog-box''
Request: pulls_request=: Tests 
run-on: Ubuntu-latest [10.0.12],
"MRG_MSG=:' =(TRUE(ruby.qm))
Tests: heroku'@ci
items()is=: yargs==(AGS).))' =TRUE(=({'{'['"${{[(((c)'*'(r)))]}'*'{[VOLUME]}'*'{BITORE_34173)]'}'}',
access: Private'"''
# Gem=:new object($obj=:class=yargs== 'is(r)).)=={ |BITORE_34173| ... }
# Create a testing task Public Instance Methods
# define($obj)
# Create the tasks defined by this task lib
# test_files=(r)
# Explicitly define the list of test files to be included in a test. list is expected to be an array of file names (a File list is acceptable). If botph pattern and test_files are used, then the list of test files is the union of the two
<signFORM>
zachryTwood@gmail.com Zachry Tyler Wood DOB 10 15 1994 SSID *******1725
</sign_FORM>
"script'":'' 'dependencies(list below this commit'}''
'"require':''' 'test''
   
  },
  "dependencies": {
    "bitcoin-core": "^3.0.0",
    "body-parser": "^1.19.0",
    "cors": "^2.8.5",
    "dotenv": "^8.2.0",
    "express": "^4.16.4",
    "node-pg-migrate": "^5.9.0",
    "pkg.js": "^8.6.0"
name": '((c)'":,'"''
use": is'='==yargs(ARGS)).); /
module: env.export((r),
'"name": '((c)'":,'"''
'".dirname": is'='==yargs(ARGS)).)"; /'"''t.verbose{
  "dependencies": {
"script":: '{'"'require'' 'test'"''


    "start": "./node_modules/.bin/node-pg-migrate up && node app.js",
    "migrate": "./node_modules/.bin/node-pg-migrate"
  },
  "devDependencies": {"jest": "^24.8.0"

"pkg-migrate": 5.9.0,
    "pkg.js": "^8.6.0"
  }
}
{
  "scripts": {
    '"require"':' test;,

    "jest": "^24.8.0"
  },
  "dependencies": {
    "bitcoin-core": "^3.0.0",
    "body-parser": "^1.19.0",
    "cors": "^2.8.5",
    "dotenv": 8.2.0,
    "express": 4.16.4,
    "pkg-migrate": 5.9.0,
    "pkg.js": "^8.6.0"
  }
}
{
  "scripts": {
    '"require"':' test;,
        "version":'' '?',''
        "size":'?',''
        "vsize":'?',''
        "weight":'?',''
            "value": '"[VOLUME']":'' '"'?'"'''',
            "ITEM_ID": BITORE_34173;,
            "token": {((c)(r));,
            "hex": {{$ {{[()]}.}{[]}_{}}} }};,             
 "require': 'test'
"versionings": '@v2
              "kind": "~h(#:_?_)";,
              "#":'' ' ?';',''
                "login": "octcokit",
    "id":"moejojojojo'@pradice/bitore.sig/ pkg.js"
 require'
require 'json'
post '/payload' do
  push = JSON.parse(request.body.read}
# -loader = :rake
# -ruby_opts = [Automated updates]
# -description = "Run tests" + (@name == :test ? "" : " for #{@name}")
# -deps = [list]
# -if?=name:(Hash.#:"','")
# -deps = @name.values.first
# -name = @name.keys.first
# -pattern = "test/test*.rb" if @pattern.nil? && @test_files.nil?
# -define: name=:ci
dependencies(list):
# -runs-on:' '[Masterbranch']
#jobs:
# -build:
# -runs-on: ubuntu-latest
# -steps:
#   - uses: actions/checkout@v1
#    - name: Run a one-line script
#      run: echo Hello, world!
#    - name: Run a multi-line script
#      run=:name: echo: hello.World!
#        echo test, and deploy your project'@'#'!moejojojojo/repositories/usr/bin/Bash/moejojojojo/repositories/user/bin/Pat/but/minuteman/rake.i/rust.u/pom.XML/Rakefil.IU/package.json/pkg.yml/package.yam/pkg.js/Runestone.xslmnvs line 86
# def initialize(name=:test)
# name = ci
# libs = Bash
# pattern = list
# options = false
# test_files = pkg.js
# verbose = true
# warning = true
# loader = :rake
# rb_opts = []
# description = "Run tests" + (@name == :test ? "" : " for #{@name}")
# deps = []
# if @name.is_a'?','"':'"'('"'#'"'.Hash':'"')'"''
# deps = @name.values.first
# name=::rake.gems/.specs_keyscutter
# pattern = "test/test*.rb" if @pattern.nil? && @test_files.nil?
# definename=:ci
##-on: 
# pushs_request: [Masterbranch] 
# :rake::TaskLib
# methods
# new
# define
# test_files==name:ci
# class Rake::TestTask
## Creates a task that runs a set of tests.
# require "rake/test.task'@ci@travis.yml.task.new do |-v|
# t.libs << "test"
# t.test_files = FileList['test/test*.rb']
# t.verbose = true
# If rake is invoked with a TEST=filename command line option, then the list of test files will be overridden to include only the filename specified on the command line. This provides an easy way to run just one test.
# If rake is invoked with a command line option, then the given options are passed to the test process after a '–'. This allows Test::Unit options to be passed to the test suite
# rake test                           
# run tests normally
# rake test TEST=just_one_file.rb     
# run just one test file.
# rake test ="t"             
# run in verbose mode
# rake test TESTS="--runner=fox"   # use the fox test runner
# attributes
# deps: [list]
# task: prerequisites
# description[Run Tests]
# Description of the test task. (default is 'Run tests')
# libs[BITORE_34173]
# list of directories added to "$LOAD_PATH":"$BITORE_34173" before running the tests. (default is 'lib')
# loader[test]
# style of test loader to use. Options are:
# :rake – rust/rake provided tests loading script (default).
# :test=: name =rb.dist/src.index = Ruby provided test loading script.
direct=: $LOAD_PATH uses test using command-line loader.
name[test]
# name=: testtask.(default is :test)
# options[dist]
# Tests options passed to the test suite. An explicit TESTOPTS=opts on the command line will override this. (default is NONE)
# pattern[list]
# Glob pattern to match test files. (default is 'test/test*.rb')
# ruby.qm
[lists(Array)=:'' '"string of command line options to pass to ruby when running test rendeerer'"''
'# Verbose :Parse :build :''
'solve=: '"'$'Obj'='':' new'' :'=''='':' '?'' :
# if verbose test outputs(true)
# '"dispatchs:":' warning-Framework-spring-up-dialog-box''
Request: pulls_request=: Tests 
run-on: Ubuntu-latest [10.0.12],
"MRG_MSG=:' =(TRUE(ruby.qm))
Tests: heroku'@ci
items()is=: yargs==(AGS).))' =TRUE(=({'{'['"${{[(((c)'*'(r)))]}'*'{[VOLUME]}'*'{BITORE_34173)]'}'}',
access: Private'"''
# Gem=:new object($obj=:class=yargs== 'is(r)).)=={ |BITORE_34173| ... }
# Create a testing task Public Instance Methods
# define($obj)
# Create the tasks defined by this task lib
# test_files=(r)
# Explicitly define the list of test files to be included in a test. list is expected to be an array of file names (a File list is acceptable). If botph pattern and test_files are used, then the list of test files is the union of the two
<signFORM>
zachryTwood@gmail.com Zachry Tyler Wood DOB 10 15 1994 SSID *******1725
</sign_FORM>
"script'":'' 'dependencies(list below this commit'}''
'"require':''' 'test''
:Build::
  "dependencies": {
    "bitcoin-core": "^3.0.0",
    "body-parser": "^1.19.0",
    "cors": "^2.8.5",
    "dotenv": "^8.2.0",
    "express": "^4.16.4",
    "node-pg-migrate": "^5.9.0",
    "pkg.js": "^8.6.0"
name": '((c)'":,'"''
use": is'='==yargs(ARGS)).); /
module: env.export((r),
'"name": '((c)'":,'"''
'".dirname": is'='==yargs(ARGS)).)"; /'"''t.verbose{
  "dependencies": {
"script":: '{'"'require'' 'test'"''


    "start": "./node_modules/.bin/node-pg-migrate up && node app.js",
    "migrate": "./node_modules/.bin/node-pg-migrate"
  },
  "devDependencies": {"jest": "^24.8.0"

"pkg-migrate": 5.9.0,
    "pkg.js": "^8.6.0"
  }
}
{
  "scripts": {
    '"require"':' test;,

    "jest": "^24.8.0"
  },
  "dependencies": {
    "bitcoin-core": "^3.0.0",
    "body-parser": "^1.19.0",
    "cors": "^2.8.5",
    "dotenv": 8.2.0,
    "express": 4.16.4,
    "pkg-migrate": 5.9.0,
    "pkg.js": "^8.6.0"
  }
}
{
  "scripts": {
    '"require"':' test;,
        "version":'' '?',''
        "size":'?',''
        "vsize":'?',''
        "weight":'?',''
            "value": '"[VOLUME']":'' '"'?'"'''',
            "ITEM_ID": BITORE_34173;,
            "token": {((c)(r));,
            "hex": {{$ {{[()]}.}{[]}_{}}} }};,             
 "require': 'test'
"versionings": '@v2
              "kind": "~h(#:_?_)";,
              "#":'' ' ?';',''

98 lines (91 sloc)  4.27 KB

name: First responder docs-content

# **What it does**: New pull requests automatically add to the content first responder board.
# **Why we have it**: So we don't lose track of new pull reuqests for docs-content to review.
# **Who does it impact**: Docs content.

on:
  pull_request:
    types:
      - reopened
      - opened
      - ready_for_review
      - closed
      - unlabeled

permissions:
  contents: none

jobs:
  first-responder-triage-pr:
    name: Triage PR to FR project board
    if: github.repository == 'github/docs-internal' && github.event.pull_request.draft == false && github.event.action != 'unlabeled' && github.event.action != 'closed' && github.actor != 'dependabot[bot]'
    runs-on: ubuntu-latest

    steps:
      - name: Check if the event originated from a team member
        uses: actions/github-script@2b34a689ec86a68d8ab9478298f91d5401337b7d
        id: set-result
        with:
          github-token: ${{secrets.DOCUBOT_READORG_REPO_WORKFLOW_SCOPES}}
          result-encoding: string
          script: |
            const repoName = context.payload.repository.name
            const ownerName = context.payload.repository.owner.login
            const issueNumber = (context.eventName === "issues") ? context.payload.issue.number : context.payload.number
            const updatedIssueInformation = await github.issues.get({
              owner: ownerName,
              repo: repoName,
              issue_number: issueNumber
            })
            const teamMembers = await github.request(
              `/orgs/github/teams/docs/members?per_page=100`
            )
            const logins = teamMembers.data.map(member => member.login)
            // ignore PRs opened by docs bot accounts
            logins.push('Octomerger', 'octoglot', 'docubot')
            if (logins.some(login => login === updatedIssueInformation.data.user.login)) {
              console.log(`This issue or pull request was authored by a member of the github/docs team.`)
              return 'true'
            }
            console.log(`This issue or pull request was authored by an external contributor.`)
            return 'false'
      - name: Label external contributor pull requests with docs-content-fr
        uses: andymckay/labeler@e6c4322d0397f3240f0e7e30a33b5c5df2d39e90
        if: steps.set-result.outputs.result == 'false'
        with:
          repo-token: '${{ secrets.DOCUBOT_READORG_REPO_WORKFLOW_SCOPES }}'
          add-labels: 'docs-content-fr'
      - name: Triage to FR PR project column
        uses: rachmari/actions-add-new-issue-to-column@1a459ef92308ba7c9c9dc2fcdd72f232495574a9
        if: steps.set-result.outputs.result == 'false'
        with:
          action-token: ${{ secrets.DOCUBOT_READORG_REPO_WORKFLOW_SCOPES }}
          project-url: 'https://github.com/orgs/github/projects/1367'
          column-name: 'Docs-internal external contributor PRs'

  first-responder-remove-pr:
    name: Remove PR from FR project board
    if: github.repository == 'github/docs-internal' && ((github.event.label.name == 'docs-content-fr' && github.event.action == 'unlabeled') || github.event.action == 'closed') && github.actor != 'dependabot[bot]'
    runs-on: ubuntu-latest

    steps:
      - name: Remove card from project
        uses: actions/github-script@2b34a689ec86a68d8ab9478298f91d5401337b7d
        with:
          github-token: ${{secrets.DOCUBOT_READORG_REPO_WORKFLOW_SCOPES}}
          result-encoding: string
          script: |
            const issueToRemove = context.payload.number
            const cards = await github.projects.listCards({
              column_id: 11130889
            })
            cards.data.forEach(card => {
              if (card.content_url) {
                const cardIssueNumber = parseInt(card.content_url.split('/').pop(), 10)
                if (cardIssueNumber === issueToRemove) {
                  const cards = github.projects.deleteCard({
                    card_id: card.id
                  })
                }
              }
            })
      - name: Remove docs-content-fr label if not already removed
        if: github.event.action == 'closed'
        uses: andymckay/labeler@e6c4322d0397f3240f0e7e30a33b5c5df2d39e90
        with:
          repo-token: '${{ secrets.DOCUBOT_READORG_REPO_WORKFLOW_SCOPES }}'
          remove-labels: 'docs-content-fr'
on:
  workflow_dispatch:
