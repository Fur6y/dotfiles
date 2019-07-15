function _git_co() {
    _git_branch
}

function _git_d() {
    local changed_files=$(git ls-files -m)
    __gitcomp_direct "${changed_files}"
}
