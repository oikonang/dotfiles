# Source all files of the repo
for DOTFILE in `find /Users/oikonang/.dotfiles`
do
  [ -f “$DOTFILE” ] && source “$DOTFILE”
done


# This is for the test ledger. Should be replaced with the active .bashrc
source ~/src/GSWL-private/.bashrc