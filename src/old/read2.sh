read -n1 input
echo $input
echo "input='$input' xxd="`echo $input | xxd -p`
inputHex=`echo $input | xxd -p`
#[[ $'\x0a' == $input ]] && echo ENTER!
[[ '0a' == $inputHex ]] && echo ENTER!
