# Caja/Nautilus/Thunar Scripts
Some useful scripts written for myself. Maybe will be useful for you too.

## link_sosedi.sh
Bash script. A tool for icon theme makers. it creates relative symlinks in (neighboring to the current) folders to the same targets. Used for Nautilus, Caja and Thunar actions.

The princip of working:<br>
It creates link targeted to "folder.png" with name "folder-closed.png" in folders: theme/places/16, theme/places/22, theme/places/24, theme/places/32 and theme/places/48 at one action.

## refresh_thumbs.sh
Updates thumbnail of any thumbnailed file, or group of files. Needs *gio* as dependency.

## symlink2file.sh
Converts symlink to it's original target.

## linkerator.sh
Transforms all selected (or typed as arguments in terminal) files to relative soft links of one file, that you are naming in zenity text-input dialog. Depends on package *zenity*.

# Caja/Nautilus only Scripts

## backup.awk
AWK script for making backups with current date/time in filename of files in ~/bak/{name_of_folder_with_files}.
Just select files, and apply this script. Time format is currently in Russian style.

## lincentrator.sh
Useful for icon theme makers. if you have many identical files with different names, and even soft links to them in one directory, and you need the original to be one, and the rest to be links to it, then this script is what you need! It finds all dupes (even soft links) in current directory by checksum. Select any **<u>different</u>** files or soft links in one directory, and apply this script.<br>P.S. All messages are currently in Russian.

## hardlink_to_next_panel.awk

AWK script. Works only with Nautilus and Caja. Makes hardlinks of selected files to next panel in double-panel window of Nautilus or Caja.