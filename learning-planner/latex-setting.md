# Latex Setting

To create the project some setting and configuration has been followed.
I will list them down here.

(a) Latex Installation: Install Latex and check if can produce main.pdf file by compiling simple main.tex
Installation Reference: `https://www.latex-project.org/get/`

(b) Compilation Validation: If you are using terminal you can run `latexmk main.tex` 

(c) VS Code workspace Setting: 
You can install extension [https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop](link)


Now you can customize it by copy pasting this project .vscode folder into your new project.
(it has just one addition setting of writing all auxilary file in in  \out directory)

(d) .gitignore
Now you can copy past current .gitginore to your directory.
It basically ignores any generated file.

(c) Final
Now if you are using code, just `CTRL+S`.
It will trigger the build command from setting.json and you pdf file will be present in \out folder.


## Second 