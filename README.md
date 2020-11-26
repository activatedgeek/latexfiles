# latexfiles

This is like [dotfiles](https://dotfiles.github.io) but for LaTeX.

## Usage Notes

Simply include `preamble.tex` in the main file,

```
\documentclass{article}

\input{preamble}

...
```

**NOTE**: This should be included right after `\documentclass` to avoid package conflicts.

