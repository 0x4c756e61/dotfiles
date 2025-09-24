if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source
end

# export ssh agent
if not set -q SSH_CONNECTION
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
    export SSH_ASKPASS=ksshaskpass
end

# Remove fish greating
set -g fish_greeting

# import the fvenv plugin to be able to source the home-manager configs
set -a fish_function_path ~/.config/fish/plugin-foreign-env/functions
fenv source ~/.nix-profile/etc/profile.d/hm-session-vars.sh

# Exports
export VISUAL="helix"
export EDITOR="$VISUAL"

# Make sure make and cmake uses 10 threads by default, instead of just one
export GNUMAKEFLAGS=-j10
export CMAKE_BUILD_PARALLEL_LEVEL=10

abbr -a -g cls clear
abbr -a -g yay paru
abbr -a -g cat bat
abbr -a -g cd z

alias ls='eza --icons'
alias woman='man'
alias hx="helix"
# In case sddm is broken, or if for some reason I want to start plama from the tty
alias startw="dbus-run-session startplasma-wayland"
alias hm="home-manager"

# git
alias gl="git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto) %D%n%s%n'"

# Open crab rave on a connected android device via ADB
alias crADB="adb shell am start 'https://www.youtube.com/watch?v=LDU_Txk06tM'"

# Use bat to render manpages instead of less, adding colors and the entire featureset of bat
# Tends to mis-render some characters from time to time, so might need to pipe all that to bat again
set -x MANPAGER "bat -pl man"

# Standard path things, and annoying tools that can't be bothered to put/link their binaries in .local/bin
set -a PATH ~/.local/share/bin
set -a PATH ~/.local/bin
set -a -p PATH /opt/clang-format-static/
set -a PATH ~/.cargo/bin
set -a PATH ~/.dotnet/tools

# keybinds
## remove word on ctrl-backspace in vi normal mode
bind ctrl-backspace backward-kill-path-component
