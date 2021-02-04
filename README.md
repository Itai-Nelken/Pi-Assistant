# <img src="/icons/pi-assistant-logopng.png" alt="logo" width="60"/> Pi-Assistant

Pi-Assistant is a simple terminal app made for the Raspberry Pi that makes updating the system, installing apps, viewing system information, and more easier and faster, especially if you are new to the Linux command line or you forget the commands.

## links

* [My blog](https://thepisite.blogspot.com/)
* [My Raspberry Pi YouTube channel](https://youtube.com/channel/UCaKFjYULBDdkfEcx6oy9Gow)
* [My other YouTube channel](https://youtube.com/channel/UCM4Fo6ncNybS1xhJHnWSODg)

## Installation 

to install Pi-Assistant, just copy the following into terminal:
```
$ wget -qO- https://raw.githubusercontent.com/Itai-Nelken/Pi-Assistant/main/install.sh | bash
```
### Install beta version (not always available)
1) go to the beta branch
2) download the specific beta scripts you want
3) replace the "stable" scripts with the "beta" scripts you just downloaded<br>
**Don't update Pi-Assistant or the beta scripts will be replaced with the stable ones**

## Run Pi-Assistant

To run Pi-Assistant, use the menu or Desktop shortcuts. alternatively you can type in terminal (from anywhere) `piassist`<br>
when running with `piassist` you can add flags, to see a list off all flags run `piassist --help`.
### Flags
`--help` - show all flags and how to use them.<br>
`--no-internet` - run pi-assistant without internet.<br>
`--no-update` - don't update on startup (donesn't work yet)<br>
`--version` - show version.<br>
`--secret` - a secret easter egg :upside_down_face:<br>

### if you have any questions, check the [FAQ](https://github.com/Itai-Nelken/Pi-Assistant#faq) before opening a issue please.

## Updates

Pi-Assistant checks for updates and if there are installs them automatically on startup.<br>
To update manually, start Pi-Assistant and go to `other>update-this-tool`
if that doesn't work, or you think something is broken with the scripts, run this command:
```sh-seesion
$ wget -qO- https://raw.githubusercontent.com/Itai-Nelken/Pi-Assistant/main/updater.sh | bash
```

## removal
Pi-Assistant v1.1.1 and later has a removal script in `other>remove` if you have an earlier version or need to manually remove, open terminal and copy: 
```sh-session
$ wget -qO- https://raw.githubusercontent.com/Itai-Nelken/Pi-Assistant/main/uninstall.sh | bash
```

## Screenshots

![piassist-mainmenu.png](screenshots/piassist-mainmenu.png)
![spiassist-appmenu.png](screenshots/piassist-appmenu.png)
![piassist-demo.gif](screenshots/piassist-demo.gif)
![piassist-sys-tools.png](screenshots/piassist-sys-info.png)


## CHANGELOG (dd/mm/yy)

 * 20/10/2020 - shortened time about and credits are shown by 1 second, improvements to installation scripts, install script now creates menu shortcut
 * 20/10/2020 - BIG UPDATE: v1.1: added more apps, changed autoremove with apt tools (containing autoremove and autoclean), when commands finish running the script returns to the main menu and more
 * 21/10/2020 - added updater script that runs on startup (disabled because it doesn't work) , version 1.1.1 released, added uninstall script, now you can update manually from system-tools. fixed countless bugs.
 * 26/10/2020 - fixed updater (might not work), bug fixes and improvements. 
 * 1/11/2020 - renamed system-tools to Pi-Assistant, more bug fixes. 
 * 13/11/2020 - UPDATE: v1.1.2: fixed bug where the change-password.sh script wasn't executable, more bug fixes, added more apps
 * 13/11/2020 - UPDATE: v1.1.3: add Balena Etcher app
 * 14/11/2020 - rename 'apt-tools' to 'system-tools', add 'clear swap' option to 'system-tools'
 * 15/11/2020 - UPDATE: v1.1.4: added Zoom with box86
 * 16/11/2020 - added box86 app, fixed bug with install2.sh
 * 25/11/2020 - UPDATE: v1.1.5: bug fixes, updated box86 installer.
 * 9/1/2021 - started working on v1.2 - adding a dialog gui. ~~check out [the branch](https://github.com/Itai-Nelken/Pi-Assistant/tree/dialog-gui-testing) if you want to test it.~~ edit: the branch is nonexistent, I merged it.
 * 10/1/2021 - GIANT UPDATE: finished rewriting everything for the 2nd time (:tired_face:) then figured out how to merge a conflicting branch (gave up so I downloaded the test branch and deleted it along with everything in the main branch, then I uploaded all the scripts again). at least now everything should work!<br>
added flags to piassist (and main.sh), run `piassist --help` to see all of them.
* 19/1/2021 - UPDATE: v1.2 final, added system info script, fixed a few bugs, fixed updater al last!
* 23/1/2021 - UPDATE: v1.2.1 - fixed `--no-internet` and `--no-update` flags don't work when launching using `piassist`, made startup time after option completes way shorter using the `--no-internet flag` (that make Pi-Assistant not check for internet and updates, so makes startup time way faster).
  
## Known issues and bugs
* The updater always runs on startup for some reason.
* if you installed when the name was system-tools, then after updating to the version after the rename the icons won't change. 
* zoom menu icon doesn't work for some reason.

### Fixed temporarily
- zoom installer is broken because it can't download zoom for some reason

 
## To do:

- [x] return to main menu instead of exiting when executed command finishes
- [x] add uninstall script
- [x] add updater script 
- [x] make updater script to run on startup (disable by using the `--no-update` flag. the `--no-internet` flag disables updates as well.)
- [x] add zoom & box86
- [x] add box86 as standalone app 
- [x] add etcher (newest version, the one with 'Flash from URL' and 'clone drive'). (added as of v1.1.3, installs 32 or 64 bit version depending on your system architecture)
- [ ] add box86 install script for 64bit OS's
- [x] add dialog GUI
- [ ] maybe change whole gui to use YAD?


## FAQ

**Q:**<br>
>How can I start Pi-Assistant without a internet connection?

**A:**<br>
run Pi-Assistant from terminal with this command: `piassist --no-internet`

**Q:**<br>
>How can I disable update on startup?

**A:**<br>
run Pi-Assistant from terminal with the `--no-update` flag like this: `piassist --no-update`
