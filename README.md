# dotfiles
[wiki](https://github.com/TamDik/dotfiles/wiki)

## Install
```sh
git clone https://github.com/TamDik/dotfiles.git
cd dotfiles
./setup.sh
```
Run the following command before you run `./setup.sh`, if you want to change the location of dotfiles directory which is different from remote repository.
```sh
export DOTFILES=~/path/to/dotfiles
```

## Requirements
* zsh
    * `chsh -s $(which zsh)`
* powerline patched fonts 
    * See [nerd-fonts](https://github.com/ryanoasis/nerd-fonts/blob/master/readme.md#font-installation)
