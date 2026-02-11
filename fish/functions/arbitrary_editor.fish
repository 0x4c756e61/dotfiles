function arbitrary_editor -d "Spawns a ghostty window with helix to edit the last text clipbaord entry"
    set edit_file_path "/tmp/arbitrary_editor-$(date +"%N")"
    echo (wl-paste) > "$edit_file_path"

    ghostty --command="helix '$edit_file_path'" --class="ghostty.arbitrary_editor" --window-padding-x=0 --window-padding-y=0 --confirm-close-surface=false --gtk-single-instance=true
    cat "$edit_file_path" | wl-copy -n

    rm "$edit_file_path"
end
