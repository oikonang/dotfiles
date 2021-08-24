# Source all files of the repo
for DOTFILE in `find /Users/oikonang/.dotfiles`
do
  [ -f “$DOTFILE” ] && source “$DOTFILE”
done


# Source ledger aliases
source ~/src/ledger/.bashrc


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Source gem and ruby
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH

