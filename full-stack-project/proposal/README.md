# Fullstack Project Github Management

## Phase 1: Create the Repo

1. Create a new Rails project.
  - `--skip-turbolinks=true`
  - `--database=postgresql`
2. The rails skeleton includes a .gitignore file. In addition to what is already there, add the following:

```
// .gitignore

// ... a bunch of preloaded ignores

// To add:
node_modules/
bundle.js
bundle.js.map
.byebug_history
.DS_Store
npm-debug.log
```

3. Create a new repo and give it a good name.

![Screenshot: naming repo][name_repo]

4. Commit your files and push to your remote.

5. Lastly, add your project advisor as a collaborator to your repo. To do this, go the 'Settings' tab, and click 'Collaborators'.

![Add Collaborators][add_project_manager]

## Phase 2: Create the Proposal

Your fullstack project proposal is a documentation of your planning process in the form of a GitHub Wiki. Look [here](#) for the overall requirements for the proposal.

In your new fullstack repo, create a new wiki.

![Screenshot: create wiki][create_wiki]

Create these pages:
* Home (the initial wiki page)
* MVP List
* Database Schema
* Routes
* Sample State
* Component Hierarchy
* Wireframes

Make sure to use the layout menu to give the appropriate styling to your documents (e.g. code should be in code blocks). Your project advisor will review your proposal and give you feedback on any major issues.

![Screenshot: add page in wiki][proposal_wiki]

## Phase 3: Milestones and MVPs

Every fullstack project has 7 core MVPs (Minimum Viable Products). You need to create a separate **milestone** for *each* MVP.

Milestones are a way of setting a timeline for completing tasks in GitHub.

To create a milestone, go to the issues tab.

![issues tab][issues]

Click on 'Milestones', and then click 'New Milestone'.

The title of each milestone should be the main goal of your MVP. You can add a brief description as well.

Make sure to set a due date for each milestone. Your project advisor will hold you to these dates, and let you know if you need to make adjustments.

![create a milestone][create_milestone]

After creating a milestone, you will see an empty progress bar. Later on, you will learn how to use it.

![progress bar][milestone_empty]

## Phase 4: Create Labels and Issues

In GitHub, issues are like tasks. They can be labeled, assigned to team members, and attached to milestones. Before you start making issues, you will want some custom labels.

On the issues tab, click 'Labels'. You can edit, delete, and re-color the existing labels, and you can create your own labels. Below are the minimum recommended labels you will need.

![labels][labels]

With your new labels and your new milestones, you are ready to create your issues.

Start by breaking your MVPs into smaller chunks or steps. Make an issue for each step.

You can apply the appropriate labels and set the issue to be part a particular milestone.

![Create Github issue][create_issues]

The issues you assign to each of your MVPs will vary depending on the task at hand, but here is an example for `chirps` that you can use to guide you:

+ Chirps Backend (can be split into: DB, model, controller, views if desired)
+ Chirps Redux Loop (can be split up into: ajax, actions, reducer if desired)
+ Chirps Presentational Components
+ Chirps Styling
+ Chirps Smooth, bug-free navigation
+ Chirps Adequate and appropriate seeds

For every MVP, you will need an issue called `PA Review: {task}` (Project Advisor Review) set up to be part of the corresponding milestone for that MVP.

For the example above, you should create an issue called `PA Review: Chirps`. When you have fully completed an MVP, _assign_ that issue to your project advisor. Upon assigning them, they will receive a notification and know to review your work (both the code and Heroku!).

After you have finished all of the issues for an MVP, your project advisor will review your MVP and provide feedback. Your project advisor will close the 'PA Review' issues when they are satisfied with your work for that milestone.

Don't forget to add issues for `Production README` and `Hosting on Heroku`!

![Assign issue][pm_review_issue]

From the 'Issues' tab, you can view all open issues.

![Issues overview][issues_overview]

As you create your app, you will write enough code to satisfy an issue. Make sure that you have tested that part of your code thoroughly!

If this issue is a `core-feature` or was created by your PA, you should:
1. Comment on the issue mentioning that you have completed it. Make sure to include your PA's username!
2. They will review your code and Heroku site.
  + If they are satisfied, your PA will close the issue.
  + If there are any additional changes to be made, your PA will leave a comment describing the them. At which point, you should make those changes and then leave a new comment with your PA's Github username when it is completed for another review.

If you created the issue and it is **not** a `core-feature`, feel free to close it yourself! You can include a [special command][git_keywords] in your git commit message telling GitHub to automatically close the issue. Simply include the keyword and the number of the issue that you are closing, and GitHub does the rest!

![GCM resolves issue][gcm_resolves_issue]

After your PA has closed an issue, any milestones associated with that issue will be updated. You can click on any milestone to see the remaining issues for that milestone.

![50% completed milestone][milestones_overview]


[create_new_repo]: ./assets/create_new_repo.png
[name_repo]: ./assets/name_repo.png
[copy_git_url]: assets/copy_git_url.png

[add_project_manager]: assets/add_project_manager.png

[create_wiki]: assets/create_wiki.png
[proposal_wiki]: assets/proposal_wiki.png

[issues]: assets/issues.png
[create_milestone]: assets/create_milestone.png
[milestone_empty]: assets/milestone_empty.png

[labels]: assets/labels.png

[create_issues]: assets/create_issues.png
[pm_review_issue]: assets/pm_review_issue.png
[issues_overview]: assets/issues_overview.png

[git_keywords]: https://help.github.com/articles/closing-issues-using-keywords/

[gcm_resolves_issue]: assets/gcm_resolves_issue.png
[milestones_overview]: assets/milestones_overview.png
