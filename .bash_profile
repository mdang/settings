# =================
# Settings
# =================

# Prefer US English
export LC_ALL="en_US.UTF-8"
# use UTF-8
export LANG="en_US"

# Adds colors to LS!!!!
export CLICOLOR=1
# http://geoff.greer.fm/lscolors/
# Describes what color to use for which attribute (files, folders etc.)
export LSCOLORS=exfxcxdxbxegedabagacad # PJ: turned off
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

# =================
# History
# =================

# http://jorge.fbarr.net/2011/03/24/making-your-bash-history-more-efficient/
# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE

# don't put duplicate lines in the history.
export HISTCONTROL=ignoredups

# ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# Make some commands not show up in history
export HISTIGNORE="h"

# ====================
# Aliases
# ====================

# LS lists information about files.
# show slashes for directories.
alias ls='ls -GFh'

# long list format including hidden files and include unit size
alias ll='ls -la'

# go back one directory
alias b='cd ..'

# History lists your previously entered commands
alias h='history'

# If we make a change to our bash profile we need to reload it
alias reload="clear; source ~/.bash_profile"

# Hide/show all desktop icons (useful when presenting)
alias hide_desktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias show_desktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Hide/show hidden files in Finder
alias hide_files="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias show_files="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"

# List any open internet sockets on several popular ports.
# Useful if a rogue server is running
# http://www.akadia.com/services/lsof_intro.html
# http://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers
alias rogue='lsof -i TCP:3000 -i TCP:4567 -i TCP:8000 -i TCP:8888 -i TCP:6379'

alias macdown='open -a MacDown.app'
alias markdown='open -a MacDown.app'
alias md='open -a MacDown.app'

# Edit .bash_profile
alias bp='nano ~/.bash_profile'
# Reload the .bash_profile
alias sbp='source ~/.bash_profile'
# Clear the screen
alias c='clear'
# CPU usage
alias cpu='top -o cpu'
# Memory usage
alias mem='top -o rsize'
# Copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'
# Share history between terminal sessions
alias he="history -a" # export history
alias hi="history -n" # import history
# Get your current public IP
alias ip="curl icanhazip.com"

# Cycle through filenames/directories on tab for autocomplete
bind TAB:menu-complete

# Show current Git branch at command prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\$(parse_git_branch)\[\033[00m\] \n$ "

#######################################
# Start an HTTP server from a directory
# Arguments:
#  Port (optional)
#######################################

server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)

  # Simple Pythong Server:
  # python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"

  # Simple Ruby Webrick Server:
  ruby -e "require 'webrick';server = WEBrick::HTTPServer.new(:Port=>${port},:DocumentRoot=>Dir::pwd );trap('INT'){ server.shutdown };server.start"
}

# =================
# Tab Improvements
# =================

# Tab improvements
## Might not need?
# bind 'set completion-ignore-case on'
# make completions appear immediately after pressing TAB once
bind 'set show-all-if-ambiguous on'
bind 'TAB: menu-complete'

# ====================================
# Environment Variables
# ====================================

export NODE_ENV="development"


