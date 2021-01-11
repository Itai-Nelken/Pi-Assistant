yad --timeout=15 --timeout-indicator=top --button=cancel:1 --on-top --center --title="installing snap-store" --text="<b>to complete installation you need to reboot. you can always reboot later.</b>"

button=$?

if [[ $button -eq 1 ]]; then
echo "won't reboot. please reboot later"
else
echo "sudo reboot"
fi
