# Full-stack Design Docs Preparation: State Shape

We've learned how important our state shape (and normalization) is to our keeping our application logic simple as our app scales.
Following what we've done in class, let's work on structuring our redux state.

Again, take some time to research the app you are clone. While referring to your [MVPs][mvps], keep these things in mind:
- What resources will I be fetching from the database?
- What else do I need to keep track of in my app? (current user info, form errors, loading spinners, sorting strategies for lists, etc.)

[mvps]: ../../proposal/mvp-list.md

Create an outline of what your app's store will look like. This should be like a store snapshot, with each slice populated with some dummy data. Remember, we want to separate our concerns to keep it simple, so try to avoid putting every slice at the top-level. It is fairly common to create specific top-level reducers to delegate work to nested reducers. Some examples:

* `entities` - contains all resources fetched from database
* `ui` - contains view configuration data, such as: sorting, pagination, loading screens, et.
* `errors` - contains error information for different forms

## Example

Here's another example from _Bluebird_, our Twitter clone:

---

# Bluebird Sample State

```js
{
  entities: {
    chirps: {
      1: {
        id: 1,
        body: "bluebirds like blueberries",
        author_id: 11,
        likes: 12,
        // current_user_likes allows us to know whether to post or delete a user's like!
        current_user_likes: false
      },
      2: {
        id: 2,
        body: "bluebirds also like blue potatoes",
        author_id: 25,
        likes: 45,
        current_user_likes: true
      },
      3: {
        id: 3,
        body: "mayhaps I will sleep for the winter",
        author_id: 25,
        likes: 16,
        current_user_likes: true
      }
    },
    users: {
      11: {
        id: 11,
        username: "blue_macaw",
        img_url: "http://maxpixel.freegreatpicture.com/static/photo/1x/Wildlife-Tropical-Pet-Colorful-Macaw-Parrot-Bird-410144.jpg"
      }
      23: {
        id: 23,
        username: "blue_parakeet",
        img_url: "https://cdn.pixabay.com/photo/2013/11/03/14/56/bird-204842_960_720.jpg"
      },
      25: {
        id: 25,
        username: "blue_toucan",
        img_url: "https://cdn.pixabay.com/photo/2015/10/01/16/43/toucan-967334_960_720.jpg"
      }
    }
  },
  ui: {
    loading: true/false
  },
  errors: {
    login: ["Incorrect username/password combination"],
    chirpForm: ["Chirp body cannot be blank"],
  },
  session: {
    id: 57,
    username: "blue_hawk",
    img_url: "https://cdn.pixabay.com/photo/2013/12/29/03/47/hawk-234999_960_720.jpg"
  }
}
```
