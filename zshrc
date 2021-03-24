# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
autoload -Uz compinit
compinit

# if zsh does not load again for some reason run the following
# chsh -s /bin/zsh

# Path to your oh-my-zsh installation.
export ZSH="/Users/nate.maeys/.oh-my-zsh"

###########################################################################################################
# JAVA
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_201.jdk/Contents/Home"

# set vim keybindings in bash
bindkey -v
###########################################################################################################

###########################################################################################################
# PYTHON
# Set python3 to be the default with simple alias
alias python="python3"

# this is the only way my fucking pip works
# thankfully virtualenv works...
alias pip2="pip install --user " $1

# virtualenv
export PATH=$PATH:/Users/nate.maeys/Library/Python/3.8/bin

# remove pyc files
alias pyc="rm **/*.pyc"
###########################################################################################################

###########################################################################################################
# KUBERNETES
alias k=kubectl
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

alias kx=kubectx

# Connect to kube instances
# AWS
alias eks-dev='okta-awscli --profile dev --force --okta-profile dev && export AWS_DEFAULT_PROFILE=dev && kubectx eks-dev'
alias eks-prod='okta-awscli --profile prod --force --okta-profile prod && export AWS_DEFAULT_PROFILE=prod && kubectx eks-prod'
# GCP
alias gke-test='gcloud config configurations activate cyderes-test && kubectx gke-test'
alias gke-dev='gcloud config configurations activate cyderes-dev && kubectx gke-dev'
alias gke-prod='gcloud config configurations activate cyderes-prod && kubectx gke-prod'
# Tricks
alias eks-dev-trickster='okta-awscli --profile dev --force --okta-profile dev && export AWS_DEFAULT_PROFILE=dev && kubectx minikube'
alias gke-dev-trickster='gcloud config configurations activate cyderes-dev && kubectx minikube'
alias eks-prod-trickster='okta-awscli --profile prod --force --okta-profile prod && export AWS_DEFAULT_PROFILE=prod && kubectx minikube'
alias gke-prod-trickster='gcloud config configurations activate cyderes-prod && kubectx minikube'

# Rancher kubectl
alias rk='rancher kubectl'
# admin
# x#$?GrGsBHlVQosu
###########################################################################################################

###########################################################################################################
# GITHUB
export GITHUB_USERNAME=njmaeys
###########################################################################################################

###########################################################################################################
# ZHS THINGS
#ZSH_THEME="cloud"

unsetopt autocd

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
###########################################################################################################

###########################################################################################################
# PATH THINGS
# Add a location to PATH evn that I can actually modify
export PATH="$PATH:$HOME/tools"
# Add pip3 installation path
export PATH="$PATH:/Users/nate.maeys/Library/Python/3.7/bin"
# Add go bin to path
export PATH="$PATH:/Users/nate.maeys/go/bin"
# Add /usr/local/sbin
export PATH="$PATH:/usr/local/sbin"
###########################################################################################################

###########################################################################################################
# GoLang THINGS
export GOPATH=~/go
###########################################################################################################

###########################################################################################################
# GOOGLE THINGS
googleCreds() {
  if [[ $1 == "dev" ]]
  then
    gEnv="development"
    echo "GOOGLE_APPLICATION_CREDENTIALS set to ${gEnv}"
  elif [[ $1 == "prod" ]]
  then
    gEnv="production"
    echo "GOOGLE_APPLICATION_CREDENTIALS set to ${gEnv}"
  else
    echo "Bad env try again."
  fi

	export GOOGLE_APPLICATION_CREDENTIALS=~/code/creds/cyderes-$gEnv-gcp.json

}

alias gcreds=googleCreds
###########################################################################################################

###########################################################################################################
# Raspberry Pi
alias pi='ssh -i ~/.ssh/pi_rsa pi@192.168.86.34'
###########################################################################################################

###########################################################################################################
# Salt
alias salty='k exec -it -n salt saltmaster-docker-0 -- /bin/bash'
###########################################################################################################

###########################################################################################################
# Terraform Aws
terraformDevCredsAws() {
  export AWS_ACCESS_KEY_ID="xxxxxxxxxxxxxx"
  export AWS_SECRET_ACCESS_KEY="xxxxxxxxxxxxxx"

  terraform workspace select development
  terraform workspace list
}

alias terraformDevAws=terraformDevCredsAws
###########################################################################################################

###########################################################################################################
# Terraform Azure
terraformDevCredsAzure() {
  export ARM_CLIENT_ID="xxxxxxxxxxxxxx"
  export ARM_CLIENT_SECRET="xxxxxxxxxxxxxx"
  export ARM_SUBSCRIPTION_ID="xxxxxxxxxxxxxx"
  export ARM_TENANT_ID="xxxxxxxxxxxxxx"

  terraform workspace select development
  terraform workspace list
}

alias terraformDevAzure=terraformDevCredsAzure
###########################################################################################################

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nate.maeys/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nate.maeys/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nate.maeys/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nate.maeys/google-cloud-sdk/completion.zsh.inc'; fi

###########################################################################################################
# Things that don't need an alias but i dont want to lose
###########################################################################################################
# Check the oom reaper for a given salt key
# salt -L efm-01 cmd.run "journalctl | grep -i oom_reaper"

POS() {
	echo piece of shit
}

alias OA=POS

###########################################################################################################
# Virtualization
###########################################################################################################
# ovftool
export PATH=$PATH:/Applications/VMware\ Fusion.app/Contents/Library/VMware\ OVF\ Tool
###########################################################################################################

###########################################################################################################
# EOF Things i may need/want
###########################################################################################################

# maybe put some kube info into the command prompt at some point
# https://github.com/jonmosco/kube-ps1

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
