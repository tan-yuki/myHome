#! /bin/bash
ESC="\e]4;"
echo -e \
       "${ESC}0;#000000\\a" \
       "${ESC}1;#ff0000\\a" \
       "${ESC}2;#00ff00\\a" \
       "${ESC}3;#ffff00\\a" \
       "${ESC}4;#4444ff\\a" \
       "${ESC}5;#ff00ff\\a" \
       "${ESC}6;#00ffff\\a" \
       "${ESC}7;#bbbbbb\\a" \
       "${ESC}8;#666666\\a" \
       "${ESC}9;#ff9999\\a" \
       "${ESC}a;#99ff99\\a" \
       "${ESC}b;#ffff99\\a" \
       "${ESC}c;#9999ff\\a" \
       "${ESC}d;#ff99ff\\a" \
       "${ESC}e;#99ffff\\a" \
       "${ESC}f;#ffffff\\a"
