# User configuration

try_source $DOTFILES/zsh/custom/config/export.zsh
try_source ~/.zsh_export

# Setting
try_source $DOTFILES/zsh/custom/config/settings.zsh
try_source ~/.zsh_settings

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

# tools
try_source $DOTFILES/zsh/custom/config/tools/*.zsh
try_source $DOTFILES/zsh/custom/config/tools/fzf/*.zsh

# plugins 
local custom_path=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}
if [[ ! -d $custom_path/plugins/fzf-git.sh ]] {
  echo "$fg[blue]Install Plugin: $fg_bold[green]junegunn/fzf-git$reset_color"
  git clone https://github.com/junegunn/fzf-git.sh.git $custom_path/plugins/fzf-git.sh
}
source $custom_path/plugins/fzf-git.sh/fzf-git.sh

# zinit plugins
try_source $DOTFILES/zsh/custom/config/plugins.zsh

# zsh hooks
try_source $DOTFILES/zsh/custom/config/hooks.zsh

# fpath
try_source $DOTFILES/zsh/custom/config/fpath.zsh

# bindkey
try_source $DOTFILES/zsh/custom/config/bindkey.zsh

# export $PATH
try_source $DOTFILES/zsh/custom/config/export-path.zsh
