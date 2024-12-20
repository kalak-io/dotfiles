# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.yarn/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export VISUAL=vim
export EDITOR=/usr/bin/nvim
export RANGER_LOAD_DEFAULT_RC=FALSE
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="pygmalion-virtualenv"
ZSH_THEME=
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
HISTFILE="$HOME/.zsh_history"
# Display timestamps for each command
HIST_STAMPS="yyyy-mm-dd"

HISTSIZE=10000000
SAVEHIST=10000000

# Ignore these commands in history
HISTORY_IGNORE="(ls|pwd|cd)*"

# Write the history file in the ':start:elapsed;command' format.
setopt EXTENDED_HISTORY

# Do not record an event starting with a space.
setopt HIST_IGNORE_SPACE

# Don't store history commands
setopt HIST_NO_STORE

setopt HIST_FIND_NO_DUPS
# following should be turned off, if sharing history via setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker docker-compose git gh nvm pass rust sudo thefuck zsh-autosuggestions zsh-syntax-highlighting)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

# User configuration

# Enable control-s and control-q
stty start undef
stty stop undef
setopt noflowcontrol

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

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

# Substitution for Rust alternatives of base utils
if type ag > /dev/null 2>&1; then
  alias ag='ag --ignore-dir coverage --ignore-dir node_modules'
else
  alias ag="rg"
fi

if type rg > /dev/null 2>&1; then
  alias rg='rg --hidden'
fi

if type exa > /dev/null 2>&1; then
  alias ls='exa --icons'
fi

if type sd > /dev/null 2>&1; then
  alias sed='sd'
fi


if type bat > /dev/null 2>&1; then
  alias cat='bat -p'
fi

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

if type fuck > /dev/null 2>&1; then
  alias f='fuck --yeah'
fi

if type tldr > /dev/null 2>&1; then
  alias man='tldr --os=linux'
fi

# Common Mistakes
alias ct='cat'
alias im='vim'
alias vi,='vim'
alias nvi,='nvim'
alias s='ls'
alias gi='git'
alias pip='pip3'
alias cd-="cd -"

# Prefix command-line
alias -s vue=nvim
alias -s js=nvim
alias -s ts=nvim
alias -s py=nvim

# Common navigation
alias lp="cd ~/Repos/lineup"
alias ui="cd ~/Repos/uiversal"
alias sdm="cd ~/Repos/sdm"
alias tarot="cd ~/Repos/tarot-cli"

# Common command
function mkcd() { mkdir -p "$@" && cd "$_"; }
alias mkcd="mkcd"
# function replace() { ag -0 -l $1 | xargs -0 sed -i 's%$1%$2%g' }
# alias replace="replace"

# Cargo
alias cb="cargo build"
alias cr="cargo run"
alias ct="cargo test"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"
