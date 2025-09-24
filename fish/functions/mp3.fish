# Why use a youtube converter when you can just use your terminal?
function mp3
    yt-dlp "$argv[1]" --extract-audio --audio-format mp3
end
