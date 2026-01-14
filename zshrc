# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# colorstuff
export COLORTERM="truecolor"
export BAT_THEME="gruvbox-dark"

# export MANPATH="/usr/local/man:$MANPATH"

# editor preferences
export THOR_MERGE='nvim -d $1 $2'
export EDITOR='nvim'


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

# neovim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# C/CPP
# export CC="/usr/bin/gcc"
# export CXX="/usr/bin/gcc"

# Some random Mac Thing
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Postgres
export PATH="/usr/local/opt/postgresql@16/bin:$PATH"

# General
alias ibrew="arch -x86_64 /usr/local/bin/brew"
alias intel="env /usr/bin/arch -x86_64 /bin/zsh --login"
alias resource='source ~/.zshrc'
alias rgrep='grep -r'
alias vi='nvim'
alias whitespace="sed 's/ /·/g;s/\t/￫/g;s/\r/§/g;s/$/¶/g'"

eval "$(rbenv init -)"

function dirtouch {
  mkdir -p "$(dirname $1)" && touch "$1"
}

function strlen {
  tmp=$1; echo ${#tmp}
}

# Shortcuts to code repos
alias docs='cd ~/Code/val-doc-storage'
alias barcoder='cd ~/Code/val-barcoder'
alias pkm_commit='git pull && git add --all && git commit -m "regular commit" && git push'
alias pkm='cd ~/code/pkm; git pull; vi +PKMSettings; pkm_commit'

# Rails
alias foredev='bundle exec foreman start -f ./Procfile.dev'
alias main='git checkout main'
alias production='git checkout production'
alias rc='bundle exec rails console'
alias rdbm='bundle exec rake db:migrate RAILS_ENV=development'
alias rdbr='bundle exec rake db:rollback RAILS_ENV=development'
alias rsp='VERBOSE_TESTS=true bundle exec rspec'
alias rspq='VERBOSE_TESTS=false bundle exec rspec'

# Git
alias gbranch='git --no-pager branch'
alias ggpush='git push -u origin $(git_current_branch)'
alias gnotes='cd ~/Notes && git add -A && git commit -m "notes" && git push && cd -'
alias gprune='git remote update --prune'

function gitnotes {
  git --no-pager log origin/production..origin/main --no-merges --format='* %s' --date=local
}

# Bundler
alias bump='bundle update'

# DEno
. "/Users/williamhouston/.deno/env"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
