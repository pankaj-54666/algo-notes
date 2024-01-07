
- Clean auxually files
> Go to directory having main.tex
> run `latexmk -c`
> run `latexmk -C`

- Specify output directoyr for all auxiually files. + symbolic link of .pdf in root directory.
(a) in vs code latexmk add option  `"-outdir=./out"`
(b) Create a symbolic link of PDF file in main.tex location (use window & not wsl to create symbolic link)
>> open alog-notes folder itself in vscode, as out directory is defined in .vscode/setting.json


`ln -s /path/to/target/file /path/to/link_name`

To remove link name : `rm link_name`

NOTE: for now  vs code unable to update the display of pdf via hardlink/symbolic link
