<!--
  <<< Author notes: Step 4 >>>
  Start this step by acknowledging the previous step.
  Define terms and link to docs.github.com.
-->

## Step 4: Create the JavaScript files for your action

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
    "User-Agent": "Writing JavaScript action GitHub Skills course.",
  },
  json: true,
};

async function getJoke() {
  const res = await request(options);
  return res.joke;
}

module.exports = getJoke;
```

Need an advanced description of the <code>joke.js</code> source code?

We first bring in the `request-promise` library that we installed earlier using `npm`.

Next we define a set of `options` that the `request-promise` library will use when it makes the request.

Read more about [request-promise](https://github.com/request/request-promise/)

Inside of the `options` block we add a key named `headers`. This defines the HTTP headers that the **icanhazdadjoke** API expects in each request that comes it's way.

**icanhazdadjoke** cares the most about the keys, **Accept** and **User-Agent**, so we need to make sure we fill them in.

Next we define an **asynchronous JavaScript function** to make the request for us, storing the JSON Object that is returned in a variable named `res`.

Lastly, we `return` the `res.joke` which is only the value associated with the `joke` key of the JSON Object. This value will be random every time our action runs because of how we are interacting with the **icanhazdadjoke** API.

This file finishes up by exporting the newly created function so that we can use it in our `main.js` file.

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

Need an advanced description of the <code>main.js</code> source code?

Like we did in the `joke.js` file, we are first going to bring in our dependencies. Only this time, our dependencies include something we wrote! To do that we simply use `require()` to point to the location of the file we wish to bring in.

We also bring in `@actions/core` so that we can set the output of our action.

Next we write another **asynchronous JavaScript function** that stores the return value of `getJoke()` in a variable called **joke**.

Then we log the joke to the console.

Finally we finish the function with by setting the contents of the joke as the value of the `joke-output` output parameter. We will use this output later in the course.
_Don't forget to call the `run()` function._

### :keyboard: Activity 1: Creating the JavaScript files for your new action.

1. Create and add the following contents to the `.github/actions/joke-action/joke.js` file:

   ```javascript
   const request = require("request-promise");

   const options = {
     method: "GET",
     uri: "https://icanhazdadjoke.com/",
     headers: {
       Accept: "application/json",
       "User-Agent": "Writing JavaScript action GitHub Skills course.",
     },
     json: true,
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
6. Wait about 20 seconds then refresh this page (the one you're following instructions from). [GitHub Actions](https://docs.github.com/en/actions) will automatically update to the next step.
