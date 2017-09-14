# Full-stack Proposal Preparation: Component Hierarchy

Now that we are React+Redux wizards, we should turn our gaze to the future, to our full-stack projects!

Take some time to research the site you are cloning. While referring to to your [MVPs][mvps], keep these things in mind:
- What views are required?
- How can these views be broken down into React components? Think boxes-in-boxes.
- Which components can be reused in different components?
- What data does each component need from our redux state?
  - Does it need to `connect` to the store or can it be passed down from a parent as `props`?

[mvps]: ../../proposal/mvp-list.md

Create a rough-draft of your component hierarchy (starting from `App`) which includes a list of the needed components (per view) in a hierarchy with the data source for each component. While not required, we also recommend laying out your component hierarchy visually (using wireframes).

## Example

Here's an example for _Bluebird_, a Twitter clone (with wireframes).

**NB** Any component ending in `Container` will `connect` its nested component to the Redux store.

---
# Bluebird Component Hierarchy

## General
+ `App`
  + `NavBar`
  + `MainPage` (all other Components are rendered inside here)
  + `Footer`

## Session Form
+ `SessionFormContainer`
  + `SessionForm`

![session-form](https://raw.githubusercontent.com/appacademy/bluebird/master/wiki/bluebird_session_page.png)

---

## Dashboard / Profile
+ `ChirpIndexContainer` / `ProfileIndexContainer`
  + `ChirpIndex` (can be reused!)
    + `ChirpIndexItem`

![dashboard](https://raw.githubusercontent.com/appacademy/bluebird/master/wiki/bluebird_dashboard_page.png)

---

## Chirp Show
+ `ChirpShowContainer`
  + `ChirpShow`

![chirp-show](https://raw.githubusercontent.com/appacademy/bluebird/master/wiki/bluebird_show_chirp_page.png)

---

## Chirp Form
+ `ChirpFormContainer`
  + `ChirpForm`

![chirp-form](https://raw.githubusercontent.com/appacademy/bluebird/master/wiki/bluebird_chirp_form_page.png)

---

## User Search
+ `UserSearchIndexContainer`
  + `UserSearchIndex`
    + `UserSearchIndexItem`

![user-search](https://raw.githubusercontent.com/appacademy/bluebird/master/wiki/bluebird_user_search.png)
