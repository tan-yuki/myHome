# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=9999
SAVEHIST=9999
bindkey -v
bindkey '^R' history-incremental-search-backward

# setting for peco
for f (~/.zsh/peco-sources/*) source "${f}" # load peco sources
bindkey '^r' peco-select-history

fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "${HOME}/.zshrc"

# 補完
## 初期化
autoload -U compinit
compinit -u

# End of lines added by compinstall

##### my settings
export SHELL=/bin/zsh
export TMPDIR=/tmp
export PAGER=less
export PATH=$HOME/bin:$PATH:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin
export LANG=ja_JP.UTF-8
export LSCOLORS=exfxcxdxbxegedabagacad
export JSTESTDRIVER_HOME=$HOME/bin
export VIMHOME=$HOME/.vim/



# custom_color.sh
autoload colors
colors

##### git settings

# Auto completin settings
# source /usr/local/git/contrib/completion/git-completion.bash
# GIT_PS1_SHOWDIRTYSTATE=true
# export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '


# git editor
export GIT_EDITOR="vim"

# when use "cd", pushd automatically
setopt auto_pushd

# packed auto completion list
setopt list_packed

# set Tab,Ctrl+I as completion key
setopt auto_menu

# auto completin (,{,[
setopt auto_param_keys

# set "/" last directory name
setopt auto_param_slash

# not set just before command in history
setopt hist_ignore_dups

# not set "history" command in history
setopt hist_no_store

# can complement after "=" (like --prefix= )
setopt magic_equal_subst


setopt mark_dirs

# enable to display Japanese file name
setopt print_eight_bit

setopt prompt_subst

# delete word to "/" on Ctrl+w
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# enable to cd, only directory name
setopt auto_cd

# prohibit C-s, C-q
setopt no_flow_control

# case ignore in auto-completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


### Prompt Setting
function rprompt-git-current-branch {
  local name st color

  if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
          return
  fi
  name=`git symbolic-ref HEAD 2> /dev/null`
  name=`echo $name | sed -e 's,refs/heads/,,g'`
  if [[ -z $name ]]; then
          return
  fi
  color=${fg[green]}

  # %{...%} は囲まれた文字列がエスケープシーケンスであることを明示する
  # これをしないと右プロンプトの位置がずれる
  echo "%{$color%}($name)%{$reset_color%} "
}
PROMPT="%{${fg[green]}%}[%n@macbook] %%%{${reset_color}%} "
RPROMPT="%{${fg[yellow]}%}[`rprompt-git-current-branch`%{${fg[yellow]}%}%~]%{${reset_color}%}"
precmd() {
  RPROMPT="%{${fg[yellow]}%}[`rprompt-git-current-branch`%{${fg[yellow]}%}%~]%{${reset_color}%}"
}


## 補完方法毎にグループ化する。
### 補完方法の表示方法
###   %B...%b: 「...」を太字にする。
###   %d: 補完方法のラベル
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''

## 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。
###           ただし、補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2

## 補完候補に色を付ける。
### "": 空文字列はデフォルト値を使うという意味。
zstyle ':completion:*:default' list-colors ""

## 補完候補がなければより曖昧に候補を探す。
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'

## 補完方法の設定。指定した順番に実行する。
### _oldlist 前回の補完結果を再利用する。
### _complete: 補完する。
### _match: globを展開しないで候補の一覧から補完する。
### _history: ヒストリのコマンドも補完候補とする。
### _ignored: 補完候補にださないと指定したものも補完候補とする。
### _approximate: 似ている補完候補も補完候補とする。
### _prefix: カーソル以降を無視してカーソル位置までで補完する。
zstyle ':completion:*' completer \
    _oldlist _complete _match _history _ignored _approximate _prefix

## 補完候補をキャッシュする。
zstyle ':completion:*' use-cache yes
## 詳細な情報を使う。
zstyle ':completion:*' verbose yes
## sudo時にはsudo用のパスも使う。
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"

## カーソル位置で補完する。
setopt complete_in_word
## globを展開しないで候補の一覧から補完する。
setopt glob_complete
## 補完時にヒストリを自動的に展開する。
setopt hist_expand
## 補完候補がないときなどにビープ音を鳴らさない。
setopt no_beep
## 辞書順ではなく数字順に並べる。
setopt numeric_glob_sort


# 展開
## --prefix=~/localというように「=」の後でも
## 「~」や「=コマンド」などのファイル名展開を行う。
setopt magic_equal_subst
## 拡張globを有効にする。
## glob中で「(#...)」という書式で指定する。
setopt extended_glob
## globでパスを生成したときに、パスがディレクトリだったら最後に「/」をつける。
setopt mark_dirs

# judge OS
cygwin=false
unix=false
case "$(uname)" in
	CYGWIN*) cygwin=true;;
	Darwin) unix=true;;
esac

if $cygwin; then
	source "${HOME}/.zshrc.cygwin"
fi

if $unix; then
	source "${HOME}/.zshrc.unix"
fi

localize_file="${HOME}/.zshrc.local"
if [ -f ${localize_file} ]; then
	source ${localize_file}
fi

# tmux solarized
set -g default-terminal "screen-256color"

export GOHOME=$(brew --prefix go)
export GOROOT=$GOHOME/libexec
export GOPATH=$GOHOME/_go
export PATH=$PATH:$GOROOT/bin

# cd で移動後に実行
# chpwd() {
#     ls
# }

function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo
        echo -e "\e[0;33m--- git status ---\e[0m"
        git status -sb
    fi
    zle reset-prompt
    return 0
}
zle -N do_enter
bindkey '^m' do_enter

alias dirs='dirs -p'
alias gvim='open /Applications/MacVim.app'

# git alias
alias st='git st'
alias df='git df'
alias add='git add'
alias ci='git commit'
alias push='git push'
alias pull='git pull'
alias stash='git stash'
alias co='git checkout'
alias ls='ls --color'
alias ll='ls -altr'

# git svn alias
alias gvn='git svn'
alias gvn-ci='git stash && git svn dcommit && git stash pop'
alias gvn-up='git svn rebase'

# vim
alias vi='vim'

# tmux
alias tmux="tmux -2"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
