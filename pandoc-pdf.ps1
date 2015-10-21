Write-Host "Procesando Tema 1: ...Teoria"
pandoc --template template-latex.latex  --toc -V fontsize=12pt -o PDFS/Unidad_01.pdf Unidad_01/ArquitecturaSistemaInformatico.md Unidad_01/ArquitecturaSistemaOperativo.md Unidad_01/Licencias.md Unidad_01/SistemasDeVirtualizacion.md Unidad_01/InstalacionVirtualbox.md Unidad_01/InstalacionQEmu.md

Write-Host "Procesando Tema 1: ...Guias"
pandoc --template template-latex.latex --toc -V fontsize=12pt -o PDFS/GuiasInstalacion_UbuntuServer.pdf Unidad_01/InstalacionUbuntuServer.md
pandoc --template template-latex.latex --toc -V fontsize=12pt -o PDFS/GuiasInstalacion_UbuntuDesktop.pdf Unidad_01/InstalacionUbuntuDesktop.md

Write-Host "Procesando Tema 1: ...Ejercicios"
pandoc --template template-latex.latex -V fontsize=12pt -o PDFS/Unidad_01_Ejercicios.pdf Unidad_01/Ejercicios.md

Write-Host "******"
Write-Host "Procesando Glosarios"
pandoc --template template-latex.latex -V fontsize=12pt -o PDFS/Glosario.pdf Unidad_01/Glosario.md
