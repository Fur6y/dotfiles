function react_native_reload --description "reload react native app on android device"
    adb $argv shell input keyevent 82;
    and adb $argv shell input keyevent 19;
    and adb $argv shell input keyevent 23;
end
