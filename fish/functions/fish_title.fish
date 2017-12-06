# To set names for different directory
# add an entry into the file $DOTFILES/fish/dir_names
# scheme "[Name]:[Path]"
# e.g. "MyDir:/Users/username/dir"

set -l dirNamesFile $DOTFILES/fish/dir_names
if not test -e $dirNamesFile
    touch $dirNamesFile
end
read -za dir_names < $dirNamesFile

function fish_title
    set title ""

    # session title
    if test $session_title
        set title $session_title
    # name via directory config
    else
        for config in $dir_names
            set -l dirConfig (string split -r -m1 : $config)

            if string match -q $dirConfig[2] (pwd)
                set -l dirName $dirConfig[1]
                set title $dirName
                break
            end
        end
    end

    # current working directory
    if test $title = ""
        set -l MAX_TITLE_LENGTH 15
        set -l current_pwd (pwd)
        set -l current_pwd_length (string length $current_pwd)
        if test $current_pwd_length -ge $MAX_TITLE_LENGTH
            set -l start (math $current_pwd_length - $MAX_TITLE_LENGTH)
            set -l shortened_title (string sub -s $start -l $current_pwd_length $current_pwd)
            set title "…$shortened_title"
        else
            set title (prompt_pwd)
        end
    end

    echo $title
end
