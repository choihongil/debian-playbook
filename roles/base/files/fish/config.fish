set -x EDITOR vi

# PATH
if test -z "$fish_user_paths"
  set fish_user_paths ~/.cargo/bin ~/.local/bin ~/.gem/ruby/2.5.0/bin ~/.yarn/bin ~/go/bin
end

# fzf
set -x FZF_TMUX 1
set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --no-messages --glob "!.git/*"'
set -x FZF_DEFAULT_OPTS '--height 40% --reverse --border'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# powerline
set PYTHON3_VERSION (python3 --version | awk '{ split($2, a, "."); print a[1] "." a[2] }')
if test -d "$HOME/.local/lib/python$PYTHON3_VERSION/site-packages/powerline"
  set -x POWERLINE_ROOT "$HOME/.local/lib/python$PYTHON3_VERSION/site-packages/powerline"
  set fish_function_path $fish_function_path "$POWERLINE_ROOT/bindings/fish"
  powerline-setup
end

# ssh-agent
if test -S "$XDG_RUNTIME_DIR/ssh-agent.socket"
  set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
  if status --is-interactive; and not ssh-add -l > /dev/null
    for private_key in (ls ~/.ssh/id_rsa* | grep -v .pub\$)
      ssh-add $private_key
    end
  end
end

# XDG_DATA_DIRS for flatpak
if type -q flatpak
  set -x XDG_DATA_DIRS "$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share"
end

if not set -q abbrs_initialized
  set -U abbrs_initialized
  # apt
  abbr --add aa         sudo apt autoremove
  abbr --add ai         sudo apt install
  abbr --add ali        apt list --installed
  abbr --add alu        apt list --upgradable
  abbr --add ad         apt depends
  abbr --add ap         apt policy
  abbr --add ar         apt rdepends
  abbr --add asc        apt search
  abbr --add ash        apt show
  abbr --add aud        sudo apt update
  abbr --add aug        sudo apt upgrade
  # git
  abbr --add ga         git add
  abbr --add gb         git branch
  abbr --add gcf        git config
  abbr --add gch        git checkout
  abbr --add gcl        git clone
  abbr --add gco        git commit
  abbr --add gdt        git difftool
  abbr --add gf         git fetch
  abbr --add gl         git log
  abbr --add gm         git merge
  abbr --add gpl        git pull
  abbr --add gps        git push
  abbr --add grm        git remote
  abbr --add grs        git reset
  abbr --add grma       git remote add upstream
  abbr --add gs         git status
  abbr --add gsps       git stash push
  abbr --add gspp       git stash pop
  abbr --add gt         git tag
  # docker
  abbr --add da         docker attach
  abbr --add dcp        docker-compose
  abbr --add dct        docker container
  abbr --add di         docker image
  abbr --add dv         docker volume
  abbr --add dr         docker run --rm -it
  # kubectl
  abbr --add kap        kubectl apply --filename
  abbr --add kat        kubectl attach
  abbr --add ke         kubectl exec
  abbr --add kgp        kubectl get pods
  abbr --add kdp        kubectl delete pods
  abbr --add kdsp       kubectl describe pods
  abbr --add kl         kubectl logs
  abbr --add kne        kubectl --namespace kube-system exec
  abbr --add kngp       kubectl --namespace kube-system get pods
  # systemctl
  abbr --add sld        systemctl list-dependencies
  abbr --add sp         systemctl poweroff
  abbr --add sr         systemctl reboot
  abbr --add ssu        systemctl suspend
  abbr --add sst        systemctl status
  abbr --add suld       systemctl --user list-dependencies
  abbr --add sust       systemctl --user status
end
