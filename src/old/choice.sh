Choice(){
    tput 
    local cursor=0
    while : ; do
        for ((i=0; i<=$#; i++)); do
            [ $i -eq $cursor ] && local pre='>'
            [ $i -ne $cursor ] && local pre=' '
            echo "$pre ${@:((i+1)):1}"
        done
        tput cuu $(($# + 1))
        tput cub `tput cols`
        local input=''
        local input2=''

        read -r -s -n1 input
        if [[ $input == $'\x1b' ]]; then
            read -r -n2 -s input2
            #input+="$input2"
            #echo "input='$input' xxd="`echo $input | xxd -p`
            input2=`echo -n $input2 | xxd -p`
            #echo "$input2 $#=$# cursor=$cursor"
            case "$input2" in
                '5b41') { [ 0 -lt $cursor ] && { ((cursor--)); continue; } };;
                '5b42') { [ $cursor -lt $(($# - 1)) ] && { ((cursor++)); continue; } };;
            esac
            #case $input in
            #    $'\x1b\x5b\x41') { [ 0 -lt $cursor ] && { ((cursor--)); continue; } };;
            #    $'\x1b\x5b\x42') { [ $cursor -lt $# ] && { ((cursor++)); continue; } };;
            #esac
        fi
        [[ $'\x0a' == $input ]] && return $cursor;
    done
}
Choice "はい" "いいえ"
res=$?
echo $res
