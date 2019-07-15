# git number
alias nrm="git number -c rmtrash"
# ip addresses
alias ipglobal="dig +short myip.opendns.com @resolver1.opendns.com"
alias ip="ifconfig | grep -o '\inet\s[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.*broadcast' | grep -o '[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}'"
# json
alias json "python -m json.tool"
# google chrome
alias chrome "open -n -a \"Google Chrome\" --args"
