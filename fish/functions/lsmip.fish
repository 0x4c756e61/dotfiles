
# Function that parses your fish history to list all packages that you manually Installed,
# in case you want to uninstall things you forgot about and do not use anymore
function lsmip -d "Lists Manually Installed packages"
    set progress 🕛 🕐 🕑 🕒 🕓 🕔 🕕 🕖 🕗 🕘 🕙 🕚
    set pcounter 1

    set mips (history | rg "(paru|pacman|yay|aura) -Sy?u? (.*)" -or '$2' | sed -e 's/--\w*//g' | sed -e 's/\w*\///' | rg --invert-match "[<>=]" | sed -e 's/[*/\\]*//g' | sed -e 's/ /\n/g' | sed -e 's/^-\\w*//' | sort -u)
    set installed_pkgs ""

    for package in $mips
        echo "$progress[$(math $pcounter % (count $progress) + 1)] - Checking $package"
        pacman -Qq $package &>/dev/null
        if test $status -eq 0
            set -a installed_pkgs $package
        end
        set pcounter (math $pcounter + 1)
        printf "\e[1A\e[2K"
    end

    echo $installed_pkgs
end
