function qivicon_emulator
    cd ~/workspace/target_platforms/Emulator/osgi/bin/vms/jdk;
    if type --quiet "change_title"
        change_title "Qivicon Emulator"
    end
    eval "./server";
end