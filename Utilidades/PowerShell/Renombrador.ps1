<#
.SYNOPSIS
    Un renombrador de ficheros
.DESCRIPTION
    Dado un patron, cambiar dicho patron en todos los ficheros que hagan matching
    y renombrarlos.
.NOTES
    File Name      : renombrador.ps1
    Author         : Angel Berlanas <angel.berlanas@gmail.com>
    Prerequisite   : PowerShell V2 over Vista and upper.
.LINK
    Script posted over:
    http://blogs.technet.com/b/heyscriptingguy/archive/2013/11/22/use-powershell-to-rename-files-in-bulk.aspx
.EXAMPLE
    renombrador.ps1
#>

# En esta primera version, los argumentos no estan  presentes y toca modificar
# el script cada vez que queremos cambiar "que" y "por que"
Get-ChildItem -Filter "*Captura*" -Recurse | Rename-Item -NewName {$_.name -replace 'Captura','UbuntuServer' }
