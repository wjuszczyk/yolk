# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="$HOME/bin:$PATH"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if [[ $TERM == "xterm" ]]; then
  ZSH_THEME="strug"
else
  ZSH_THEME="powerlevel10k/powerlevel10k"
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="archcraft"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
HIST_STAMPS="%d/%m/%y %T"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)
plugins=(autojump colored-man-pages colorize command-not-found common-aliases dirhistory extract gcloud git gitignore git-prompt safe-paste zsh-interactive-cd zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=pl_PL.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi
#EDITOR=vim

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# omz
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="thunar ~/.oh-my-zsh"

alias vim='nvim'
# ls
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'

do_yolk() {
  yolk git add --all
  yolk git commit -m $1
  yolk git push
}

export KITTY_CONFIG_DIRECTORY=~/.config/bspwm/kitty
export MPD_HOST="$XDG_RUNTIME_DIR/socket"

alias gcp='ssh wj@35.227.88.224'
alias oracle='ssh ubuntu@140.238.222.177'
alias repeater='sshpass -f $HOME/.ssh/repeater.pass ssh -i $HOME/.ssh/id_rsa -p 2222 192.168.50.10'
alias router="bash -c 'ssh -i $HOME/.ssh/id_rsa -p 2222 192.168.50.1'"
alias smb='sudo mount.smb3 //192.168.50.1/Samba /mnt/smb -o credentials=$HOME/.smbpass,uid=1000,gid=1000,rw'
alias orphans='yay -Qdtq | yay -Rns -'
alias orphan='yay -Qdtq'
alias mm='while true; do X=960; Y=540; xdotool click 1; for i in $(seq 1 5); do xdotool mousemove $X $Y; sleep 1; X=$(( $X + 50 )); Y=$(( $Y -50 )); done; done'
alias less='less -FRX'
function packages-by-date() {
  LC_ALL=en_EN.UTF-8 pacman -Qi |
  grep '^\(Name\|Install Date\)\s*:' |
  cut -d ':' -f 2- |
  paste - - |
  while read pkg_name install_date
  do
  install_date=$(date --date="$install_date" -Iseconds)   
  echo "$install_date   $pkg_name"
  done | sort
}

ZSH_COLORIZE_TOOL=chroma
ZSH_COLORIZE_STYLE="github"
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256

#[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
if [[ -n "$KITTY_INSTALLATION_DIR" ]]; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
source $HOME/.zsh.zoxide
source $HOME/.yazi.sh
eval "$(zoxide init zsh)"

function licznik() {
     local max=$1
     if [ $max -gt 20 ]; then
         licz=10
     else
         licz=5
     fi

     local i=1
     sleep 1
     for k in $(seq 4)
      do
          paplay /usr/share/sounds/freedesktop/stereo/dialog-information.oga &
          sleep 1
     done
     paplay /usr/share/sounds/freedesktop/stereo/message-new-instant.oga &
     sleep 1
     while [ $i -le $max ]; do
         #echo "Licznik: $i"
         if (( i % licz == 0 && i != 0 && i != max)); then
             paplay /usr/share/sounds/freedesktop/stereo/bell.oga &
         fi
         if (( i == max )); then
             paplay /usr/share/sounds/freedesktop/stereo/complete.oga &
         fi
         ((i++))
         sleep 1
     done
} 2>&1 > /dev/null

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#eval "$(zellij setup --generate-auto-start zsh)"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/wj/.dart-cli-completion/zsh-config.zsh ]] && . /home/wj/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

