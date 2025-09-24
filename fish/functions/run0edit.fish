# Replacement for sudoedit, allows you to edit root files as a user, leveraging run0.
# Does not work on non-existent files yet
function run0edit
    function get_file_owner
        echo (eza --no-time --no-filesize --no-git --no-permissions --no-symlinks --color=never -l "$argv[1]" | string split " " -f1)
    end

    if test ! -n "$argv[1]"
        echo "usage: run0edit file..."
        return 1
    end

    set original_path "$argv[1]"

    if test -O $original_path
        echo "run0edit: $original_path: editing file owned by current user is not permitted"
        return 1
    end

    set file_ext (string split '.' -r -m1 -f2 "$argv[1]")
    set file_name (string split '/' -r -m1 -f2 "$argv[1]" | string split '.' -f 1)
    set tmp_file_name "/tmp/run0edit-$file_name-$(date +"%N").$file_ext"

    set fowner (get_file_owner $original_path)
    set caller (whoami)

    # echo "$tmp_file_name"
    run0 --background= --setenv=caller=$caller --setenv=file_ext=$file_ext --setenv=file_name=$file_name --setenv=original_path=$original_path --setenv=tmp_file_name=$tmp_file_name fish -c 'cp --preserve=all "$original_path" "$tmp_file_name"; chown "$caller" "$tmp_file_name"'

    if test "$status" -ne 0
        return
    end

    cp "$tmp_file_name" "$tmp_file_name-original"
    $EDITOR "$tmp_file_name"

    diff -q "$tmp_file_name-original" $tmp_file_name &>/dev/null
    if test "$status" -ne 0
        echo "Modifications detected, copying new files..."
        run0 --background= --setenv=fowner=$fowner --setenv=original_path=$original_path --setenv=tmp_file_name=$tmp_file_name fish -c 'chown "$fowner" "$tmp_file_name";mv "$tmp_file_name" "$original_path"'
    else
        echo "No modifications detected"

    end

    rm "$tmp_file_name-original"
end
