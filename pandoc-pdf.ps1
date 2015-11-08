Write-Host "Procesando Tema 1: ...Teoria"
#pandoc --template template-latex.latex  --toc -V fontsize=12pt -o PDFS/Unidad_01.pdf Unidad_01/ArquitecturaSistemaInformatico.md Unidad_01/ArquitecturaSistemaOperativo.md Unidad_01/Licencias.md Unidad_01/SistemasDeVirtualizacion.md Unidad_01/InstalacionVirtualbox.md Unidad_01/InstalacionQEmu.md

Write-Host "Procesando Tema 1: ...Ejercicios"
#pandoc --template template-latex.latex -V fontsize=12pt -o PDFS/Unidad_01_Ejercicios.pdf Unidad_01/Ejercicios.md
#pandoc --template template-latex.latex -V fontsize=12pt -o PDFS/Unidad_02_Ejercicios.pdf Unidad_01/Ejercicios_2.md

Write-Host "Procesando Tema 2: ...Teoria"
pandoc --template template-latex.latex  --toc -V fontsize=12pt -o PDFS/Unidad_02_GestoresDeArranque.pdf Unidad_02/GestoresDeArranque.md
pandoc --template template-latex.latex  --toc -V fontsize=12pt -o PDFS/Unidad_02_UsuariosEnLinuX.pdf Unidad_02/UsuariosEnLinuX.md Unidad_02/ComandosBasicos.md

Write-Host "Procesando Tema 2: ...Anexos"
pandoc --template template-latex.latex  --toc -V fontsize=12pt -o PDFS/Unidad_02_Anexos.pdf Unidad_02/Anexo_IRQ.md


Write-Host "Procesando Guias"
#pandoc --template template-latex.latex --toc -V fontsize=12pt -o PDFS/GuiasInstalacion_UbuntuServer.pdf Guias/InstalacionUbuntuServer.md
#pandoc --template template-latex.latex --toc -V fontsize=12pt -o PDFS/GuiasInstalacion_UbuntuDesktop.pdf Guias/InstalacionUbuntuDesktop.md
#pandoc --template template-latex.latex --toc -V fontsize=12pt -o PDFS/GuiasInstalacion_Debian8.pdf Guias/InstalacionDebian8.md
#pandoc --template template-latex.latex --toc -V fontsize=12pt -o PDFS/GuiasInstalacion_Windows7.pdf Guias/InstalacionWindows7.md

Write-Host "******"
Write-Host "Procesando Glosarios"
#pandoc --template template-latex.latex -V fontsize=12pt -o PDFS/Glosario.pdf Unidad_01/Glosario.md Unidad_02/Glosario.md

Write-Host "Completado"
