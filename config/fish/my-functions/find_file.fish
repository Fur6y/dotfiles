function find_file --description "search file by name inside current directory"
    if test (count $argv) -gt 0
        find . -type f -name $argv 2>&1 | grep -v 'Permission denied'
    else
        echo "No arg (<file name>)"
    end
end