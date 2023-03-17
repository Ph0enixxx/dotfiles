# create a do-ls function
# Make sure to use emulate -L zsh or
# your shell settings and a directory
# named 'rm' could be deadly
autoload -U add-zsh-hook
do-ls() {emulate -L zsh; lsd;}

# add do-ls to chpwd hook
add-zsh-hook chpwd do-ls

