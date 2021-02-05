 # Pi-Assistants Changelog.
 **here all major Pi-Assistant events will be recorded, I highly recommend to read this changelog.**
 
 ### (DD/MM/YY)
 * **20/10/2020** - shortened time about and credits are shown by 1 second, improvements to installation scripts, install script now creates menu shortcut
 * **20/10/2020** - BIG UPDATE: v1.1: added more apps, changed autoremove with apt tools (containing autoremove and autoclean), when commands finish running the script returns to the main menu and more
 * **21/10/2020** - added updater script that runs on startup (disabled because it doesn't work) , version 1.1.1 released, added uninstall script, now you can update manually from system-tools. fixed countless bugs.
 * **26/10/2020** - fixed updater (might not work), bug fixes and improvements. 
 * **1/11/2020** - renamed system-tools to Pi-Assistant, more bug fixes. 
 * **13/11/2020** - UPDATE: v1.1.2: fixed bug where the change-password.sh script wasn't executable, more bug fixes, added more apps
 * **13/11/2020** - UPDATE: v1.1.3: add Balena Etcher app
 * **14/11/2020** - rename 'apt-tools' to 'system-tools', add 'clear swap' option to 'system-tools'
 * **15/11/2020** - UPDATE: v1.1.4: added Zoom with box86
 * **16/11/2020** - added box86 app, fixed bug with install2.sh
 * **25/11/2020** - UPDATE: v1.1.5: bug fixes, updated box86 installer.
 * **9/1/2021** - started working on v1.2 - adding a dialog gui. ~~check out [the branch](https://github.com/Itai-Nelken/Pi-Assistant/tree/dialog-gui-testing) if you want to test it.~~ edit: the branch is nonexistent, I merged it.
 * **10/1/2021** - GIANT UPDATE: finished rewriting everything for the 2nd time (:tired_face:) then figured out how to merge a conflicting branch (gave up so I downloaded the test branch and deleted it along with everything in the main branch, then I uploaded all the scripts again). at least now everything should work!<br>
added flags to piassist (and main.sh), run `piassist --help` to see all of them.
* **19/1/2021** - UPDATE: v1.2 final, added system info script, fixed a few bugs, fixed updater at last!
* **23/1/2021** - UPDATE: v1.2.1 - fixed `--no-internet` and `--no-update` flags don't work when launching using `piassist`, made startup time after option completes way shorter using the `--no-internet flag` (that make Pi-Assistant not check for internet and updates, so makes startup time way faster).
* **5/2/2021** - found out why the updater refreshed the menu and desktop shortcuts even when no updates are available, pushed the fix to the beta branch.<br>Updated etcher install script to always download and install latest release and made it use a better system architecture detection. fixed a few typos in different files.<br>getting ready to merge the beta branch and release v1.3.0!


## [Back to Readme](https://github.com/Itai-Nelken/Pi-Assistant#-pi-assistant)
<!--
# Nothing here is visible.
TEMPLATE:

* **DD/MM/YY** - fixed... added... getting ready to... etc.
* **DD/MM/YY** - UPDATE: vx.y.z - fixed... added... etc.
* **DD/MM/YY** - BIG UPDATE: vx.y.z - fixed... added... etc.

#DD/MM/YY example
DD=5
MM=2
YY=2021
||
\/
5/2/2021
-->
