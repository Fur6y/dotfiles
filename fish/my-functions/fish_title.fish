function fish_title
    if test $session_title
        echo $session_title
    else
        set -l MAX_TITLE_LENGTH 15
        set -l current_pwd (pwd)
        set -l current_pwd_length (string length $current_pwd)
        if test $current_pwd_length -ge $MAX_TITLE_LENGTH
            set -l start (math $current_pwd_length - $MAX_TITLE_LENGTH)
            set -l shortened_title (string sub -s $start -l $current_pwd_length $current_pwd)
            echo "…$shortened_title"
        else
            echo (prompt_pwd)
        end
    end
end
