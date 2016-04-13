function _help_exit
    echo "Usage:  [options] arguments..."
    echo "Arguments:"
    echo "-x : width in mm"
    echo "-y : height in mm"
    echo "-s : start page"
    echo "-e : end page"
    return 1
end

function _yn_prompt
    set_color green
    echo "y/n? "
end

function _scan
    set page $argv[1]
    set rotate $argv[2]
    set x $argv[3]
    set y $argv[4]
    set -l file_name "page_$page.pdf"

    set TEMP_FILE_NAME "scan_temp.tiff"
    set PDF_TITLE "Document"
    set PDF_AUTHOR "-"
    set PDF_SUBJECT "-"
    set PDF_KEYWORDS "-"
    set PDF_CREATOR "-"
    set PDF_DATE "20150101120000"

    if test -e $file_name
        echo "File $file_name exists."
        return 1
    end
    if test -e $TEMP_FILE_NAME
        echo "Temporary file $TEMP_FILE_NAME exists."
        return 1
    end

    # echo "START SCAN PAGE $page WITH $rotate° AND WIDTH: $x HEIGHT: $y"

    set done 0
    while math "$done == 0" > /dev/null
        scanimage \
        --format=tiff \
        --mode Color \
        --depth 8 \
        --resolution 300 \
        --progress \
        -l 0 \
        -t 0 \
        -x $x \
        -y $y \
        --preview=no \
        > $TEMP_FILE_NAME;
        and set done 1;
        or begin; echo "retry in 5 sek"; sleep 5; end;
    end

    mogrify \
    -units PixelsPerInch \
    -strip \
    -resample 150x150 \
    -rotate $rotate \
    $TEMP_FILE_NAME

    tiff2pdf \
    -j -q 70 \
    -t $PDF_TITLE \
    -a $PDF_AUTHOR \
    -s $PDF_SUBJECT \
    -k $PDF_KEYWORDS \
    -c $PDF_CREATOR \
    -e $PDF_DATE \
    -o $file_name \
    $TEMP_FILE_NAME;
    and rm $TEMP_FILE_NAME
end

function scan_book --description "scan book"

    # check arguments
    if test (count $argv) -le 0
        _help_exit; or return 1;
    end

    # parse arguments
    getopts $argv | while read -l key option
        switch $key
            case x
                set book_width_mm $option
            case y
                set book_height_mm $option
            case s
                set page_start $option
            case e
                set page_end $option
        end
    end

    set ROTATE_LEFT "-90"
    set ROTATE_RIGHT "90"

    set current_page $page_start

    # iterate book pages
    while math "$current_page <= $page_end" > /dev/null
        echo "Continue with page $current_page?"
        set yn ""
        # prompt continue question
        while test $yn != "y" -a $yn != "yes" -a $yn != "n" -a $yn != "no"
            read yn -p _yn_prompt
        end
        # check answer
        if test $yn = "n" -o $yn = "no"
            return 0;
        end
        if test $yn = "y" -o $yn = "yes"
            # set rotation
            if math "$current_page % 2 == 0" > /dev/null
                # page number is even
                set rotate $ROTATE_RIGHT
            else
                # page number is odd
                set rotate $ROTATE_LEFT
            end
            _scan $current_page $rotate $book_width_mm $book_height_mm;
        end

        # next page
        set current_page (math $current_page + 1)
    end

    return 0
end
