# CSS Friends

## Phase 3: Layout

**Topics:** [Flex][flex],
[Pseudo-content][t-pseudo-content], [Positioning][t-positioning]

- [Screenshot A][ss-03-a]
- [Live][live-03]

Make a `.content` container, with a `.content-sidebar` section and a
`.content-main` section in it. Give them widths and paddings and position
them next to each other. As they do not have content yet, set a
`min-height` property to `200px` to ensure they have some height, even
when empty. Set temporary background colors on the elements to verify
that they are properly next to each other and the correct size.

Often there are many ways you can create whitespace using CSS. You have
a choice of `margin` and `padding` and there are usually various
elements you could pick to add these to, in order to end up with the
same, correct appearance. In this case, if we look [ahead][live-10] a
bit, we see that inside the `.content-sidebar` and `.content-main`
there's white space all around, inside these sections. Nowhere are the
edges/borders touched, save the big profile image, which is a special
case. When that is the case, it makes sense to pick the most DRY
solution, and add padding to these sections, rather than the child
elements inside.

Add a border to visually separate `.content-sidebar` and `.content-main`.

[flex]: https://css-tricks.com/snippets/css/a-guide-to-flexbox/
[ss-03-a]: ../docs/screenshots/03-layout-a.png
[live-03]: http://appacademy.github.io/css-friends/solution/03-layout.html

[t-pseudo-content]: https://github.com/appacademy/css-demos/#pseudo-content
