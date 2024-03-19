$url = "https://github.com/taylormonacelli/goldpuppy/releases/latest/download/goldpuppy_Windows_x86_64.zip"
Invoke-WebRequest -Uri $url -OutFile goldpuppy.zip
Expand-Archive -Path goldpuppy.zip -DestinationPath C:\Windows
