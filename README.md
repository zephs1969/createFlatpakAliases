# createFlatpakAliases
A CLI tool (bash script) to automatically create at runtime flatpak aliases  

Usage:
- Download the script and copy it into your "$PATH" - for example `~/.local/bin` or `~/.bin`
- Make it executable with `chmod +x flatpak_aliases.sh`
- Add the line `source flatpak_aliases.sh` in yours .rc file (e.g. `~/.bashrc` or `~/.zshrc`)
- If you add `show` as a parameter, a list of the generated aliases will be printed on screen (e.g. `source flatpak_aliases.sh show`)

How it works:
1. It searches for your installed Flatpak apps in `/var/lib/flatpak/app`
2. From the list it is extracting the application name in lower cases and creates an alias statement (e.g. alias name='flatpak run "application ID" &' )
3. At runtime the script executes the created statement... e.g. "alias libreoffice='flatpak run org.libreoffice.LibreOffice &'
4. If the script is sourced in yours .rc file and a new terminal session is running, every currently availble flatpak application has an alias.
