# Fullstack Project Setup

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

![Add Collaborators][add_project_manager]

## Phase 2: Create Your Design Documents

Your fullstack project design docs are a documentation of your planning process in the form of a Github Wiki. Look [here](./) for an explanation of each of the design docs below.

Also, see the [sample design docs][sample].

In your new fullstack repo, create a wiki.

![Screenshot: create wiki][create_wiki]

Create these pages:
* MVP List
* Database Schema
* Routes
* Sample State
* Component Hierarchy
* Wireframes

On the home page, create links to each of these pages.

Make sure to use the layout menu to give the appropriate styling to your documents (e.g. code should be in code blocks). Your project advisor will review your design docs and give you feedback on any major issues.

![Screenshot: add page in wiki][design-docs-wiki]

## Phase 3: Complete Your Design Docs

Go back over all of the design docs you did for homework and make any necessary changes. Also complete any of the above docs that were not completed for homework.

Lastly, add your project advisor as a collaborator to your repo. To do this, go the 'Settings' tab, and click 'Collaborators'.

[sample]: https://www.github.com/appacademy/bluebird/wiki

## Phase 4: Milestones and MVPs

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

Create milestones for all of your MVPs.

Don't forget the `Production README` and `Hosting on Heroku` milestones!

## Phase 5: Labels and Issues

In GitHub, issues are like tasks. They can be labeled, assigned to team members, and attached to milestones. Before we start the project, let's set up our GitHub workspace by creating some custom labels.

### Setting Up Labels

On the issues tab, click 'Labels'. You can edit, delete, and re-color the existing labels, and you can create your own labels. Below are the minimum required labels you will need.

![labels][labels]

We will apply these labels to any issues we create once we start the project.

## Phase 6: During the Project

To see what you'll be doing during the project, take a look at [these instructions](../project/during-the-project.md)

[create_new_repo]: ./assets/create_new_repo.png
[name_repo]: ./assets/name_repo.png
[copy_git_url]: assets/copy_git_url.png

[add_project_manager]: assets/add_project_manager.png

[create_wiki]: assets/create_wiki.png
[design-docs-wiki]: assets/proposal_wiki.png

[issues]: assets/issues.png
[create_milestone]: assets/create_milestone.png
[milestone_empty]: assets/milestone_empty.png

[labels]: assets/labels.png

