# Path to your oh-my-zsh installation.
export ZSH="/home/utilisateur/.oh-my-zsh"

ZSH_THEME=robbyrussell

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

plugins=($plugins git z zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting cp)

# Configurez d'autres options Zsh (vous pouvez personnaliser ceci)
setopt autocd
setopt hist_ignore_space
setopt extended_glob

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias l='colorls --group-directories-first --almost-all'
