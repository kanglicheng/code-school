# Fullstack Project Github Management

## Phase 1: Create the Repo
Create a new repo.

![Screenshot: creating new repo][create_new_repo]

Give it a good name.

![Screenshot: naming repo][name_repo]

Copy the git url, if you need it.

![Screenshot: git url][copy_git_url]

Lastly, add your project manager as a collaborator to your repo. To do this, go the 'Settings' tab, and click 'Collaborators'.

![Add Collaborators][add_project_manager]

## Phase 2: Create the Proposal

Your fullstack project proposal is a documentation of your planning process in the form of a GitHub Wiki. Look [here](#) for the overall requirements for the proposal.

In your new fullstack repo, create a new wiki.

![Screenshot: create wiki][create_wiki]

Create a new page. The basic pages are:
* Home
* Proposal
* Wireframes
* Database Schema
* API Endpoints
* Sample State

Make sure to use the layout menu to give the appropriate styling to your documents (e.g. code should be in code blocks). Your project manager will review your proposal and give you feedback on any major issues.

![Screenshot: add page in wiki][proposal_wiki]

## Phase 3: Milestones and MVPs

Every fullstack project has 7 core MVPs (Minimum Viable Products). You need to create a separate **milestone** for *each* MVP.

Milestones are a way of setting a timeline for completing tasks in GitHub.

To create a milestone, go to the issues tab.

![issues tab][issues]

Click on 'Milestones', and then click 'New Milestone'.

The title of each milestone should be the main goal of your MVP. You can add a brief description as well.

Make sure to set a due date for each milestone. Your project manager will hold you to these dates, and let you know if you need to make adjustments.

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

For every MVP, you will need an issue called PM Review (Project Manager Review) set up to be part of the coresponding milestone for that MVP.

For example: If one of your MVPs is 'Front-end Authentication', you should create an issue called 'PM Review: Front-end Authentication', and you should _assign_ that issue to your project manager.

After you have finshed all of the issues for an MVP, your project manager will review your MVP and provide feedback. Your project manager will close the 'PM Review' issues when they are satisfied with your work.

![Assign issue][pm_review_issue]

From the 'Issues' tab, you can view all open issues.

![Issues overview][issues_overview]

As you create your app, you will be able to close issues. There are two main ways to do this:
1. Click on the issue, scroll to the bottom, and click "Close Issue"
2. Close the issue when you commit working code.

Once you have tested the part of your code that fulfills the needs of the issue, you can include a [special command][git_keywords] in your git commit message telling GitHub to automatically close the issue. Simply include the keyword and the number of the issue that you are closing, and GitHub does the rest!

![terminal][gcm_resolves_issue]

After you have closed an issue, any milestones associated with that issue will be updated. You can click on any milestone to see the remaining issues for that milestone.

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