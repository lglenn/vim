vim -- My vim setup
===================

Installation
------------

To use, clone this repo into `$HOME/.vim` like so:

```
cd && git clone https://github.com/lglenn/vim.git .vim
```

...then make `$HOME/.vimrc` a symlink that points to `$HOME/.vim/vimrc`:

```
ln -s $HOME/.vimrc $HOME/.vim/vimrc
```

Adding Modules
--------------

To add a pathogen module, do this: 

```
git submodule add <repo>  bundle/<module name>
```
