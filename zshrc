# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/Applications/:$HOME/.yarn/bin/:/usr/lib/ccache/bin/:$PATH
source /usr/share/nvm/init-nvm.sh
eval "$(zoxide init zsh)"

set -a # automatically export all variables
source .env
set +a

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim
export TERMINAL=alacritty
export TERM=alacritty

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="pygmalion-virtualenv"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose zsh-autosuggestions zsh-syntax-highlighting virtualenv virtualenvwrapper pass)

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
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Navigation
alias personal='cd ~/Documents/projects/personal/'
alias dotfiles='cd ~/Documents/projects/personal/dotfiles/'
alias unifai='cd ~/Documents/projects/profesional/unifai/'
alias self-service='cd ~/Documents/projects/profesional/unifai/self-service/'
alias ss=self-service
alias libnorm='cd ~/Documents/projects/profesional/unifai/libnorm/'

# Redirection to alternatives of command-line tools
if type exa > /dev/null 2>&1; then
  alias ls='exa --icons'
fi
if type sd > /dev/null 2>&1; then
  alias sed='sd'
fi
if type bat > /dev/null 2>&1; then
  alias cat='bat -p' # option -p disable line number and easy copy
fi
if type ag > /dev/null 2>&1; then
  alias ag='ag --ignore-dir=coverage --ignore-dir node_modules'
fi
if type clipboard > /dev/null 2>&1; then
  alias clipboard='cb'
fi
if type tldr > /dev/null 2>&1; then
  alias man='tldr --os=linux'
fi
if type ouch > /dev/null 2>&1; then
  alias compact='ouch compress'
  alias extract='ouch decompress'
fi
if type sd  > /dev/null 2>&1; then
  alias replace='sd'
fi
if type zoxide  > /dev/null 2>&1; then
  alias cd='z'
fi
if ! type bc > /dev/null  2>&1; then
  alias bc="python"
fi

# Custom command
function mkcd() { mkdir -p "$@" && cd "$_"; }
alias mkcd="mkcd"

# Common Mistakes
alias ct='cat'
alias im='vim'
alias s='ls'
alias gi='git'
alias gti='git'
alias pip='pip3'
alias cd-="cd -"

# Avoid mistakes
alias cp='cp -i -v'
alias mv='mv -i -v'
alias rm='rm -i -v'

# Open files with specific extension in vim
alias -s vue=vim
alias -s js=vim
alias -s py=vim
alias -s md=vim

# Clear aliases
alias empty_trash="rm -rf $HOME/.local/share/Trash/**/*"
alias clear_docker='docker system prune -a && docker container prune && docker image prune && docker volume prune'
alias clear_thumbnails="find $HOME/.cache/thumbnails -type f -atime +7 -delete"
alias clear_history="echo -n '' > $HOME/.*_history"
alias clear_vim="rm -rf $HOME/.vim/undodir/*"
alias clear_journalctl="sudo journalctl --vacuum-time=4weeks"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/.google-cloud-sdk/path.zsh.inc' ]; then . '~/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/.google-cloud-sdk/completion.zsh.inc' ]; then . '~/.google-cloud-sdk/completion.zsh.inc'; fi
