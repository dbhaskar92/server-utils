#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

# Color table from: http://www.understudy.net/custom.html

fg_black=%{$'\e[0;30m'%}
fg_red=%{$'\e[0;31m'%}
fg_green=%{$'\e[0;32m'%}
fg_brown=%{$'\e[0;33m'%}
fg_blue=%{$'\e[0;34m'%}
fg_purple=%{$'\e[0;35m'%}
fg_cyan=%{$'\e[0;36m'%}
fg_lgray=%{$'\e[0;37m'%}
fg_dgray=%{$'\e[1;30m'%}
fg_lred=%{$'\e[1;31m'%}
fg_lgreen=%{$'\e[1;32m'%}
fg_yellow=%{$'\e[1;33m'%}
fg_lblue=%{$'\e[1;34m'%}
fg_pink=%{$'\e[1;35m'%}
fg_lcyan=%{$'\e[1;36m'%}
fg_white=%{$'\e[1;37m'%}

# Text Background Colors

bg_red=%{$'\e[0;41m'%}
bg_green=%{$'\e[0;42m'%}
bg_brown=%{$'\e[0;43m'%}
bg_blue=%{$'\e[0;44m'%}
bg_purple=%{$'\e[0;45m'%}
bg_cyan=%{$'\e[0;46m'%}
bg_gray=%{$'\e[0;47m'%}

# Attributes

at_normal=%{$'\e[0m'%}
at_bold=%{$'\e[1m'%}
at_italics=%{$'\e[3m'%}
at_underl=%{$'\e[4m'%}
at_blink=%{$'\e[5m'%}
at_outline=%{$'\e[6m'%}
at_reverse=%{$'\e[7m'%}
at_nondisp=%{$'\e[8m'%}
at_strike=%{$'\e[9m'%}
at_boldoff=%{$'\e[22m'%}
at_italicsoff=%{$'\e[23m'%}
at_underloff=%{$'\e[24m'%}
at_blinkoff=%{$'\e[25m'%}
at_reverseoff=%{$'\e[27m'%}
at_strikeoff=%{$'\e[29m'%}

PROMPT="${fg_red}%n@${at_underl}%m${at_underloff}${fg_green}[${fg_blue}%~${fg_green}][${fg_yellow}%T${fg_green}]> ${at_normal}"
   
# Set the auto completion on
autoload -U compinit
compinit

# Allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# Never beep
setopt NO_BEEP

# Automatically decide when to page a list of completions
LISTMAX=0
      
# Set ZSH styles
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# History       
HISTFILE=~/.zsh-histfile
HISTSIZE=1000
SAVEHIST=1000      

# Aliases
alias ls='ls --color'
alias l='ls -lFh'     
alias la='ls -lAFh'   
alias lr='ls -tRFh'
alias lt='ls -ltFh'

source /home/dbhaskar92/Software/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
#ZSH_HIGHLIGHT_STYLES[command]='fg=red'
#ZSH_HIGHLIGHT_STYLES[alias]='fg=red'
#ZSH_HIGHLIGHT_STYLES[builtin]='fg=red'

export LESS_TERMCAP_mb=$'\E[0;31m'
export LESS_TERMCAP_md=$'\E[0;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export LD_LIBRARY_PATH=/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server:/usr/lib/jvm/java-7-openjdk-amd64:/usr/lib/jvm/java-7-openjdk-amd64/include

setup-paraview() {
  export CHASTE_LIBS=/home/dbhaskar92/Downloads/Chaste
  export PATH=${PATH}:${CHASTE_LIBS}/paraview-3.6.2-Linux-i686/bin/
  export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CHASTE_LIBS}/paraview-3.6.2-Linux-i686/lib/paraview-3.6/
}

matlabdb() { /home/dbhaskar92/matlab/bin/matlab -nodesktop -nosplash }

matlabdbgui() { /home/dbhaskar92/matlab/bin/matlab -nosplash }

combine-pdf() { gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=combinedpdf_`date +'%F_%Hh%M'`.pdf -f "$@" ;}

archey
