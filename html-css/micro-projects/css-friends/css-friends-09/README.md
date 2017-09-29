# CSS Friends

## Phase 9: Forms

**Topics:**
[Pseudo-selectors][t-pseudo-selectors], [Box-shadow][t-box-shadow],
[Border-radius][t-border-radius], [Calc][t-calc]

- [Screenshot A][ss-09-a]
- [Screenshot B][ss-09-b]
- [Screenshot C][ss-09-c]
- [Screenshot D][ss-09-d]
- [Live][live-09]

Reuse your `.thumb` class. Float the thumbnail and the form next to each
other. Wrap your inputs and labels in container elements with an
`.input` class. Wrap the button in a `.submit` container. Style them so
you can reuse them. Pay special attention to the `:focus` and ':active'
pseudo-classes.

When you float a block element its width will be determined by its
content, it will take up the minimal space necessary. In our case, when
we float the thumbnail and the form next to each other, the form most
likely will not fill out the full width of the parent container. To fix
this you will want to set a manual `width` on the element. You'll have
to do a little math to get this right.

**Bonus**: CSS can do math too! Though not required today, you may use the
`calc()` function. It can be especially nice to do math with combined
units. For instance, you can easily subtract 100px off of a 100%
width, by setting `width: calc(100% - 100px)`. You can do addition,
subtraction, multiplication, and division. You can even use
parentheses to denote order.

[ss-09-a]: ../docs/screenshots/09-forms-a.png
[ss-09-b]: ../docs/screenshots/09-forms-b.png
[ss-09-c]: ../docs/screenshots/09-forms-c.png
[ss-09-d]: ../docs/screenshots/09-forms-d.png
[live-09]: http://appacademy.github.io/css-friends/solution/09-forms.html
[t-calc]: https://developer.mozilla.org/en-US/docs/Web/CSS/calc
[t-border-radius]: https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius
[t-pseudo-selectors]: http://css-tricks.com/pseudo-class-selectors/
[t-box-shadow]: https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow
