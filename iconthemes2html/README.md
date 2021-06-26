# Icon Themes 2 HTML

AWK Script for comparing icon themes. It parses *index.theme* file in icon theme folder, finds all icons in all included folders, and creates html files (separated and named by context of icon group) with comparison between themes.<br>How to use:
```
./iconthemes2html.awk [file]... [option]...
```

Files must be correct index.theme files with path.
<br>**Options are:**<br>
**-c** contexts for parsing. Syntax: `-c=Actions,Places,MimeTypes`<br>
**-s** sizes to parse. Syntax: `-s=16,24,32`<br>
**-d** description file. Syntax: `-d=/path/icons_descripnions`<br>
**-u** user list of contexts, icons, and their descriptions; same as **-d**, but ignores icons, those aren't in list. Syntax: `-u=/path/list`<br>

```
# any comment
Context1 #one word;first letter is Uppercase
Description of context1 #  must contain spaces
# first - name of an icon w/o spaces or capitals, after <tab> - description of icon.
icon1	Description of icon1
icon2	Desc of icon2
icon3	Desc of icon3
Context2
Desc of cont2
icon21	Desc of icon21
icon22	Desc of icon22
```

**-f** folder for saving html files. Syntax: `-f=/path`<br>

Single click on icon copies to clipboard absolute path to current icon file, double click copies absolute path to target (if it's a symlink).
Gray background means that current image recognized as is symlink while directory listing.<br>
When opening single theme file it draws one a table for all icons in context.

*Screenshots:*<br>
![output html page](ith2html.png)<br>
![output html page](ith2html_single.png)