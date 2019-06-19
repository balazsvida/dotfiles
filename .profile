### Shared Source

for src in .profile.secure; do 
	if [ -f $src ]; then
		source $src
	fi
done

### Global Variables

export EDITOR=/usr/local/bin/vim
export GOPATH=$HOME 		# go requires 'export'
# GOBIN=$HOME/bin 		# implicit of GOPATH=$HOME

export VAULT_FORMAT=json

### Bash Path

# start with lowest precedence
PATH=/usr/bin:$PATH
PATH=/usr/local/bin:$PATH
PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH

PATH=$HOME/node_modules/.bin:$PATH # json2csv
PATH=$HOME/d/go/bin:$PATH
PATH=$HOME/bin:$PATH
PATH=/opt/homebrew/bin:$PATH

# Go Workshop by Francesc Campoy
# PATH=$HOME/src/go_appengine:$PATH

### Shortcuts

alias copy="rsync -avzP --no-o --no-g -e ssh"

### Bash Configuration

export CDPATH=".:~/d"
shopt -s cdable_vars # cd sgt
set -o vi

### Bash History

HISTCONTROL=ignoreboth:erasedups
HISTSIZE=50000
HISTFILESIZE=50000
HISTIGNORE=?:??:history		# ignore short words
shopt -s histappend cmdhist 	# lithist - multiline cannot be saved
shopt -s histreedit histverify 	# editable reverse search

PROMPT_COMMAND="history -a;history -c;history -r;$PROMPT_COMMAND"  # prompt sharing among sessions

### Bash Prompt

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
GRAY="\[\033[0;37m\]"
__git_branch() {
	git branch 2>/dev/null|grep -e ^*|tr -d '* '
}

# \h:\W \u\$
#PS1="$YELLOW[\t]$GRAY [\$(echo \$?)] \h:\w $GREEN\$(__git_branch)$GRAY# "
PS1="[\t] [\$(echo \$?)] \h:\w \$(__git_branch)# "

### Bash Tab Completion

complete -W "$(echo $(cat ~/.ssh/known_hosts | \
    cut -f 1 -d ' ' | sed -e s/,.*//g | \
    sort -u | grep -v "\["))" ssh


if [ -f /usr/local/etc/bash_completion ]; then
	. /usr/local/etc/bash_completion
fi

# fzf puts stuff there
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

