# Configs et al for VIM  

## Copying a RC to a Remote
instructions are displayed as though you have an entry for the remote in your `~/.ssh/config` -- lets use `lab` as an example remote machine
1. Port over the useful bits from the `.vimrc` to a file called `.minvimrc` (all of the essential bits from vim, no plugins or stuff)
2. Copy that File to the Remote  `scp ~/configs/vim/.minvimrc` lab:~/.vimrc`
3. Copy a theme to the remote and include it
  - `ssh lab`
  - `mkdir -p ~/.vim/colors`
  - `exit`
  - `scp ~/configs/vim/readability.vim lab:~/.vim/colors/`

Enjoy! 


## Creating a Colorscheme w the GUI

fiddling around with colorscheme editing through `.vim` files is mid. Better to look @ the changes you make with a graphical editor like [Pinto](https://pintovim.dev/) to confirm that changes are to your liking.

I used this platform to create the `readability.vim` scheme in this dir, which can be referenced by adding the colorscheme to the `~/.vim/colors` dir and referencing the colorscheme in your `.vimrc`
+ pinto also lets you save state, by exporting a JSON of the current configuration with which we can load in the colorscheme to the Web UI at a later time, very nice. 


