# Full-stack Design Docs Preparation: Routes

Now that we know how to delegate some of our app state to our frontend router, we should begin thinking about what routes we need in our full-stack projects. Let's consider frontend routes first, then backend.

Take some time to research the site you are cloning. Review each of the views you will be rendering, keeping these things in mind:
- Frontend
  - What resource(s) is being displayed?
  - Is a specific record is being displayed? Can it be identified by a wildcard in the URL?
  - If search results are being displayed, is the [query string][query-string] in the URL bar?
- Backend
  - What API route should the displayed resource(s) make requests to?
  - What other CRUD is happening on the page? Do we need create/edit/delete routes?

[query-string]: https://en.wikipedia.org/wiki/Query_string

Create a rough-draft of your frontend and backend routes. For the frontend, try to model your app's routes to the one you are cloning. Remember, our frontend routes are being used to dictate what components will be rendered, so make sure to consider your route params. Our backend routes should generally remain RESTful, though there may be views that require multiple resources or  and therefore a custom route.

## Example

Here's yet another example from _Bluebird_, a Twitter clone:

---
# Bluebird Routes

## Frontend Routes
+ `/login`
+ `/signup`
+ `/feed` - chirp feed, homepage
+ `/users/:userId` - user profile
+ `/chirps/new` - create a chirp
+ `/chirps/:chirpId` - chirp show
+ `/chirps/:chirpId/edit` - update a chirp

---

## API Endpoints

### `users`
+ `GET /api/users` - returns the user information for the User Search feature
+ `POST /api/users` - sign up

### `chirps`
+ `GET /api/chirps` - returns relevant chirps (filtered by `data`/`params`)
+ `GET /api/chirps/:id` - returns chirp
+ `POST /api/chirps` - creates a chirp
+ `PATCH /api/chirps/:id` - edit a chirp
+ `DELETE /api/chirps/:id` - remove a chirp

### `likes`
+ `POST /api/likes` - like a chirp
+ `DELETE /api/likes` - unlike a chirp

Note: likes does not include a `GET` route because these routes will render `'api/chirps/show'`. See [Sample State](https://github.com/appacademy/bluebird/wiki/sample-state).
