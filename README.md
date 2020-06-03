
# github-light.vim

> Don't join the Dark Side!

All other github colorschemes fail to capture the real github theme. This one
comes as close as I could take it.

## Install

```vim
Plug 'romgrk/github-light.vim'
```

### Lightline configuration

```vim
let g:Lightline.colorscheme = 'github_light'
```

If you want a more traditional lightline look let the following.

```vim
let g:lightline#colorscheme#github_light#faithful = 0
```

## Screenshots

Theme

![theme-and-search](./static/theme-and-search.png)

Fugitive diff mode & Visual selection

![theme-diff-and-visual](./static/theme-diff-and-visual.png)

Side-by-side diff

![theme-diff](./static/theme-diff.png)

Terminal & Completion popup

![theme-terminal-and-completion](./static/theme-terminal-and-completion.png)

Lightline

![lightline-faithful](./static/lightline-faithful.png)

Lightline alternative

![lightline-traditional](./static/lightline-traditional.png)
