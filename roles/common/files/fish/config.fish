set -x EDITOR vi

# PATH
if test -z "$fish_user_paths"
  set fish_user_paths ~/.local/bin ~/.gem/ruby/2.3.0/bin ~/.yarn/bin ~/.fzf/bin
end

# fzf
set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
set -x FZF_DEFAULT_OPTS '--height 40% --reverse --border'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# powerline
if test -d "$HOME/.local/lib/python3.6/site-packages/powerline"
  set -x POWERLINE_ROOT "$HOME/.local/lib/python3.6/site-packages/powerline"
  set fish_function_path $fish_function_path "$POWERLINE_ROOT/bindings/fish"
  powerline-setup
end

# ssh-agent
set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
if status --is-interactive; and not ssh-add -l > /dev/null
  ssh-add
  if test -f $HOME/.ssh/id_rsa_personal
    ssh-add $HOME/.ssh/id_rsa_personal
  end
end

if not set -q abbrs_initialized
  set -U abbrs_initialized
  echo -n Setting abbreviations...

  # apt
  abbr aa         sudo apt autoremove
  abbr ai         sudo apt install
  abbr ali        apt list --installed
  abbr alu        apt list --upgradable
  abbr ad         apt depends
  abbr ap         apt policy
  abbr ar         apt rdepends
  abbr asc        apt search
  abbr ash        apt show
  abbr aud        sudo apt update
  abbr aug        sudo apt upgrade
  # git
  abbr ga         git add
  abbr gb         git branch
  abbr gcf        git config
  abbr gch        git checkout
  abbr gcl        git clone
  abbr gco        git commit
  abbr gdt        git difftool
  abbr gf         git fetch
  abbr gl         git log
  abbr gpl        git pull
  abbr gps        git push
  abbr grm        git remote
  abbr grs        git reset
  abbr grma       git remote add upstream
  abbr gs         git status
  abbr gt         git tag
  # kubectl
  abbr kap        kubectl apply --filename
  abbr kat        kubectl attach
  abbr ke         kubectl exec
  abbr kgp        kubectl get pods
  abbr kdp        kubectl delete pods
  abbr kdsp       kubectl describe pods
  abbr kl         kubectl logs
  abbr kne        kubectl --namespace kube-system exec
  abbr kngp       kubectl --namespace kube-system get pods
  # systemctl
  abbr sld        systemctl list-dependencies
  abbr sp         systemctl poweroff
  abbr sr         systemctl reboot
  abbr ssu        systemctl suspend
  abbr sst        systemctl status
  abbr suld       systemctl --user list-dependencies
  abbr sust       systemctl --user status

  echo Done
end
