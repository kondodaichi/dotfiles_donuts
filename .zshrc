plugins=(git)

# rbenv用
eval "$(rbenv init -)"

# alias
alias l='ls -AlFGhv'
alias ls='ls -AFGv'
alias ll='ls -AlFGhv'
alias tree='tree -a -C -I "\.DS_Store|\.git|node_modules|vendor\/bundle" -N'
alias g='git'
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I'
alias scselect='/usr/sbin/scselect'
alias p='pbpaste'
alias c='pbcopy'
alias o='open'
alias ber='bundle exec ruby'
alias be='bundle exec'
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'

if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

cdls () {
  \cd "$@" && ls -AFGv
}
alias cd="cdls"

# ls color
export LSCOLORS=exfxcxdxbxbxHxHxHxGxGx

autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{green}!" #commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+" #add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f" #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]' #rebase 途中,merge コンフリクト等 formats 外の表示
precmd () { vcs_info }
PROMPT='%{$fg[red]%}[%n@%m]%{$reset_color%}'
PROMPT=$PROMPT'${vcs_info_msg_0_} %{${fg[red]}%}%}$%{${reset_color}%} '

PROMPT=$'\n%{$fg[blue]%}%~%{$reset_color%} ${vcs_info_msg_0_}\n%{$fg[red]%}> %{$reset_color%}'
#RPROMPT='%{${fg[green]}%}[%t]%{${reset_color}%}'

# 大文字小文字に関わらず, 候補が見つからない時のみ文字種を無視した補完をする
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

# [zshの補完候補にls --colorsと同じ色をつける](https://gist.github.com/mmasaki/9523518)
autoload colors
colors
autoload -U compinit
compinit
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=01;34:su=41;30:sg=46;30:tw=42;30:ow=01;36'
zstyle ':completion:*' list-colors "${LS_COLORS}" # 補完候補のカラー表示

# コマンド提案
setopt correct

# pure
fpath+=("$HOME/.zsh/pure")
autoload -U promptinit; promptinit
prompt pure

# npm https://qiita.com/PolarBear/items/62c0416492810b7ecf7c
export PATH=$PATH:$HOME/.nodebrew/current/bin

alias python="python3"
export PATH="$HOME/Library/Python/3.7/bin:$PATH"

# brewで入れた方をmac内蔵より優先度高く探す
export PATH=/usr/local/bin:$PATH

alias mvim='/Applications/MacVim.app/Contents/bin/mvim'
alias mvimr="mvim --remote-silent"
alias nvimr=nvr

# goのコマンドのインストール先
export GOPATH="$HOME/go"
export PATH="$HOME/go/bin:$PATH"

# brew install 時にupdateを自動でしない(手動で定期的にbrew updateする必要あり)
export HOMEBREW_NO_AUTO_UPDATE=1

# docker用便利エイリアス
function docker-containers(){
    docker ps --format "{{.Names}}"
}
alias de="docker exec -it \$(docker-containers | fzf-tmux)"
alias da="docker attach \$(docker-containers | fzf-tmux)"
alias dk="docker kill \$(docker-containers | fzf-tmux)"


