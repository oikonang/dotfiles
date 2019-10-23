# Create a symlink from here to the directory where they are expected from the system
ln -sv ~/.dotfiles/runcom/.bash_profile ~
ln -sv ~/.dotfiles/runcom/.inputrc ~
ln -sv ~/.dotfiles/git/.gitconfig ~
ln -sv ~/.dotfiles/kwm/.chunkwmrc ~
ln -sv ~/.dotfiles/kwm/.skhdrc ~
ln -sv ~/.dotfiles/tmux/.tmux.conf ~
ln -sv ~/.dotfiles/yarn/.yarnrc ~
ln -sv ~/.dotfiles/zsh/.zshrc ~
ln -sv ~/.dotfiles/emacs/init.el ~/.emacs.d/
ln -sv ~/.dotfiles/emacs/myinit.el ~/.emacs.d/
ln -sv ~/.dotfiles/emacs/myinit.org ~/.emacs.d/

# Source the default configurations of my mac environment
source macosdefaults.sh