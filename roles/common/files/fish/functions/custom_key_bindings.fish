function custom_key_bindings
  function fzf-kubenetes-widget -d "List pod or container names"
    set -l result ''
    set -l cmd (commandline -b)
    if string match -r '^kubectl\s+(?:exec|logs|attach|delete pods)\s+$' $cmd >/dev/null
      kubectl get pods --output jsonpath='{range .items[*]}{.metadata.name}{"\n"}' | fzf | read result
    else if string match -r '^docker\s+kill\s+$' $cmd >/dev/null
      docker ps --format "{{.Names}}" | fzf | read result
    end

    if test -n $result
      commandline -i $result
    end

    commandline -f repaint
  end

  bind \co fzf-kubenetes-widget
end
