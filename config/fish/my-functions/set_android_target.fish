function set_android_target --description "set android target device"
    if test (count $argv) = 1
        set -xg ANDROID_SERIAL $argv[1]
    else
        echo "No arg (<device serial>)"
    end
end