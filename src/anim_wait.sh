Wait(){
    [ "$2" = '' ] && local waitTime=0.05
    [ "$2" != '' ] && local waitTime=$2
    local count=0
    while [ $count -lt ${#1} ]; do
        local target="${1:$count:1}"
        echo -n "$target"
        ((count++))
        sleep "$waitTime"
    done
}
