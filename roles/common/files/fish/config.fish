set -x EDITOR vi

if test -z "$fish_user_paths"
  set fish_user_paths ~/.local/bin ~/.gem/ruby/2.3.0/bin ~/.yarn/bin ~/.fzf/bin
end

if test -d "$HOME/.local/lib/python3.6/site-packages/powerline"
  set -x POWERLINE_ROOT "$HOME/.local/lib/python3.6/site-packages/powerline"
  set fish_function_path $fish_function_path "$POWERLINE_ROOT"/bindings/fish
  powerline-setup
end

if test -x /usr/local/bin/minikube
  set -x MINIKUBE_HOME $HOME
  set -x CHANGE_MINIKUBE_NONE_USER true
  set -x KUBECONFIG "$HOME/.kube/config"
end
