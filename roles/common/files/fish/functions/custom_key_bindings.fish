function custom_key_bindings
  function fzf-container-widget -d "List container names"
    docker ps --format "{{.Names}}" | fzf | read -l result
    if [ -z $result ]
      commandline -f repaint
      return
    end

    commandline -i $result
  end

  function fzf-pod-widget -d "List pod names"
    kubectl get pods | fzf | read -l result
    if [ -z $result ]
      commandline -f repaint
      return
    end

    commandline -i $result
  end

  bind \c\[ fzf-container-widget
  bind \co fzf-pod-widget
end
