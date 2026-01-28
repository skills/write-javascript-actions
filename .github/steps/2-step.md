## Step 2: Create Source Files & Run Locally

Nice! Now that we have the project initialized and dependencies installed, it's time to create the source files for your Dad Jokes GitHub Action.

### 📖 Theory: The GitHub Actions Toolkit

The `@actions/core` library is the main library from the [GitHub Actions Toolkit](https://github.com/actions/toolkit), a collection of packages for building JavaScript GitHub Actions. It provides essential methods to interact with the GitHub Actions runtime environment, accept action inputs, and produce outputs for other workflow steps.

> [!TIP]
> The [GitHub Actions Toolkit](https://github.com/actions/toolkit) includes other useful libraries like `@actions/github` for interacting with the GitHub API and `@actions/artifact` for uploading and downloading artifacts. 
> 
> Visit the [actions/toolkit](https://github.com/actions/toolkit) repository for more.


### ⌨️ Activity: Implement the Dad Jokes Action

Let's create the source files and implement the logic for your action.

1. Create `src/` directory to hold your JavaScript files:

1. Create `src/joke.js` file to hold the logic for fetching a joke from the `icanhazdadjoke.com` API:

   ```js
   const request = require("request-promise");

   const options = {
     method: "GET",
     uri: "https://icanhazdadjoke.com/",
     headers: {
       Accept: "application/json",
       "User-Agent": "Writing JavaScript action GitHub Skills exercise.",
     },
     json: true,
   };

   async function getJoke() {
     const res = await request(options);
     return res.joke;
   }

   module.exports = getJoke;
   ```

   The `getJoke` function makes an HTTP GET request to the `icanhazdadjoke.com` API and returns a random dad joke.

   We export the `getJoke` function so it can be used in other files.

1. Create `src/main.js` that will be the main entry point for your action:

   ```js
   const getJoke = require("./joke");
   const core = require("@actions/core");

   async function run() {
     const joke = await getJoke();
     console.log(joke);
     core.setOutput("joke", joke);
   }

   run();
   ```

   We call the `getJoke` function and follow up with `core.setOutput()` to set the `joke` output of your GitHub Action.

1. Run the action locally to verify it works:

   ```sh
   node src/main.js
   ```

1. Commit and push:

   ```sh
   git add src/
   git commit -m "Add Dad Joke action source files"
   git push
   ```

1. With the changes pushed to GitHub, Mona will check your work and share the next steps.
