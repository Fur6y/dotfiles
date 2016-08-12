# `a` with no arguments opens the current directory in Atom Editor, otherwise
# opens the given location
function a --description "shortcut for atom editor"
    if test (count $argv) -eq 0
        atom .
    else
        atom $argv
    end
end
