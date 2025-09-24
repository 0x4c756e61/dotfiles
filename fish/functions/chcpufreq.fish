
# Used to change the cpu frequency, certainly not the best way to do it, but it works for my use case
function chcpufreq -d "Sets the cpu maximum frequency"
    if test "$argv[1]" -eq 0
        bat -p /sys/devices/system/cpu/cpu0/cpufreq/amd_pstate_max_freq | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq
        bat -p /sys/devices/system/cpu/cpu0/cpufreq/amd_pstate_lowest_nonlinear_freq | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq
        echo "cpu frequency has been reset"
        return
    end

    echo (qalc -t "$argv[1] GHz to kHz" | cut -d' ' -f1) | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq
    echo "cpu frequency set to $argv[1] to GHz"
end
