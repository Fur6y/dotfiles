function find_str --description "search string in files inside current directory"
    if test (count $argv) -gt 0
        grep -lrnw $PWD -e $argv[1]
    else
        echo "No arg (<pattern>)"
    end
end