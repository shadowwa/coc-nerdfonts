# Coc Nerdfonts

[Nerdfonts](https://www.nerdfonts.com/) completion source of [coc.nvim](https://github.com/neoclide/coc.nvim).

Find nerdfonts icon without looking up to the cheatsheet website.

## Install

```vim
:CocInstall coc-nerdfonts
```

## Configuration

To complete nerdfonts source, type `nf-` as trigger pattern.

It is also possible to change the nerdfonts trigger pattern by putting
`"coc.source.nerdfonts.triggerPatterns": ["TRIGGERPATTERN"]` in your `coc-settings.json`

By default this source is only activated for markdown file, you can add other filetype by putting
`"coc.source.nerdfonts.filetypes": ["FILETYPE1", "FILETYPE2"]` in your `coc-settings.json`

## Update nerdfonts

To update the dictionary file:

```bash
ruby nerdfontslist.rb
```

Based on the [coc-emoji](https://github.com/neoclide/coc-sources/) extension.
