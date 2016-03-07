function create_ignore --description "create gitignore file"
    set -l IFS # prevent splitting

    function _print_list
        set -l abc a b c d e f g h i j k l m n o p q r s t u v w x y z
        for letter in $abc
            set_color green
            echo —————[ ( echo $letter | tr "[:lower:]" "[:upper:]" ) ]———————
            set_color normal
            echo $argv | grep -iwo --color=never $letter"[^,]*"
        end
        return 0
    end

    set -l response (curl -L -s https://www.gitignore.io/api/$argv)
    set response_error (echo $response | grep -F "#!! ERROR")
    if [ -n "$response_error" -o -z "$response" ]
        echo Template $argv has no match.
    else
        if [ $argv = "list" ]
            _print_list (echo $response)
            functions -e _print_list
            return 0
        end

        # remove first 3 lines
        set -l gitignore (echo $response | tail -n +4)
        if [ -f .gitignore ]
            # append file
            echo $gitignore >> .gitignore
        else
            # create file
            echo $gitignore > .gitignore
        end

    end

    functions -e _print_list
end