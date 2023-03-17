# User configuration

# Setting
try_source $DOTFILES/zsh/custom/config/settings.zsh
try_source ~/.zsh_settings

# Vim Keybindings
try_source $DOTFILES/zsh/custom/config/vim.zsh

# Alias
try_source $DOTFILES/zsh/custom/config/alias.zsh
try_source ~/.zsh_alias

# Path Alias
try_source $DOTFILES/zsh/custom/config/paths.zsh
try_source ~/.zsh_paths

# Completion
try_source $DOTFILES/zsh/custom/config/completion.zsh
try_source ~/.zsh_completion

# Privates
try_source ~/.zsh_privates

###-tns-completion-start-###
# try_source ~/.tnsrc
###-tns-completion-end-###

# Emscripten
# try_source ~/Workspace/lib/emsdk/emsdk_env.sh

# tools
try_source $DOTFILES/zsh/custom/config/tools/*.zsh
try_source $DOTFILES/zsh/custom/config/tools/fzf/*.zsh

# plugins 
local custom_path=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}
if [[ ! -d $custom_path/plugins/fzf-git.sh ]] {
  echo "$fg[blue]Install Plugin: $fg_bold[green]junegunn/fzf-git$reset_color"
  git clone git@github.com:junegunn/fzf-git.sh.git $custom_path/plugins/fzf-git.sh
  git clone git@github.com:junegunn/fzf-git.sh.git $custom_path/plugins/fzf-git.sh
}
source $custom_path/plugins/fzf-git.sh/fzf-git.sh

if [[ ! -d $custom_path/plugins/zsh-completions ]] {
  echo "$fg[blue]Install Plugin: $fg_bold[green]zsh-users/zsh-completions$reset_color"
  git clone git@github.com:zsh-users/zsh-completions $custom_path/plugins/zsh-completions
}
fpath=("$fpath[@]" $custom_path/plugins/zsh-completions/src)


# zinit plugins
try_source $DOTFILES/zsh/custom/config/plugins.zsh

# zsh hooks
try_source $DOTFILES/zsh/custom/config/hooks.zsh
