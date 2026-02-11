function withlimit -d "Runs a program inside a limited environment"
    # default limits
    set -f memlimit '1 GB'
    set -f proclimit 100

    set -f help "Usage: withlimit [-h | --help] [-m | --mem=value where value is number followed by a qalc unit] [-p | --procs=value] -- COMMAND"

    argparse --strict-longopts --move-unknown 'h/help' 'm/mem=' 'p/procs' -- $argv || return

    if set -ql _flag_h
        echo $help >&2
        return 0
    end

    if test (count $argv) -eq 0
        echo "Fatal: missing COMMAND"
        echo $help >&2
        return 1
    end

    set -q _flag_mem[-1] &&  set -f memlimit $_flag_mem[-1]
    set -q _flag_procs[-1] && set -f proclimit $_flag_procs[-1]

    # unit conversion using calc
    set -f memlimit (qalc -t "$memlimit to kB" | cut -d' ' -f1)


    fish -c "ulimit -Sv $memlimit && ulimit -Sc $proclimit && $argv"

end
