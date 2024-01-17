# Titanium.nvim

TBH it's just really my personal nvim config. I just wanted to be cool and give it a sick name.

## Install

Just clone this repo into ~/.config/nvim or wherever nvim expects to read your config.

```
git clone https://github.com/stangerjm/titanium.nvim.git ~/.config/nvim
```

You will need to install NodeJS and some other dependencies:
* `npm install -g typescript typescript-language-server @vue/language-server eslint_d diagnostic-languageserver neovim`

If you want to use Ruby, you will need to install Ruby and Solargraph.
* https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#solargraph

## Keymap
**Leader**  
leader = `<Space>`  

**Copy/Paste**  
`<leader>y` = yank to system clipboard  
`<leader>p` = paste from system clipboard  

**Telescope**  
`<leader>fg` = project-wide search  
`<leader>fb` = file browser  
`ctrl+p` = fuzzy file search  

**LSP**  
`K` = hover  
`gd` = go to definition  
`gr` = list references  
`gi` = go to implementation  
`<space>a` = list code actions  
`<space>rn` = rename symbol  

**Splits**  
`<leader>l` = move focus to the split to the right of the current  
`<leader>k` = move focus to the split above the current  
`<leader>j` = move focus to the split below the current  
`<leader>h` = move focus to the split to the left the current  
`<leader>z` = zoom into the current split  
`<leader>o` = equalize the zoom so all splits are visible  

**Comments**  
`<leader>cc` = toggle comment for current line  
`<leader>c + [movement]` = toggle comment according to movement where [movement] is any valid vim movement  

**Git**  
`<leader>b` = toggle git blame  
`<leader>d` = show git diff in new tab  
`<leader>s` = toggle file display in git diff  

**Test runner**  
`<leader>g` = run all tests in the current buffer  
`<leader>n` = run the nearest test to the cursor  
`ctrl+o` = allows normal movement and selection when focused on a testing window or terminal  

**In-editor terminal**  
`<leader>t` = open new in-editor terminal  

**Misc**  
`,` = clear previous search  
`<leader>q` = quickly close a tab  
