function kill_port
    echo "port: $argv"
    set -l pids (lsof -ti tcp:$argv)
    if [ $pids ]
        kill -9 $pids
        echo "kill pid(s): $pids"
    else
        echo "no pid found";
    end
end
