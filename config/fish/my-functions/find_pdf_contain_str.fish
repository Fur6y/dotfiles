function find_pdf_contain_str --description "search pdf files contain string inside current directory"
    if test (count $argv) -gt 0
        pdfgrep -iRnHm 1 $argv[1] $PWD
    else
        echo "No arg (<pattern>)"
    end
end