. $(cd $(dirname $0); pwd)/anim_wait.sh
. $(cd $(dirname $0); pwd)/choice.sh
Wait "何かしらの質問文ですが何か問題でも？" 0.005
echo ''
Choice "はい" "いいえ"
res=$?
[ $res -eq 0 ] && echo YES
[ $res -eq 1 ] && echo NO
echo $res
