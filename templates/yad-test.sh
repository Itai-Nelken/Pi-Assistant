#!/bin/bash
yad --width=300 --height=60 --button=cancel:0 --button=continue:1 --title "example" --text="example text, click continue to see what comes next" --center 

button=$?


if [[ $button -eq 1 ]]; then
 yad --width=300  --button=exit:0 --title "example ended" --text="test" --on-top

elif [[ $button -eq 0 ]]; then
 exit
fi