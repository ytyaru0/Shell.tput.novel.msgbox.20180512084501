GetRows(){ local v=`tput lines`; echo $v; }
GetCols(){ local v=`tput cols`; echo $v; }
GetRow(){
    { local ROW; local COL; }
    IFS=';' read -sdR -p $'\E[6n' ROW COL
    echo "${ROW#*[}"
}
GetCol(){
    { local ROW; local COL; }
    IFS=';' read -sdR -p $'\E[6n' ROW COL
    echo "${COL#*[}"
}
