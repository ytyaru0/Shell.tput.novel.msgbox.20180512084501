Menu(){
    local cursor=0
    for ((i=0; i<=$#; i++)); do
        [ $i -eq $cursor ] && local pre='>'
        [ $i -ne $cursor ] && local pre=' '
        echo "$pre ${@:((i+1)):1}"
    done
    local input=''
    local input2=''

    while : ; do
        #read -s -n1 input
        read -n1 input
        echo "read='$input'"
        case "$input" in
            ' ') return $cursor;;
            $'\x20') return $cursor;;
            $'\x0a') return $cursor;;
        esac
        if [[ $input == $'\x1b' ]]; then
            read -r -n2 -s input2
            input+="$input2"
            case "$input" in
                $'\x1b\x5b\x41') { [ 0 -lt $cursor ] && { ((cursor--)); break; } };;
                $'\x1b\x5b\x42') { [ $cursor -lt $# ] && { ((cursor++)); break; } };;
            esac
        fi
    done
}
Menu "はい" "いいえ"
res=$?
echo $res
