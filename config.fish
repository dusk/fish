
alias pip "pip2"
alias strongpass "dd if=/dev/urandom bs=1 count=30 2>/dev/null | base64"
alias catp "highlight -O ansi"
alias l "ll"
alias fishreload 'source ~/.config/fish/config.fish'

set -Ux ACCESS_TOKEN 'v2x9ada26ea7d8e3ac29d88e7c341681a041e096c21af4933a8cb678918250a8ed5'

# git
alias gl "git pull"
alias gp "git push"
alias glog "git log"
alias gcm "git commit -a"
alias gst "git status"

# pi
alias dronepi "ssh pi@192.168.1.69"

. ~/.config/fish/vi-mode.fish
function fish_user_key_bindings
  vi_mode_insert
end

set -U fish_prompt_pwd_dir_length 0
set fish_greeting
