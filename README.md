# system-tools

system-tools is a simple terminal app that makes updating the system, installing apps and more, easier and faster, especially if you are new to the Linux command line or you forget the commands.

## links

* [My blog](https://thepisite.blogspot.com/)
* [YouTube](https://youtube.com/channel/UCM4Fo6ncNybS1xhJHnWSODg)

## Installation and updates

to install system-tools, just type the following into terminal:
git clone https://github.com/Itai-Nelken/system-tools.git && cd system-tools && sudo chmod +x install.sh && ./install.sh<br>
system tools has a automatic updater that runs on startup, to get it, you have to reinstall system tools to the latest version if you have Version 1.0.

## Screenshots

![system-tools1](screenshots/system-tools-1b.png)
![system-tools2](screenshots/system-tools-2a.png)


## CHANGELOG (dd/mm/yy)

 * 20/10/2020 - shortened time about and credits are shown by 1 second, improvements to installation scripts, install script now creates menu shortcut
 * 20/10/2020 - BIG UPDATE: v1.1: added more apps, changed autoremove with apt tools (containing autoremove and autoclean), when commands finish running the script returns to the main menu and more
 * 21/10/2020 - added updater script that runs on startup, added uninstall script, now you can update manually from system-tools.
  
## To do:

- [x] return to main menu instead of exiting when executed command finishes
- [x] add update on startup script
- [x] add uninstall script
- [ ] add more features
