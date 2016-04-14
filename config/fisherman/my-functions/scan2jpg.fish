function scan2jpg --description "scan din a4 image with 300dpi as jpg"
    if test (count $argv) -le 0
        echo "No arg (<image-filename>)"
        return 1 # return error
    end

    set -l target_file_name $argv[1]
    set -l device (scanimage -f "%d")

    if test -e $target_file_name
        echo "File $target_file_name exists."
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
    | convert tiff:- -quality 80 $target_file_name
end
