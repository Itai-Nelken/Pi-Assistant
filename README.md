# <img src="https://github.com/Itai-Nelken/Pi-Assistant/raw/main/icons/pi-assistant-logopng.png" alt="logo" width="60"/> Pi-Assistant

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

## Use Pi-Assistant
### Run Pi-Assistant
To run Pi-Assistant, use the menu or Desktop shortcuts. alternatively you can type in terminal (from anywhere) `piassist`<br>
when running with `piassist` you can add flags, to see a list off all flags run `piassist --help` or see the list bellow.
### Flags
`--help` - show all flags and how to use them.<br>
`--no-internet` - run pi-assistant without internet.<br>
`--no-update` - don't update on startup (doesn't work yet, but fixed in the beta version!)<br>
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
![piassist-mainmenu.png](https://github.com/Itai-Nelken/Pi-Assistant/raw/main/screenshots/piassist-mainmenu.png)
![piassist-demo.gif](https://github.com/Itai-Nelken/Pi-Assistant/raw/main/screenshots/piassist-demo.gif)
![piassist-sys-tools.png](https://github.com/Itai-Nelken/Pi-Assistant/raw/main/screenshots/piassist-sys-info.png)
### [More screenshots](https://github.com/Itai-Nelken/Pi-Assistant/blob/main/SCREENSHOTS.md#pi-assistant-screenshots)

# [CHANGELOG](https://github.com/Itai-Nelken/Pi-Assistant/blob/main/CHANGELOG.md#pi-assistants-changelog)

  
## Known issues and bugs
* The updater always runs on startup for some reason.
* if you installed when the name was system-tools, then after updating to the version after the rename the icons won't change. 
* zoom menu icon doesn't work for some reason.

### Fixed temporarily
- zoom installer is broken because it can't download zoom for some reason

## Internal stuff (commands used by the scripts)
### Updater flags (meant for the internal use of the scripts)
**Usage of the updater:**<br>

`~/Pi-Assistant/updater.sh --flag` but change `--flag` with a real falg or remove it to run the default.
`--no-output` - update with no extra output (for example don't print 'checking for updates'). used when Pi-Assistant is starting.
`--no-ask-exit-output` - don't ask to exit and don't print any extra output (has no use as of writing).
`--output-no-ask-exit` - print extra output but don't ask to exit (used when manually updating).
the default is to print extra output and ask to exit, the flags that have no use are there just to have all options.

## To do:

- [x] return to main menu instead of exiting when executed command finishes
- [x] add uninstall script
- [x] add updater script 
- [x] make updater script to run on startup (disable by using the `--no-update` flag. the `--no-internet` flag disables updates as well.)
- [x] add dialog GUI
- [ ] add my QEMU debs.
- [ ] add box86 install script for 64bit OS's
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

## Notes
Checking the public ip address for the system-information, an [external service](http://ipinfo.io) is used. the exact link the script uses: http://ipinfo.io/ip/
