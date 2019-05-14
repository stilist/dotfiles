export EDITOR=nano
export GIT_MERGE_AUTOEDIT=no

# Load `$PATH`s.
if [ -f "$HOME/.rc" ] ; then
  . "$HOME/.rc"
fi
PATH="$HOME/.sh/bin:$PATH"

if [ -f "$HOME/.prompt" ] ; then
  . "$HOME/.prompt"
fi

for file in $HOME/.sh/session/*.sh ; do
  [ -r "$file" ] && [ -f "$file" ] && . "$file";
done;
unset file;
