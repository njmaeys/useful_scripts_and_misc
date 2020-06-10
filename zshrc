# if zsh does not load again for some reason run the following
# chsh -s /bin/zsh

# Path to your oh-my-zsh installation.
export ZSH="/Users/nathan.maeys/.oh-my-zsh"

###########################################################################################################
# JAVA
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_201.jdk/Contents/Home"

###########################################################################################################
# set vim keybindings in bash
bindkey -v

###########################################################################################################
# PYTHON
# Set python3 to be the default with simple alias
alias python="python3"

# this is the only way my fucking pip works
# thankfully virtualenv works...
alias pip2="pip install --user " $1

###########################################################################################################
# SPARK CONFIGURATIONS

# Spark was not playing nicely and this fixed it
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

#spark 2.4.3
export SPARK_HOME="/Users/nathan.maeys/spark-2.4.3"
export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.10.7-src.zip:$PYTHONPATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=$PATH":/Users/nathan.maeys/spark-2.4.3/bin"
export PATH=$PATH":$HOME/Library/Python/3.7/bin/"
export PYSPARK_PYTHON="/usr/local/bin/python3"

###########################################################################################################
# HELPFUL FUNCTIONS AND SHORTCUTS
forgetCluster() {
	# use the ip for var
	ssh-keygen -R $1
}

alias forget_cluster=forgetCluster

emrSsh() {
	# $1 is user
	# $2 is ip
	# $3 is pem file
	ssh-keygen -R $2
	ssh -i ~/.ssh/$3.pem $1@$2
}
alias emr_ssh=emrSsh

POS() {
	echo piece of shit
}
alias OA=POS

# remove pyc files
alias pyc="rm **/*.pyc"

###########################################################################################################
# ZHS THINGS
ZSH_THEME="risto"

unsetopt autocd

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
