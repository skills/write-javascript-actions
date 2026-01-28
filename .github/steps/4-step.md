## Step 4: Add Action Metadata

Great work! :tada: You've successfully bundled your Dad Jokes GitHub Action into a single file.

Now it's time to create the **action metadata file** - this special file tells GitHub exactly how to use your action when someone includes it in their workflow!

### 📖 Theory: Action Metadata

Every GitHub Action requires a metadata file that defines how the action should be executed and what parameters it accepts.

#### Metadata File Requirements

The metadata file has specific requirements:

- **Filename**: Must be `action.yml`
- **Required for**: All actions types - JavaScript, [Docker container](https://docs.github.com/en/actions/tutorials/use-containerized-services/create-a-docker-container-action), and [composite action](https://docs.github.com/en/actions/tutorials/create-actions/create-a-composite-action)
- **Format**: Written in YAML syntax

#### Core Metadata Parameters

| Parameter         | Description                                                    | Required |
| ----------------- | -------------------------------------------------------------- | :------: |
| **`name`**        | The name of your action.                                       |    ✅    |
| **`description`** | A short description of what your action does.                  |    ✅    |
| **`author`**      | The name of the action's author.                               |    ○     |
| **`inputs`**      | Data that the action expects to receive.                       |    ○     |
| **`outputs`**     | Data that downstream steps in the workflow can use             |    ○     |
| **`runs`**        | Tells GitHub how to execute your action.                       |    ✅    |
| **`branding`**    | Color and icon for your action in GitHub Marketplace.          |    ○     |

#### JavaScript Action `runs` Configuration

For JavaScript actions, the `runs` section needs:

- **`using`**: Which Node.js version to use
- **`main`**: The main JavaScript file to run

> [!TIP]
> For complete details on all available metadata parameters, optional fields, and advanced configurations, see the official [GitHub Actions metadata syntax documentation](https://docs.github.com/en/actions/reference/workflows-and-actions/metadata-syntax).

---

### ⌨️ Activity: Create Metadata File

1. Create `action.yml` at the repository root (same level as `package.json`).

   ```yaml
   name: "Joke Action"
   description: "Fetches a random joke and exposes it as an output"

   outputs:
     joke:
       description: "The fetched joke text"

   runs:
     using: node24
     main: dist/index.js
   ```

1. Commit and push the action metadata file to the `main` branch:

   ```sh
   git add action.yml
   git commit -m "Add action metadata file"
   git push
   ```

1. With the changes pushed to GitHub, Mona will check your work and share the next steps.