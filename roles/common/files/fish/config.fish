set -x EDITOR vi
# fzf
set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
set -x FZF_DEFAULT_OPTS '--height 40% --reverse --border'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
# minikube
set -x MINIKUBE_HOME $HOME
set -x CHANGE_MINIKUBE_NONE_USER true
set -x KUBECONFIG "$HOME/.kube/config"
# powerline
if test -d "$HOME/.local/lib/python3.6/site-packages/powerline"
  set -x POWERLINE_ROOT "$HOME/.local/lib/python3.6/site-packages/powerline"
  set fish_function_path $fish_function_path "$POWERLINE_ROOT/bindings/fish"
  powerline-setup
end
# PATH
if test -z "$fish_user_paths"
  set fish_user_paths ~/.local/bin ~/.gem/ruby/2.3.0/bin ~/.yarn/bin ~/.fzf/bin
end
# ssh-agent
set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/openssh_agent"
if status --is-interactive; and not ssh-add -l > /dev/null
  ssh-add
  if test -f $HOME/.ssh/id_rsa_personal
    ssh-add $HOME/.ssh/id_rsa_personal
  end
end
