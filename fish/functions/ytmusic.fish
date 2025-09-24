
# PIP youtube player for my music.
# Used in conjuction with kwin rules
function ytmusic --wraps mpv -d "Play music from youtube"
    status job-control full
    mpris-discord-rpc -a mpv &
    set mpris_pid $last_pid
    mpv --title=mpv-music-popup $argv[1] --hwdec=auto --ytdl-format="bestvideo[height=?1080][fps<=?100]+bestaudio/best"
    kill $mpris_pid
end
