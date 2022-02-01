# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi
autoload -Uz compinit
compinit

# Force the up and down arrow to do the auto searching
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

###########################################################################################################
# M1 STUFF BC APPLE
#export PATH=$HOME/bin:/usr/local/bin:/usr/local/homebrew/opt$PATH
#alias xbrew='arch -x86_64 /usr/local/homebrew/bin/brew'
###########################################################################################################
# PYTHON

# remove pyc files
alias pyc="rm **/*.pyc"
###########################################################################################################
# KUBERNETES
alias k=kubectl
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

alias kx=kubectx
###########################################################################################################
# GITHUB
export GITHUB_USERNAME=njmaeys
# pr filter to find what is assigned to me and open 
# is:open is:pr review-requested:@me"
###########################################################################################################
# ZHS THINGS
ZSH_THEME="cloud"

unsetopt autocd
###########################################################################################################
# PATH THINGS
# Add a location to PATH evn that I can actually modify
export PATH="$PATH:$HOME/tools"
# Add /usr/local/sbin
export PATH="$PATH:/usr/local/sbin"
###########################################################################################################
# GOOGLE THINGS
###########################################################################################################
###########################################################################################################
# Raspberry Pi
###########################################################################################################
# Node things
###########################################################################################################
###########################################################################################################
# Things that don't need an alias but i dont want to lose
###########################################################################################################
POS() {
	echo piece of shit
}
alias OA=POS
###########################################################################################################
# Virtualization
###########################################################################################################
# AWS Things
###########################################################################################################
# EOF Things i may need/want
###########################################################################################################

# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Source the powerlevel 10k stuff
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/natemaeys/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/natemaeys/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/natemaeys/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/natemaeys/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.poetry/bin:$PATH"

###########################################################################################################
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

###########################################################################################################
# ASDF
. /opt/homebrew/opt/asdf/libexec/asdf.sh

. /opt/homebrew/opt/asdf/libexec/asdf.sh
