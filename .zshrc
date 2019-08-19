# if zsh does not load again for some reason run the following
# chsh -s /bin/zsh

# Path to your oh-my-zsh installation.
export ZSH="/Users/nathan.maeys/.oh-my-zsh"

# Spark was not playing nicely and this fexed it
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_201.jdk/Contents/Home"

###########################################################################################################
################################## SPARK CONFIGURATIONS ###################################################

#spark 2.1.1
export SPARK_HOME="/Users/nathan.maeys/spark-2.1.1"
export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.10.4-src.zip:$PYTHONPATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=$PATH":/Users/nathan.maeys/spark-2.1.1/bin"
export PATH=$PATH":$HOME/Library/Python/3.7/bin/"

##spark 2.4.3
#export SPARK_HOME="/Users/nathan.maeys/spark-2.4.3"
#export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.10.4-src.zip:$PYTHONPATH
#export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
#export PATH=$PATH":/Users/nathan.maeys/spark-2.4.3/bin"
#export PATH=$PATH":$HOME/Library/Python/3.7/bin/"

################################## SPARK CONFIGURATIONS ###################################################
###########################################################################################################

export SLS_DEBUG=true

alias nruby="/Users/nathan.maeys/.rbenv/versions/2.3.0/bin/ruby"
alias ngem="/Users/nathan.maeys/.rbenv/versions/2.3.0/bin/gem"

# Pentaho-Scalable-Prod <-- name of pentaho prod box
alias pentaho_server="ssh ubuntu@10.6.1.228 -i /Users/nathan.maeys/.ssh/pentahoservers.pem"

# golang
export PATH=$PATH":/usr/local/go/bin"

# remove pyc files
alias pyc="rm **/*.pyc"

# this is the only way my fucking pip works
alias pip2="pip install --user " $1

eval "$(chef shell-init zsh)"

# VAULT
export VAULT_ADDR="https://vault.veriship.net"

# HELPFUL FUNCTIONS
forgetCluster() {
	ssh-keygen -R $1
}

alias forget_cluster=forgetCluster

emrSsh() {
	ssh-keygen -R $2
	ssh -i ~/.ssh/ChefTempKeyPair.pem $1@$2
}
alias emr_ssh=emrSsh

jenkinsSsh() {
	sudo ssh -i ~/.ssh/jenkinsSlave.pem ubuntu@$1   
}
alias jenkins_ssh=jenkinsSsh

POS() {
	echo piece of shit
}
alias OA=POS

ZSH_THEME="risto"

unsetopt autocd

# set vim keybindings in bash
bindkey -v

# For gathering delivery metrics
exportTrello() {
	export TRELLO_KEY=$(vault read -field=key secret/engineering/trelloapi)
	export TRELLO_TOKEN=$(vault read -field=token secret/engineering/trelloapi)
}
alias export_trello=exportTrello

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/nathan.maeys/code/git/ce-ui-frontend-api/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/nathan.maeys/code/git/ce-ui-frontend-api/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/nathan.maeys/code/git/ce-ui-frontend-api/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/nathan.maeys/code/git/ce-ui-frontend-api/node_modules/tabtab/.completions/sls.zsh

# django virtualenv
alias djv="source ~/code/git/virtualenvs/django_venv37/bin/activate"

# livingroom ubuntu machine
alias livingroom="ssh nate@192.168.1.21"

# run pentaho data integration
alias pentaho="sudo /opt/pentaho/data-integration/spoon.sh"

# jupyter force it to work
jupyterRun() {
	mkdir ./.ipynb_checkpoints/
	jupyter notebook
}
alias jup=jupyterRun

# home
alias homeSsh="ssh nate@76.92.128.2"

# DREMIO
export DREMIO_JAR="/Users/nathan.maeys/code/git/necessaryCeJars/dremio-jdbc-driver-3.1.9-201904051346520183-a35b753.jar"

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/nathan.maeys/code/git/ce-coordination-api/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/nathan.maeys/code/git/ce-coordination-api/node_modules/tabtab/.completions/slss.zsh

# CE UI
alias ce_ui="python ~/code/git/cerunlocal/src/main.py"

# SEALING AND UNSEALING VAULT
# make sure you change your vault to either vault 0 or vault 1
alias vault_0=VAULT_ADDR=https://vault0.veriship.net
alias vault_1=VAULT_ADDR=https://vault1.veriship.net
alias vault_default=VAULT_ADDR=https://vault.veriship.net
# the seal and unseal commands require operator
# vault operator seal
# vault operator unseal <<your_vault_key>>

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
