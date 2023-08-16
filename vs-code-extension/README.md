vs-vode-extension try create grammer extension that highlight part of text in vs code itself.

Steps to Build & Use:
go to latex-grammer and modify tex.tmGrammer.json as per your need using regex.
This defines the scope which you can use in your project's .vscode/setting.json

After that press F5, and check its working.

If all okay and ready to export, then type `vsce pacakge` and create a *.vsix file.

Go to your project where you want to add it, and open command platter (CTRL+SHIFT+P) type Install from VSIX, and select the newly created file location.

That's all now in you project setting.json you can highlight that text with any color you want, along with font-weight, italics only.