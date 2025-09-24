
# Used to change the fan speed, I couldn't find any other way to do it for my Asus board.
# This obviously only works on Asus boards
function chfan -d "Change fan speed"
    switch $argv[1]
        case fullspeed
            echo 0 | sudo tee /sys/devices/platform/asus-nb-wmi/hwmon/hwmon6/pwm1_enable
        case auto
            echo 2 | sudo tee /sys/devices/platform/asus-nb-wmi/hwmon/hwmon6/pwm1_enable

        case '*'
            echo "Invalid fan speed: $argv[1]; Available speeds: fullspeed, auto"
            return 1

    end

end
complete -c chfan -a 'auto fullspeed' --no-files
