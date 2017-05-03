# Building a JSON API

A browser issues HTTP requests to a web server. For instance, a
browser issues a `GET` request when you click a link (`<a>` tag), or a
`POST` may be issued when you submit an HTML form. A typical Rails
application will reply with HTML that will then be displayed by the
browser.

Browsers aren't the only program that can make HTTP requests. When a
non-browser client makes an API request, the requestor probably
prefers a raw representation of the data rather than an HTML document
that includes a lot of extraneous formatting information and is
difficult to parse. Instead of HTML, it is often better to use a format called JSON.
JSON is typically a for non-browser clients to parse.

Consumers of a web API can be third-party developers, but you can also
consume your own API. Your web app may contain JavaScript code that
the user's browser runs; this JS code may make background requests to
the API to dynamically update content. We'll wait until we learn
JavaScript to talk about this, but the point is that even if you don't
support third-party partners, you may find yourself using your own
API.

APIs are big, friend.

## What is JSON?

Before we talk about how to convert Ruby objects to JSON, let's go over what JSON is.
JSON stands for JavaScript Object Notation.
It is a standardized format developed in the early 2000s to allow JavaScript objects to be stored in plain text files so they could be sent and recieved using HTTP.
Since then, the ability to write to and read from JSON has been incorporated into many other languages.

JSON uses two structures: objects and arrays.
An object consists of key-value pairs and is bounded by curly braces.
Object keys must be strings.
A JSON array is a list of values bounded by square braces.

The values stored in an object or array can themselves be objects or arrays, or they can be one of the following primitive types.

* **Boolean** `true` or `false`.
* **Null** written as `null`.
* **Number** such as `15` or `-3.7`
* **String** such as `"this is a string"`

Here is an example of some JSON data taken from Wikipedia.
```json
{
  "firstName": "John",
  "lastName": "Smith",
  "isAlive": true,
  "age": 25,
  "address": {
    "streetAddress": "21 2nd Street",
    "city": "New York",
    "state": "NY",
    "postalCode": "10021-3100"
  },
  "phoneNumbers": [
    {
      "type": "home",
      "number": "212 555-1234"
    },
    {
      "type": "office",
      "number": "646 555-4567"
    },
    {
      "type": "mobile",
      "number": "123 456-7890"
    }
  ],
  "children": [],
  "spouse": null
}
```

## JSON & Rails

When building a Rails API it is important to get your controllers to convert
model objects into JSON and return the JSON. This requires
support at two layers: the model layer (convert a model to JSON) and
the controller layer (return the JSON to the user).

### Models & `to_json`

Let's take a look at the model layer:

```
$ rails console
> Wizard.first
=> #<Wizard id: 1, fname: "Harry", lname: "Potter", house_id: 1,
school_id: 1, created_at: "2013-06-04 00:31:04",
updated_at: "2013-06-04 00:31:04">

> Wizard.first.to_json
=> "{\"created_at\":\"2013-06-04T00:31:04Z\",\"fname\":\"Harry\",
\"house_id\":1,\"id\":1,\"lname\":\"Potter\",
\"school_id\":1,\"updated_at\":\"2013-06-04T00:31:04Z\"}"
```

Note that the `to_json` method actually produces a JSON string.

### Controllers & `render json:`

Controllers, too, support responding to a request with JSON.

Remember that all controller actions must end in some response back to
the requestor. That response in Rails is built by calling either
`render` (places something in the response body) or `redirect_to`
(sends a response that asks the requestor to make a whole new request
to a different URL).

Usually, when we call `render`, we'll specify an **HTML
template**. An HTML template consists of HTML code, with annotations
where data can be inserted. We'll learn more about them soon.

Today we just want to send a JSON representation of a certain
object. Easy enough:

```ruby
class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end
end
```

A few things to note:

* The controller specifies that it is rendering JSON with `render
  json:`.
* Under the hood, the object you pass will automatically have
  `to_json` called on it, so there is no need to explicitly call it on
  the object.
* `to_json` works on both collections (arrays) and individual objects.

And now you know everything about JSON!

## Resources

* [`to_json` or `as_json`?][to-json-as-json]

[to-json-as-json]: http://jonathanjulian.com/2010/04/rails-to_json-or-as_json
