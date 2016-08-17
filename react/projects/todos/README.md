# ReduxTodos

## Overview

In this project, you will create an app that lets people create and manage a todo list. Users of your app will be able to add items to their todo list, delete items from it, and mark items as either "done" or "not done."
Eventually, every item in the list will be able to have its own sub-list of "steps" that can be added, deleted, and marked as "done."

Today's project uses the React/Redux frontend that you used on the Redux Piano app yesterday. However, this project will also have a Rails backend so that every change made on the frontend will persist.

## Phase 0: Rails backend

In this phase you will create a Rails app that stores `Todo`s and serves JSON in response to HTTP requests.

+ Create a new rails project using `--database=postgresql` and `--skip-turbolinks`
  + Update your Gemfile with `better_errors`, `binding_of_caller`, `pry-rails`, and `annotate`
+ Create a `Todo` model with `title`, `body`, and a boolean `done`
+ Create a `TodosController` to handle API requests
  + Nest your routes under `api/` and call your controller `Api::TodosController`
  + Your controller will need `index`, `create`, `update`, and `destroy` actions
  + Make your controller actions serve JSON-formatted responses
+ Create a `StaticPagesController` that will serve a `root` view with `<div id="content"></div>`
  + Don't forget to update `routes.rb` to `root to: Staticpages#root`
+ Start your server so that it can respond to HTTP requests

** Test your API: Try out your API endpoints using `$.ajax`. You should be able
to send `POST`, `GET`, `PATCH`, and `DELETE` requests and receive appropriate
responses. **

## Phase 1: Frontend structure

In this phase you will create a file system to structure your frontend,
configure your npm packages and webpack, and test that your frontend
configuration works.

+ Create a `/frontend` folder at the root directory of your project:
```
frontend
  + actions
  + components
  + middleware
  + reducers
  + store
  + util
  redux_todos.jsx
```
+ Run `npm install --save webpack react react-dom redux react-redux babel-core babel-loader babel-preset-react babel-preset-es2015` to set up React and Redux
  + This command installs the npm packages that we will be using to create our app
+ Set up your `webpack.config.js` file so that your bundle.js ends up in `app/assets/javascripts`
  + Run `webpack -w` to automatically compile your assets into `app/assets/javascripts/bundle.js` as you update them

** Test your setup: Set up your entry file (`redux_todos.jsx`) to render an `<h1>it worked</h1>` into your `#content` container. You should be able to visit
`localhost:3000` and confirm that you can see that it worked. **

---

## Phase 2: Todos Redux structure

In this phase you will create a Redux loop, including a store with reducers,
action creators and constants, middleware and API utils. This is how your
frontend will get information from your backend, store it, and pass it to your
frontend components.

### API Utils

Your API utilities are what actually make the `$.ajax` requests that will hit
your backend and fetch or (eventually) update your data. They will be called by
your middleware, and the data they receive will be passed on to your store. In
general, these utility functions will accept two arguments:
  + a callback to run if the request is successful
  + a callback to run in case of an error

+ Create a file `util/todo_api_util.js`
+ Write a function that accepts a `success` argument and passes that function as the success callback to a `$.ajax` call

Your function should look something like the following:
```javascript
export const fetchTodos(success, error) {
  $.ajax({
    method: // ,
    url: //,
    success,
    error
  });
}
```

** Test your code: Try running your function in the console and make sure that it calls the success function that you passed to it. **

### Reducers

Redux reducers manage the shape of our application state.

We want to build a state that allows us to easily add, remove, and update todos.
In a hash, we get O(1) querying, updating, and deleting if we know the id - if
we stored our list of todos in an array, all of these operations would be O(n).
Therefore, we'll be using the following state shape:

```js
{
  '1': {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  '2': {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
}
```

** Note that `todo.id` is the primary identifier **

#### `TodosReducer`

+ Create a file, `reducers/todos_reducer.js` that exports a reducing function. A reducer accepts two arguments:

  + `state` - the previous application state.
  + `action` - the action object being dispatched.

+ Remember that reducers should:

  + Never modify the `state` object
  + Return the default state if no arguments are passed
  + Return the `state` if the reducer doesn't care about the action

**NB**: You can use [`Object.freeze`][object.freeze] to prevent yourself from accidentally mutating the `state`. It's very good for testing.

Let's start by just setting up our `TodosReducer` to return its default state:

```js
const TodosReducer = (state = {}, action) => {
  switch(action.type) {
    //...
    default:
      return state;
  }
};

export default TodosReducer;
```

#### `RootReducer`

Create a new file, `reducers/root_reducer.js`. This file will be responsible for combining our multiple, domain-specific reducers. It will `export default` a single `RootReducer`.

  + Import `combineReducers` from `redux`
  + Import your `TodosReducer` function as `TodosReducer`
  + Create a `RootReducer` using `combineReducers`

So far, our default application state looks like this:

```js
{
  todos: {}
}
```

### Store

The Redux Store will hold a reference to our application state. The Store will also handle updating our state when actions are dispatched and it will tell the necessary components to re-render.

+ Create a new file, `store/store.js`
+ Import `createStore` from the `redux` library
+ Import our `RootReducer`
+ Define a new function `configureStore`
+ `configureStore` should return a new `Store` with the `RootReducer`

** Test your code: Call `configureStore()` from your entry file and set `window.store` equal to the result. This will allow you to call
`window.store.getState()` in your console. Make sure that this function returns
the default application state described above. **

Try setting a default value for state in your `TodosReducer`. This might look like this:

```js
// reducers/todos_reducer.js

const defaultState = {
  "1": {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  "2": {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};

const TodosReducer = (state = defaultState, action) => {
  //...
}
```

** Test your code: Try calling `window.store.getState()` from the console. Does
** your store's initial state match the default state you defined? **

### Selectors

Selectors are "getter" methods for the application state. They receive the state as an argument and often return a subset of the state data formatted in a specific way. In this case, we will want to present the `todos` as an array, rather than as values in an object.

+ Create a file `reducers/selector.js`
  + Write a method named `allTodos` that receives the state as an argument
    + Use `Object.keys(state.todos)` to get the keys for the `state.todos`
    + Map the array of todo ids to an array of todos
    + Return your new array

**NB**: Selectors don't have to be long functions - a one-line function that uses `map` in conjunction with `Object.keys` and sets a reasonable default of `[]` would work just fine.

** Test your code: Pass the value of `window.store.getState()` into your selector. Does it format the data into an array of `todos`? **

### Action Creators

Now you'll write the code that creates the `actions` that tell your `TodosReducer` how to update the state.

Let's write a couple action creators. The first one will request `todos` from the backend, and the second one will receive the requested `todos`.

Remember that:
  + `action` objects are plain-old javascript objects that have a `type` property.
  + Action creators don't directly interact with `Middleware` or the `Store`; they just produce objects. We then send those objects through our `Middleware` and to the `Store` by invoking `Store#dispatch`.

#### `requestTodos`

In order to request `todos` from the backend, we need to send a `GET` request to
the appropriate URL. We don't need to pass any information in order for this
request to succeed, so the `action` that triggers this event will only need the
appropriate `type` (`REQUEST_TODOS`).

Your code should look like the following:

```js
export const requestTodos = () => ({
  type: REQUEST_TODOS
});
```

#### `receiveTodos`

This action lets our state know to reset its list of `todos` and, as such, will
also need to pass along a new set of `todos`. Therefore, our `receiveTodos`
action creator should accept an argument `todos` and return an `action` with
`type` `RECEIVE_TODOS` and a `todos` property that represents all of our todos
data.

Your code should look like the following:
```js
export const receiveTodos = todos => ({
  type: RECEIVE_TODOS,
  todos
});
```

#### Constants

We use constants to represent `actionTypes`. They are used whenever
`actionTypes` are being set or read (i.e. in our action creators and in the
`switch` statements in our reducers and middleware).

+ Create and export constants both for `REQUEST_TODOS` and `RECEIVE_TODOS`.
  + For example, `export const REQUEST_TODOS = "REQUEST_TODOS";`

Don't forget to export both of the action creators you just made, as well as the
constants we created!

### Middleware

#### `TodoMiddleware`

Our `TodoMiddleware` will be responsible for triggering the api calls that
populate our `Store` with `todos`. Remember, Middleware receives dispatches
before the store. It can decide to intercept the dispatch, trigger another
dispatch, or simply pass on it and do nothing.

+ Create a file `middleware/todo_middleware.js`.
+ Import `REQUEST_TODOS` and `RECEIVE_TODOS` from your `todo_actions` file.
+ Refer to the [Middleware][middleware_reading] reading and set up the basic structure of a redux middleware function.
+ Implement a `switch` statement on `action.type` with a `default` that simply calls `next` with the `action` given to it.
+ Now let's add a `case` for `REQUEST_TODOS` that `console.log`s "here is where todos would be fetched".
+ Export your `TodoMiddleware`.

#### MasterMiddleware

`MasterMiddleware` is similar to the `RootReducer` that we implemented earlier
in that this object will collect at least one middleware function and connect it
to our `Store`.

The pattern for implementing it is relatively simple:

+ Create a file `middleware/master_middleware.js`
+ Import `applyMiddleware` from `redux`
+ Import your `TodoMiddleware`
+ Use the `applyMiddleware` function to create a `MasterMiddleware`
+ Export your `MasterMiddleware`

Now that you've created a `MasterMiddleware`, pass it as another argument to your `createStore` function call in `store/store.js`

** Test your code: `window.store` should still reference your store. Import your `requestTodos` action creator in your entry file and set `window.requestTodos =
requestTodos`. Then, run `store.dispatch(requestTodos())` in your browser
console - you should see the logged statement in your console. **

#### Using API Utils in Middleware

Let's adjust our middleware so that it calls our API utility function if the `action.type` matches `REQUEST_TODOS`.

+ Start by importing `fetchTodos`
+ Invoke `fetchTodos` in your `switch` statement in place of the `console.log` statement

Your code should look like the following:
```javascript
export default ({ getState, dispatch }) => next => action => {
  switch(action.type) {
    case REQUEST_TODOS:
      const success = data => console.log(data);
      fetchTodos(success);
      break;
    default:
      next(action);
  }
};
```

** Test your code: Run `store.dispatch(requestTodos())` in your console. Does your console log all of your `todos` data? **

Once the above test works, update your middleware so that it dispatches the received data as part of an action instead of logging it.

+ Import the `receiveTodos` action creator
+ Redefine your `success` callback to dispatch a `RECEIVE_TODOS` action

#### Receiving and Reducing `todos`

Now that you can `fetch` data from your backend and `dispatch` it to your
`Store` with an `actionType` of `RECEIVE_TODOS`, it's time to tell your reducers
what to do with that type of action.

**NB**: Remember to import the appropriate constants!

+ Add a new `case` to the `switch` statement in your `TodosReducer`
  + This case will execute if the `action.type` is `RECEIVE_TODOS`
  + The `todo` data in your store will be replaced by the data stored in `action.todos`

Your code will now probably look similar to the following:

```javascript
const TodosReducer = (state = {}, action) => {
  switch(action.type) {
    case RECEIVE_TODOS:
      return action.todos;
    default:
      return state;
  }
};
```

** Test your code! You should now be able to run the following in the console:

```javascript
store.getState(); // --> returns default state object
store.dispatch(requestTodos());
store.getState(); // --> returns a new state object, fully populated!
```

Examine your state object - is it the shape we had decided it should be back in
the Reducers section? Specifically, are the `todos` being stored as values in an
object? If it is not, refactor the code in your reducer so that your `todos` are
being stored correctly. Test again. **

**NB**: You've now implemented a full Redux cycle - call over a TA for a code review.

## Phase 3: Todos Components

In this phase, you will create React components to display your todo list and its items

### `Root`

The `Root` component serves to wrap your `App` component with a `Provider`. The `Provider` gives all of your components access to your `Store`, allowing them to read the application state and dispatch actions.

+ Create a file `components/root.jsx`
+ Import React and the `react-redux`'s `Provider`
+ Even though you haven't written your `App` component yet, import it from `./app`
+ This component can be a functional component, receiving (and de-structuring) its props (your `store`) as an argument, and returning a block of `jsx` code.

Your `Root` should look like the following:
```javascript
const Root = ({ store }) => (
  <Provider store={store}>
    <App />
  </Provider>
);
```

Don't forget to update your entry file to render your `Root` component into `#content`!

### `App`

This component will hold all of the top-level concerns of your app. A top-level
concern is a feature of the app that functions on its own and as such is not
nested under any other features. In this case, that will only be the `TodoList`,
but nonetheless it's a good design pattern to get used to.

Your `App` component can also be functional, because it doesn't need to use any
of React's lifecycle hooks. Because it doesn't rely on any of its props, the
component doesn't need to receive any arguments.

** Test your code: Make your `App` component return a `h1` tag with the name of your app. You should be able see your app's name appear on the page on reload. **

### TodoList

This component will show the items in our todo list.

**NB**: Because we're using the react/redux design principle of separating container and presentational components, this will actually be two components!

#### `TodoListContainer`

The goal of a container component is to allow the presentational component to be as simple and lightweight as possible. To this end, we map the application state and the Store's `dispatch` function to a set of props that get passed to the presentational component.

Refer to the [components][components_reading] and [connect][connect_reading]reading if you need a refresher on container components.

+ Create a file `components/todo_list/todo_list_container.js`
+ Import both the `connect` function and the (as of yet unwritten) `TodoList` presentational component
+ Create a `mapStateToProps` function
  + Create a prop called `todos` whose value is your `allTodos` selector
+ Create a `mapDispatchToProps` function
  + Create a prop called `requestTodos` whose value is a call to `dispatch`, passing the result of a call to your `requestTodos` action creator
+ Pass your `mapStateToProps` and `mapDispatchToProps` functions to `connect`
+ Call the result of this `connect` function with your `TodoList` component as an argument
+ Export the result of this function call

Your code should look like the following:
```js
const mapStateToProps = state => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  requestTodos: () => dispatch(requestTodos())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
```

#### `TodoList` and `TodoListItem`

Create your `TodoList` component.

If we've done our job with our container component, all this presentational component will have to do is:

+ Dispatch a `fetchTodos` action on `componentDidMount`
+ Render the titles of its `todos` prop as list items inside of a `<ul>`

** Test your code: Reload your app and see your list of `todos`! **

Now, let's refactor this `<ul>`/`<li>` structure so that each list item is a `TodoListItem` component that receives the appropriate item as a prop. Each `TodoListItem` will render the title of its item inside an `<li>`.  

+ Create a file `components/todo_list/todo_list_item.jsx`
+ Create a React Component called a `TodoListItem`
+ Write a `render` function for that component that returns an `<li>` with `this.props.todo.title` inside it

** Test your code: Refresh your page - your todos should still be visible. **

---

## Phase 4: `TodoForm`

In this phase you will create a form that allows users to create new todo items.

You've already set up a redux cycle - now it's time to flesh it out so that a user can create todo list items.

Follow these steps:

+ In `actions/todo_actions.js`, create two new action creator methods and their respective constants
  + `createTodo`
  + `receiveTodo`
+ Create a new API utility function (in `util/todo_api_util.js`) that sends `POST` requests to create a todo list item called `createTodo`
+ Add new `case`s to your middleware's `switch` statement that use your new API utility function
  + `CREATE_TODO` should call your new API utility function and pass `receiveTodo` as its success callback
+ Add new `case`s to your `TodosReducer` `switch` statement that handles the reception of a newly created todo list item
  + `RECEIVE_TODO` should cause that item to be included in future versions of `state.todos`
+ Create a new component (`components/todo_list/todo_form.jsx`) that dispatches your new action types
  + This component will use controlled inputs to keep track of its form data; thus it will have a local state
    + If you don't remember how to set up controlled inputs in a React component, look at [this reading][controlled_input_reading]
  + Render this component in your `TodoList` component
+ Update your `TodoListContainer` to pass in the props that your `TodoForm` will need
  + Add `createTodo` to the container's `MapDispatchToProps` function and pass this as a prop to `TodoForm`

** Test your code: Try creating a new todo list item using your form. Does it appear on your page? Call over a TA for a code review **

---

## Phase 5: Updating and Deleting Todos

In this phase, you will add new actions and buttons so that you can mark `todo`s as `done` or `undone` as well as delete them.

Follow these steps:

+ Create new action creator methods (in `actions/todo_actions`)
  + `toggleTodo`
  + `destroyTodo`
  + `removeTodo`
+ Create new API utility helper functions (in `util/todo_api_util`) that `PATCH` or `DELETE` a todo list item
  + `updateTodo`
  + `destroyTodo`
+ Add new `case`s to your middleware's `switch` statement that use your new API utility functions
  + `UPDATE_TODO` should call your new API utility function `updateTodo` and pass `receiveTodo` as its success callback
  + `DESTROY_TODO` should call your new API utility function `destroyTodo` and pass `removeTodo` as its success callback
+ Add a new `case` to your reducer's `switch` statement that handles the deletion of a todo list item
  + `REMOVE_TODO` should cause that item to be removed from future versions of `state.todos`
+ Update your components so that you can dispatch and view the effects of these actions
  + Add `toggleTodo` and `destroyTodo` to the `MapDispatchToProps` in your `TodoListContainer`
  + Pass those functions as props to your `TodoListItem` components
  + Render buttons that call those functions `onClick`
    + The button calling `toggleTodo` should display the current state of the todo item

** Test your code: You should now be able to create, toggle, and delete todo items on your list. **

---

## Phase 6: Steps Redux structure

### Refactoring and Setup

In this phase you will update your app so that each todo list item can have its
own sub-list of `steps`. You will need to build out your backend, your redux
cycle, as well as add several new components for this to work.

** You should be testing your code regularly as you finish features like we did for Todos. It will save you a lot of time if you debug as you code. **

Let's start by getting your `TodoListItem`s ready for their own sub-lists by
refactoring their display into multiple parts. Follow these steps:

+ Create a file `components/todo_list/todo_detail_view.jsx` to hold a component `TodoDetailView`
  + Refactor your `TodoListItem` so that it only renders the item's title and a button to change its status
  + Fill out your `TodoDetailView` so that it renders all of the todo item's other information
  + Conditionally render the `TodoDetailView` so that a user can show or hide a todo's details
    + Add a boolean value `detail` to the internal state of your `TodoListItem`
    + Initially, set that value to false
    + Allow users to change that value to true by clicking on the item's title
    + Render the `TodoDetailView` only if `detail` is true
  + Create a container for your `TodoDetailView` component
    + Create a `MapDispatchToProps` function that passes `destroyTodo` as a prop to `TodoDetailView`
    + Export `connect( null, mapDispatchToProps )(TodoDetailView);`

**NB**: Eventually, your `TodoDetailView` will hold a `StepList` component that will hold all of the `Steps` for a given `TodoListItem`. Also, we will wrap the `TodoDetailView` in a container component so that it can dispatch functions and receive information from the `Store`.

### Adding a Steps API

In this section you will create a new set of API endpoints that will serve `Steps` (each with a `title`, a `todo_id`, and a boolean `done` value) as JSON.

+ Create a `Step` model with `title`, `todo_id`, and a boolean `done`
+ Create a `StepsController` to handle API requests
  + Nest your routes under `api/` and call your controller `Api::StepsController`
    + Nest your `create` and `index` actions under `:todos`
    + Don't nest your `update` and `destroy` actions under `:todos`
  + Make your controller actions serve JSON-formatted responses

** Test your code: In the console, test out your new API endpoints by making `$.ajax` calls to them. **

### Re-Designing the State Shape

In this section you will create another Redux cycle for `Steps`, the sub-items within a given todo.

Follow these steps:

#### API Utils

In this section you will create parallel API utils to those in your `todo_api_util.js` file, but for interacting with your new `Steps` API.

+ Create a file `util/step_api_util.js` to hold step-related API utility functions
  + Write `fetchSteps`, `createStep`, `updateStep`, and `destroyStep` functions
  + These functions will make `$.ajax` requests to your backend's new API endpoints

** Test your code. **

#### Update the store

Because each `step` belongs to a todo item, we are going to nest each `step`
under its `todo_id`. We could store each todo's `steps` as an array, but we'd
run into the same problems we discussed earlier with our collection of todos.
Because we want O(1) insertion, updating, and removing for a single step, we
will store them as value pairs in an object with their ids as their keys.

Your application state will end up looking like this:
```js
{
  todos: {
    "1": {
      id: 1,
      title: "take a shower",
      body: "and be clean",
      done: false
    }
  },
  steps: {
    "1": { // this is the todo_id for all of the following steps
      "1": { // this is the step with id = 1
        id: 1,
        title: "walk to store",
        done: false,
        todo_id: 1
      },
      "2": { // this is the step with id = 2
        id: 2,
        title: "buy soap",
        done: false,
        todo_id: 1
      }
    }
  }
}
```

+ Create another reducer called the `StepsReducer` in `reducers/steps_reducer.js`
  + Set a default action to take in its `switch` statement
  + Add this reducer to your `RootReducer` via `combineReducers`
+ Add another selector to your `reducers/selectors.js` file that will allow components to get the steps as an array

** Test your code. **

#### Action Creators

In this section you will create essentially parallel action creators to those in your `todo_actions` file, but for `steps` instead.

+ Create a file `actions/steps_actions.js`
  + Write action creators `requestSteps`, `receiveSteps`, `createStep`, `toggleStep`, `receiveStep`, and `destroyStep`
  + Create new `step` constants for each of the action creators
  + Export all of your action creators and constants

** Test your code. **

#### Middleware

In this section you will create a new middleware to use your Step API utils in case it receives an action with the correct type. This will also be very similar to your `TodoMiddleware`.

+ Create a file `middleware/step_middleware.js` to hold a `StepMiddleware`
  + This middleware will use the API utility functions that you just wrote and pass along the HTTP Responses to your `Store`
  + Add your new `StepMiddleware` to your `MasterMiddleware` call

** Test your code. **

## Phase 7: Steps Components

In this phase, you will create React components to display the steps for a given todo list item, as well as a form that allows users to create new steps. These components will be rendered inside your `TodoDetailView` component.

Follow these steps, ** testing your code as you go ** :

+ Add `requestSteps` to the `MapDispatchToProps` in your `TodoDetailViewContainer`
+ Create a pair of files, `components/step_list/step_list.jsx` and `components/step_list/step_list_container.jsx`
  + Create `MapDispatchToProps` and `MapStateToProps` functions in the container file
    + `MapDispatchToProps` will pass `createStep` as a prop
    + `MapStateToProps` will pass `steps` and `todo_id` as props
  + The presentational component should render:
    + A `<ul>` of `StepListItemContainers`
    + A `StepForm`
+ Create a pair of files `components/step_list/step_list_item_container.jsx` and `components/step_list/step_list_item.jsx`
  + Create a `MapDispatchToProps` function in the container file
    + `MapDispatchToProps` will pass `destroyStep` and `toggleStep` as props
  + The presentational component should render:
    + The step's `title`
    + Buttons to toggle and delete the step
+ Create a file `components/step_list/step_form.jsx`
  + The `StepForm` component should render:
    + A form with a labeled input and a button that creates a new step
  + The `StepForm` component should control the input by
    + Storing its value in state
    + Updating its state when the input triggers `onChange`
  + The `StepForm` should `handleSubmit`
    + Clear the value of the input
    + Create a local `step` object
    + Pass that object to `this.props.createStep`

** Test your code: You should be able to create, toggle, and destroy steps. **

## Bonus

+ Disable your update and delete buttons while the dispatch is pending
+ Style your site so that it looks presentable to VCs
  + Potential inspiration: [trello](https://trello.com/), [todoist](https://todoist.com/), [google keep](https://keep.google.com/), [any.do](http://www.any.do/anydo/), [wunderlist](https://www.wunderlist.com/)
+ Add additional features:
  + Tags for todos
  + Steps can have sub-steps (polymorphic associations)
  + Allow markdown or text styling in todos ([quill.js](https://quilljs.com/)
  + Allow users to update todo title & body
  + Sorting by priority
  + Adding a time when something is due
    + Sort by due date
    + Item pops up when it is due


[object.freeze]: 'https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/freeze'
[middleware_reading]: '../../readings/middleware.md'
[components_reading]: 'https://github.com/appacademy/curriculum/react#w7d1'
[connect_reading]: 'https://github.com/appacademy/curriculum/react#w7d1'
[controlled_input_reading]: '../../readings/controlled_inputs.md'