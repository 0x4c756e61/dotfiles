
# Simple lowfi music player that pops into a very small terminal at the bottom of my screen,
# used in conjuction with kwin rules
function lowfi --wraps ghostty -d "Play music from chillpop/lowfigirl"
    ghostty --command="echo '  ~ lowfi' && lowfi -w 6 -t ~/.local/share/lowfi/chillhop.txt" --class=ghostty.lowfi --window-padding-x=1 --window-padding-y=1 --window-padding-balance=true --confirm-close-surface=false --gtk-single-instance=true
end
