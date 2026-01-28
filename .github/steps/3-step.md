## Step 3: Bundle the Action

Good job! :tada:

Now that you've created the source files for your Dad Jokes GitHub Action and tested it locally, it's time to bundle the action so it can be used in GitHub workflows.

### 📖 Theory: Bundling Your Action

When someone uses your action in their workflow, GitHub downloads and executes it as a complete package of code. This means you must include any package dependencies required to run the JavaScript code, such as the `@actions/core` and `request-promise` packages your action uses.

Rather than committing your `node_modules` directory (which causes problems with repository size and performance), you can use bundling tools like `@vercel/ncc` to combine your code and dependencies into a single `dist/index.js` file for distribution.

### ⌨️ Activity: Build Setup & Bundle

1. Add a new `build` script to `package.json` (inside the existing `scripts` object):

   ```json
   "scripts": {
      // Existing scripts...
     "build": "ncc build src/main.js -o dist"
   }
   ```

1. Run the build command. This should create a `dist/` directory with a bundled `index.js` file:

   ```sh
   npm run build
   ```

1. (optional) Run the bundled action to verify it works:

   ```sh
   node dist/index.js
   ```

1. Commit and push the changes to the `main` branch:

   ```sh
   git add .
   git commit -m "Add ncc build script and bundled dist/index.js"
   git push
   ```

1. With the changes pushed to GitHub, Mona will check your work and share the next steps.