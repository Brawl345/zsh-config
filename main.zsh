# Git integration
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats '%B%F{cyan}<%b%u>%f '
zstyle ':vcs_info:*' enable git

# Customize prompt
# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
PROMPT='%B%(!.%F{red}%n.%F{blue}%n)%f%b' # User (red for root, blue for normal user)
PROMPT+='@' # @
PROMPT+='%B%F{cyan}%m%f%b' # Host
PROMPT+=': ' # :
PROMPT+='%B%~ ' # Path
PROMPT+=\$vcs_info_msg_0_ # VCS info
PROMPT+='%b%# ' # Prompt sign

# History file
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=2000
SAVEHIST=5000
setopt EXTENDED_HISTORY # History with timestamps + execution time
setopt SHARE_HISTORY # share history across multiple zsh sessions
setopt APPEND_HISTORY # append to history
setopt HIST_EXPIRE_DUPS_FIRST  # expire duplicates first
setopt HIST_IGNORE_DUPS # do not store duplications
setopt HIST_FIND_NO_DUPS # ignore duplicates when searching
setopt HIST_REDUCE_BLANKS # removes blank lines from history
setopt HIST_VERIFY # Show command on !! substitution

# Highlight on TAB
if [[ -z "$LS_COLORS" ]]; then
  (( $+commands[dircolors] )) && eval "$(dircolors -b)"
fi
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Automatic directory switching
setopt autocd

# Disable beep
unsetopt beep

# Corrections
setopt CORRECT
setopt CORRECT_ALL

# Functions
fpath+=$HOME/.config/zsh/functions # Change to /etc/zsh/custom/functions when using systemwide
autoload bkp_file
autoload cd

# Completions
autoload bashcompinit
bashcompinit
autoload -Uz compinit
compinit
