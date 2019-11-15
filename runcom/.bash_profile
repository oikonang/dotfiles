# Source all files of the repo
for DOTFILE in `find /Users/oikonang/.dotfiles`
do
  [ -f “$DOTFILE” ] && source “$DOTFILE”
done


# Source ledger aliases
source ~/src/ledger/.bashrc
