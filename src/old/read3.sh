Read(){
    read -n1 input
    [[ $input == $'\x1b' ]] && { local input2=''; read -r -n2 -s input2; input+="$input2"; }
#read input
    echo $input
    echo "input='$input' xxd="`echo $input | xxd -p`
    inputHex=`echo $input | xxd -p`
#[[ $'\x0a' == $input ]] && echo ENTER!
    [[ '0a' == $inputHex ]] && echo ENTER!
    [[ '20' == $inputHex ]] && echo Space!
    [[ '1b' == $inputHex ]] && echo ESC!
}
Read
