[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bindings/bash/powerline.sh
fi

export EDITOR=~/nvim.appimage
export BAT_THEME=Dracula
