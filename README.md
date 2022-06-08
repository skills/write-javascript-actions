<!--
  <<< Author notes: Header of the course >>>
  Include a 1280×640 image, course name in sentence case, and a concise description in emphasis.
  In your repository settings: enable template repository, add your 1280×640 social image, auto delete head branches.
  Next to "About", add description & tags; disable releases, packages, & environments.
  Add your open source license, GitHub uses Creative Commons Attribution 4.0 International.
-->

<img src="https://repository-images.githubusercontent.com/206795795/9607e200-586d-11ea-97a7-4ecd37d628fc" width=300 align=right>

# Connect the Dots in a GitHub Repository

_This course will teach you skills for finding relevant conversations, commits, and projects in a repository._

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

**To start this course: [<img width="150" alt="Use this template" src="https://user-images.githubusercontent.com/1221423/148581131-555c0fb8-5361-4450-a760-75fa6219a2fc.png">](https://github.com/InfomagnusOrg/github-connecting-dots/generate)**

> We recommend creating a public repository, as private repositories will [use Actions minutes](https://docs.github.com/en/billing/managing-billing-for-github-actions/about-billing-for-github-actions).<br>
> After you make your own repository, wait about 20 seconds and refresh. I will go to the next step.

Have you ever worked in a repository with a lot of history? Perhaps you've had to track down related issues and pull requests in the past, or you've had to find who committed a particular change. If you've ever found yourself in any of these situations, you'll know how important it is to navigate your workspace.

- **Who is this for**: Developers, GitHub users, users new to Git, students, managers, teams.
- **What you'll learn**: 
  - Find relevant issues and pull requests
  - Search history to find context
  - Make connections within GitHub to help others find things
- **What you'll build**: Reposity with existing commits, duplicated isssus and content defect to be fixed.
- **Prerequisites**: Before you take this course, you may want to go through the [Introduction to GitHub](https://lab.github.com/githubtraining/introduction-to-github) course on Learning Lab. 
- **How long**: This course is three steps long and takes less than 15 min to complete.
- **Projects Used**: [docsify](https://docsify.js.org/#/), a magical documentation site generator

</details>

<!--
  <<< Author notes: Step 1 >>>
  Choose 3-5 steps for your course.
  The first step is always the hardest, so pick something easy!
  Link to docs.github.com for further explanations.
  Encourage users to open new tabs for steps!
  TBD-step-1-notes.
-->
Welcome to this Learning Lab course about finding your way through the history of GitHub repositories. For example, you could be working in repositories with a lot of history, many collaborators, or many files.

Before you take this course, you may want to go through the [Introduction to GitHub]({{ host }}/{{ course.Owner.login }}/introduction-to-github) course on Learning Lab.

In this course, you'll learn how to do lots of things, like:

- Find relevant issues and pull requests
- Search history to find context
- Make connections within GitHub to help others find things

### Cross-linking issues and pull requests

GitHub has special capabilities to help reference other information on GitHub. For example, when you reference another issue or pull request by number, that number will be hyperlinked. At the same time, a cross-reference is created in the linked issue or pull request. This two-way reference helps people track the relationship of information across GitHub.

![a screenshot of an issue linking to a PR, and a PR with a cross-reference to the issue](https://user-images.githubusercontent.com/16547949/67594663-d9710900-f732-11e9-8df8-d3173d952bd5.png)

<details id=1 open>
<summary><strong>:zap: Step 1: Resolve Duplicate Issues</strong></summary>

### Welcome to "Connect the dots in a GitHub repository"! :wave:

Below, you will see a reference to another issue. The other issue references _this_ issue. The other issue appears to be a duplicate, so it would be a good idea to close it.
  
### Creating references

When you link to another issue, a reference within GitHub is automatically created. In fact, you don't even need to include the full link. If you were to type `#5` within a comment, that would turn into a link to issue or pull request number 5.

When you want to create a crosslink, try typing the title of an issue or pull request directly after you type the `#` symbol. GitHub will suggest issues or pull requests that will link to the right place. To learn even more, check out the [Autolinked References and URLs](https://help.github.com/en/articles/autolinked-references-and-urls) article.

### :keyboard: Activity: Find and close the cross-linked issue

1. Navigate to the other issue referenced from this issue
2. Close that issue

</details>

<!--
  <<< Author notes: Step 2 >>>
  Start this step by acknowledging the previous step.
  Define terms and link to docs.github.com.
  TBD-step-2-notes.
-->

<details id=2>
<summary><strong>:dart: Step 2: Find a commit in history</strong></summary>

### You did Resolve Duplicate Issues! :tada:

An important part of version control is the ability to look into the past. By using `git blame`, and finding the story behind a commit, we're able to do more than _blame_ people for code. We're able to see the story around why a commit was made - what is the associated pull request? Who approved the pull request? What tests were run on that commit before it was merged?

The obvious reason to find things in history is to know about history. With issues and pull requests, we see a more complete story about history - not just the bare minimum.

### What's `git blame`?

`git blame` is a Git functionality that shows what revision and author last modified each line of a file. Information like who made a commit, when, and even why can be found this way. If you aren't sure who introduced certain changes to a file, you can use `git blame` to find out. While `git blame` sounds rather accusatory, this can be used to understand the context around decisions.

### What's a SHA?

A SHA is a reference to a specific object. In this case, it's a reference to a commit. On GitHub, you can look at a specific commit to see the changes introduced, by whom, and if they were a part of a pull request.

### :keyboard: Activity: Find commit in history

1. Navigate to the Code tab of this repository
   - _Tip: start this process in a new tab, since you will need it later_
2. Click `docs` to navigate into the `/docs` directory
3. Click `_sidebar.md` to view the file
4. On the top right side of the file, click **Blame** to see the details of the most recent revision
5. Click the commit message, `add sidebar to documentation` to see the commit details
6. Copy some part of the SHA (at least the first 6 characters of the 40 character hexadecimal string listed after `commit`)
7. Comment (at least the first 6 characters of) the SHA in **this issue**

</details>

<!--
  <<< Author notes: Step 3 >>>
  Start this step by acknowledging the previous step.
  Define terms and link to docs.github.com.
  TBD-step-3-notes.
-->

<details id=3>
<summary><strong>:wrench: Step 3: Fix a broken sidebar</strong></summary>

### Nice work finishing Find a commit in history :sparkles:

Thanks for finding that commit! We now know that the sidebar was indeed added, and it was done in that commit. Let's see if we can dig a little deeper to find out if any planning or conversation occurred around this change. 

# Context

As we've already seen, conversations in issues and pull requests can reference other work.

But the amount of context goes much further than crosslinks - Remember, Git is version control! For example, the commit that you found in the last step is connected with much more information: 

- Who made the commit
- What other changes were included
- When the commit was made
- Which pull request the commit was a part of

The pull request is important because it goes beyond knowing when a commit happened - you can know _why_ a commit happened. Finding history is not about _blaming_ anyone, but about seeing the bigger picture. Why were decisions made? Who was involved? What were the build outputs and test results for each commit? Who requested changes, and who approved them?

### A story about finding experts

Imagine you find an internal white-paper on a really exciting topic. You're looking for experts to help you research this topic for an upcoming project. When you find this article, you're ecstatic! But, there's no author referenced in the plain text.

You can see that it's written in markdown, and it's versioned in GitHub. It's already a part of the `main` branch, but you want to know who was involved in creating this. You use `git blame` to see the author(s), and you can find the pull request associated with that branch. Now, you can see who all of the authors were, who the reviewers were, and if there are any other issues or conversations related to this topic.

Just like that, you've found the people at your company who can help move your project forward. :tada:

### Finding a pull request from a commit

When you're looking at a commit on GitHub, you can see a lot of information. From this view, you can also find a link to the pull request in which the commit was created. We'll use this in the next step.

![screenshot of a view of a commit on GitHub, highlighting the link to the pull request](https://user-images.githubusercontent.com/16547949/67341250-3edbb480-f4fd-11e9-805a-6bce5a8ba2d1.png)

### :keyboard: Activity: Fix a broken sidebar

1. In the main branch [Edit the `docs/_sidebar.md` file](/edit/docs/_sidebar.md)
2. Correct the spelling of the reference `(doc-references__.md)` on line 4 by changing it into `(doc-references.md)`
3. Commit the changes on the `fix-sidebar` branch
4. In the [Pull requests tab](/pulls), create a pull request by comparing 'main' branch to 'fix-sidebar' bramch
5. Using the **Assignees** section on the right side, assign yourself to the pull request
6. In the PR comment add 'Closing #2' and autolink issue #2 
6. Merge this pull request
7. Delete the branch 'fix-sidebar'

</details>

<!--
  <<< Author notes: Finish >>>
  Review what we learned, ask for feedback, provide next steps.
-->

<details id=4>
<summary><strong>:checkered_flag: Finish</strong></summary>

### Congratulations friend, you've completed this course! :tada:

In this course, you've learned a lot about finding and sharing information. Within a GitHub repository, you can find history about what changes were made, and more importantly, _why_ changes were made.

### What's next?

- We'd love to hear what you thought of this course [in our community forum](https://github.community/c/education/github-learning-lab/34).
- [Take another GitHub Learn course](https://github.com/githublearn).
- [Read the GitHub Getting Started docs](https://docs.github.com/en/get-started).
- To find projects to contribute to, check out [GitHub Explore](https://github.com/explore).

</details>

<!--
  <<< Author notes: Footer >>>
  Add a link to get support, GitHub status page, code of conduct, license link.
-->

---

Get help: [Post in our community forum](https://github.community/c/education/github-learning-lab/34) &bull; [Review the GitHub status page](https://www.githubstatus.com/)

&copy; 2022 GitHub &bull; [Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/code_of_conduct.md) &bull; [CC-BY-4.0 License](https://creativecommons.org/licenses/by/4.0/legalcode)
