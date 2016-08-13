function fish_title
    if test $session_title
        echo $session_title
    else
        echo (prompt_pwd)
    end
end