selected=$(\
  cat ~/icon-list.txt \
    | rofi -dmenu -i -markup-rows \
    -p "Select icon: ")

# exit if nothing is selected
[[ -z $selected ]] && exit

echo -ne $(echo "$selected" |\
  awk -F';' -v RS='>' '
    NR==2{sub("&#x","",$1);print "\\u" $1;exit}'
) | wl-copy 

