
# Used when I fuck something up and need to clean my workdir
function gitreset
    echo -ne "\033[0;1;31mDelete all unstaged commits ? (y/n)"
    read -l -n 1 -P "" response
    if test "$response" = y
        git reset --hard HEAD
        echo -e "\033[0;1;32mWorkdir clean"
    end
end
