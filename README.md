# createFlatpakAliases
a CLI tool (script) to automatically create at runtime a flatpak aliases in BASH, FISH and ZSH 

Usage:
- download the script and copy it into your "$PATH" - for example `~/.local/bin` or `~/.bin`
- make it executable with `chmod +x flatpak_aliases.sh`
- add the line `source flatpak_aliases.sh` in yours .rc file (e.g. `~/.bashrc` or `~/.zshrc`)
- if you add `show` as parameter, a list of the generated aliases is printed on screen (e.g. `source flatpak_aliases.sh show`)

How it works:
1. It searches for your installed Flatpak apps in `/var/lib/flatpak/app`
2. From the list it is extracting the application name in lower cases and creates an alias statement (e.g. alias name='flatpak run "application ID" &' )
3. at runtime the script executes the created statement... e.g. "alias libreoffice='flatpak run org.libreoffice.LibreOffice &'
4. if the script is sourced in yours .rc file and a terminal session is starting every currently availble flatpak application has an alias.
