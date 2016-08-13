function switch_java_version --description "switch between the different java versions"

    if not test (count $argv) -eq 1
        echo "No or wrong arg (<java version>)"
        return 1;
    end

    set -l version_prefix "1."
    set -l given_java_version $argv[1]
    set -l version $version_prefix$given_java_version

    /usr/libexec/java_home -v $version > /dev/null 2>&1
    if not test $status -eq 0
        echo "Given java version not available"
        /usr/libexec/java_home -V
        return 1;
    end

    set -gx JAVA_HOME (/usr/libexec/java_home -v $version)
    echo "Set java version to $version"
    return 0;

end
