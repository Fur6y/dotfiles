function change_title
    if test (count $argv) -gt 1
        return 1;
    else if test (count $argv) -eq 0
        set -e session_title
        return 0;
    else
        set -g session_title $argv
        return 0;
    end
end