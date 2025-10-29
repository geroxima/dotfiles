export ZSH=$HOME/.oh-my-zsh
export PATH=$PATH:$HOME/go/bin
export PATH="$PATH:/usr/local/bin/image2video"
export PATH="$HOME/.local/bin:$PATH"

ZSH_THEME="josh"

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# dev aliases
alias prdev="pnpm run dev"
alias prbuild="pnpm run build"
alias prdevh="pnpm run dev --host"
alias ls="exa --icons"
# alias copy="xclip -selection clipboard"
alias cc="wl-copy && echo copied!"
alias logisim="cd ~/logisim/ && java -jar logisim-generic-2.7.1.jar"
alias mongo="systemctl start mongodb"
alias zed="zeditor"
alias out="hyprctl dispatch exit"
alias pi="pnpm i"
alias update="~/.config/scripts/systemupdate.sh"
alias cisco="QT_QPA_PLATFORM=xcb packettracer &&"
alias vim="nvim"
alias fs="fastfetch"
bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest

function cursor {
  (nohup /opt/cursor/cursor.appimage "$@" > /dev/null 2>&1 &)
}

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
. "/home/geroshima/.deno/env"

# cowsay -r ¨Hola Carola¨
curl -s ¨https://raw.githubusercontent.com/shinya/pokemon-terminal-art/main/256color/gold/025.txt¨

