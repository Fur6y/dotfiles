function scan2pdf --description "scan din a4 page with 300dpi"
    if test (count $argv) -le 0
        echo "No arg (<image-filename>)"
        return 1 # return error
    end

    set -l TEMP_FILE_NAME "scan_temp.tiff"
    set -l PDF_TITLE "Document"
    set -l PDF_AUTHOR "Fabian F."
    set -l PDF_SUBJECT "Document"
    set -l PDF_KEYWORDS "None"

    set -l target_file_name $argv[1]
    set -l device (scanimage -f "%d+++" | string split "+++")[1]

    if test -e $target_file_name
        echo "File $target_file_name exists."
        return 1
    end

    if test -e $TEMP_FILE_NAME
        echo "Temporary file $TEMP_FILE_NAME exists."
        return 1
    end

    scanimage \
    -d $device \
    --format=tiff \
    --mode Color \
    --depth 8 \
    --resolution 300 \
    --progress \
    -l 0 \
    -t 0 \
    -x 210 \
    -y 297 \
    --preview=no \
    > $TEMP_FILE_NAME;

    tiff2pdf \
    -p "A4" \
    -F \
    -j -q 70 \
    -t $PDF_TITLE \
    -a $PDF_AUTHOR \
    -s $PDF_SUBJECT \
    -k $PDF_KEYWORDS \
    -o $target_file_name \
    $TEMP_FILE_NAME;
    and rm $TEMP_FILE_NAME
end
