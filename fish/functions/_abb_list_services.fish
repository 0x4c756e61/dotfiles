function _abb_list_services
    for service in (adb abb -l | tail -n +2 | string trim)
        # echo -e "- $service"

        set cmd_out (adb abb $service 2>&1 | string shorten -m 4 -c '')

        if test "$cmd_out" != "No s" && test "$cmd_out" != "cmd:"
            echo $service
        end
    end
end
