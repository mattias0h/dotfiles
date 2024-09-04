# [your] dotfiles

## Usage

1. Use this template to create your own dotfiles repository.
2. Find and replace, and uncomment all instances of [you] as you like.
3. Remove this section and continue from the Installation section.

## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/.dotfiles`.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/[you]/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && ./bootstrap.sh
```

To update, `cd` into your local `.dotfiles` repository and then:

```bash
./bootstrap.sh
```

To update later on, just run that command again.

## Thanks to…

* [Mathias Bynens](http://mths.be/) for the [original repo of this fork](https://github.com/mathiasbynens/dotfiles)
* [Gianni Chiappetta](http://gf3.ca/) for his [dotfile bootstrap scripts](https://github.com/gf3/dotfiles)
* [Jan Moesen](http://jan.moesen.nu/) for his [wgetrc](https://github.com/janmoesen/tilde)
* and recursively, all the others
