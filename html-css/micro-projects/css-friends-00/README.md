# CSS Friends

We're going to build a social network for App Academy! A mock-up, that
is.

Often when working as a front-end developer you'll be collaborating with
a designer. Most likely they will provide you with a sequence of
screenshots and specifications for you to convert into neat,
maintainable HTML and CSS.

Check out the [end goal][live-12]. With some clear
[specifications][specs], a bunch of [screenshots][shots], and some hints
broken down in 12 phases, you will make a pixel perfect mock-up in code
in no time.

## A Few Thoughts Before You Start...

- Make sure to keep the [specs][specs] at your side at all times.
- Open the [screenshots][shots] in Apple's Preview to study them. You
  get a nice crosshair to select and measure elements. You can also
  zoom.
- Use Chrome and the inspector tools. Make sure not to accidentally be
  zoomed in on your page. The screenshots and browser ratio should be
  1:1.
  - To see the rules like `:hover` in the Styles pane, click the small dotted box button in the top right. To force an element into hover
  state, right click it. Like [this][test-hover-1] and [this][test-hover-2]!
- You will be writing your HTML in the `friends.html` file in the
  skeleton folder.
- Each phase corresponds to a numbered CSS file you should use.
- Always use [semantic tags][tags] when writing HTML. Avoid using
  `<div>` and `<span>` tags, they should only be used as a last resort
  and are frowned upon.
- Indent and space out your HTML cleanly. That is the only way to
  maintainable code.
- Always [validate][valid] your HTML. It's easy for subtle layout bugs
  to creep in because of invalidly nested or unclosed tags.
- Double quote your attributes: `<nav class="header-nav">`.
- Use descriptive classes. Convention is to make them all lowercase,
  using dashes. I like to use dashes to note nesting. I may have a
  parent `.header` element, with children named `.header-nav` and a
  `.header-list`.
- Keep your selectors shallow. Nesting increases
  [specificity][specificity], which in turn increases precedence. Use
  this [calculator][calculator] to untangle.
- Prefer less specific selectors like `.header-nav` instead of
  `nav.header-nav`.
- Never use [IDs][ids-boo] as selectors.
- Finally, enjoy the beauty in the details. A designer's favorite game
  is Spot The Difference. So-so approximations never suffice, and they
  will kindly let you know.
- You can do it!

## Common Gotchas
- When positioning something absolute, make sure what coordinate system
  you are working in. Most likely you will want to set the parent
  container to be `relative`, if it isn't already positioned.
- Pseudo content is injected **inside** the selected element, as an
  inline element.
- If your CSS rules look right, but are not showing up, pull up the
  **browser inspector** and see if you have conflicting previous rules
  with more specific selectors. Chrome will show your properties with a
  strike-through, to show which rules apply, and which are overridden.

[specs]: ./SPECIFICATIONS.md
[shots]: ../css-friends-docs/screenshots
[specificity]: http://cssguidelin.es/#specificity
[test-hover-1]: http://i.stack.imgur.com/IlVMn.png
[test-hover-2]: http://i.imgur.com/evzZ2.png
[ids-boo]: http://csswizardry.com/2014/07/hacks-for-dealing-with-specificity/
[calculator]: http://specificity.keegan.st/
[valid]: http://validator.w3.org/
[tags]: https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5/HTML5_element_list
[live-12]: http://appacademy.github.io/css-friends/solution/12-modal.html

## Phase 0: Reset

**Topics:** [Reset][t-reset], [Appearance][t-appearance],
[Box-model][t-box-model],
[Box-sizing][t-box-sizing], [Cursor][t-cursor]

- [Screenshot A][ss-00-a]
- [Live][live-00]

Let's start with a clean slate, by writing a reset in
`./css/00-reset.css`. To speed you up, we provided some tag selectors to
get you started. Be wise about which properties to inherit, and which to
hard-code. Besides the regular, I'd like you to set the `box-sizing`
property to inherit, to have all elements behave the same, which is
content-box, by default.

Let's make all images `block` elements, have them expand to the full
`100%` width of their parent container, and have their height grow
`auto`, which means proportionally.

Remove the bullets from list items, strip the default styling from form
input elements by setting their appearance to none (see [here][appearance-info]), and show the little
pointer hand on buttons to make it obvious you can click.

[ss-00-a]: ../css-friends-docs/screenshots/00-reset-a.png
[live-00]: http://appacademy.github.io/css-friends/solution/00-reset.html

[t-reset]: https://github.com/appacademy/css-demos/#user-agent-styles
[t-appearance]: http://css-tricks.com/almanac/properties/a/appearance/
[t-box-model]: https://github.com/appacademy/css-demos/#box-model
[t-box-sizing]: http://appacademy.github.io/css-demos/box-sizing.html
[t-cursor]: https://developer.mozilla.org/en-US/docs/Web/CSS/cursor
[appearance-info]: https://css-tricks.com/almanac/properties/a/appearance/
