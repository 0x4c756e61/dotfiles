function fan_ctrl
    switch $argv[0]
        case speed

    end
end

function hwmgr
    switch $argv[0]
        case fan
            fan_ctrl $argv[1..]
        case cpu
            cpu_ctrl $arv[1..]
    end

end
