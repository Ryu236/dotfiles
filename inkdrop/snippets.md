```js
/*
This note is a configuration note for the Snippets plugin.
Moving the note to trash causes this note to be unregistered as a snippets configuration.
Moving the note to a different notebook or renaming it will not cause problems.
Saving the note will reload the snippets.

Documentation on the format of this note:
https://github.com/jmerle/inkdrop-snippets#usage
*/

[
  // toggle check snippet
  {
    trigger: '[',
    content: '* [ ] ',
  },

  // date snippet
  {
    trigger: 'd',
    content: () => format(new Date(), 'yyyy-MM-dd'),
  },

  // summary snippet
  {
    trigger: 's',
    content: '<details><summary> $1$ </summary> $2$ </details>',
  },
  
  // table snippet
  {
    trigger: '|',
    content: '| $1$        | Are           | Cool  |\
              | ------------- |:-------------:| -----:|\
              | col 3 is      | right-aligned | $1600 |\
              | col 2 is      | centered      |   $12 |\
              | zebra stripes | are neat      |    $1 |'
  },
];
```
