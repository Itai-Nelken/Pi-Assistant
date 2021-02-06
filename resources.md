# Links to resources I used:
## ascii art banners
https://manytools.org/hacker-tools/ascii-banner/<br>
https://manytools.org/hacker-tools/convert-images-to-ascii-art/<br>
http://www.patorjk.com/software/taag/#p=display&f=Graffiti&t=Type%20Something%20
## stack exchange questions that I asked/found that helped me (not only with Pi-Assistant)
https://unix.stackexchange.com/questions/166052/usage-of-set-e-in-bash<br>
https://unix.stackexchange.com/questions/631805/how-to-hold-package-from-updating-with-postinst-script-in-deb<br>
https://unix.stackexchange.com/questions/632890/how-to-pass-variables-between-2-bash-scripts-export-doesnt-work<br>
https://unix.stackexchange.com/questions/632337/how-to-check-if-a-program-version-is-equal-to-or-smaller-than-x/<br>
### unanswered
https://unix.stackexchange.com/questions/630716/how-to-cross-compile-qemu-for-armhf-arm64-on-x86-64<br>

## other unrelated links
https://raspberrypi.stackexchange.com/questions/120833/pi4-crashes-when-running-any-qt-apps-like-rpi-imager-vlc-obs<br>
https://www.raspberrypi.org/forums/viewtopic.php?f=28&t=302170&p=1811670<br>

## Some scripts
### do something if command succeeds/fails
```bash
#!/bin/bash

$1 &> /dev/null
RESULT=$?
if [ $RESULT == 0 ]; then
  echo success
else
  echo failed
fi
```