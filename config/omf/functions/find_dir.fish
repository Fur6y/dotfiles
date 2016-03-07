function find_dir --description "search directory by name inside current directory"
    if test (count $argv) -gt 0
        find . -type d -name $argv 2>&1 | grep -v 'Permission denied'
    else
        echo "No arg (<directory name>)"
    end
end