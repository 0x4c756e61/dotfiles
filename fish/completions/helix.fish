set -l langs (helix --health |tail -n '+7' |awk '{print $1}' |sed 's/\x1b\[[0-9;]*m//g')

complete -c helix -s h -l help -d "Prints help information"
complete -c helix -l tutor -d "Loads the tutorial"
complete -c helix -l health -x -a "$langs" -d "Checks for errors in editor setup"
complete -c helix -s g -l grammar -x -a "fetch build" -d "Fetches or builds tree-sitter grammars"
complete -c helix -s v -o vv -o vvv -d "Increases logging verbosity"
complete -c helix -s V -l version -d "Prints version information"
