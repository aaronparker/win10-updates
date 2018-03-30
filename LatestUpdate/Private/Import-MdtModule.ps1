Function Import-MdtModule {
    <#
    .SYNOPSIS
        Imports the MDT PowerShell module.

    .DESCRIPTION
        Imports the MDT PowerShell module.

    .NOTES
        Author: Aaron Parker
        Twitter: @stealthpuppy
    #>
    # If we can find the MDT PowerShell module, import it. Requires MDT console to be installed
    $InstallDir = Get-ValidPath "$((Get-ItemProperty "HKLM:SOFTWARE\Microsoft\Deployment 4").Install_Dir)"
    $MdtModule = "$($InstallDir)\bin\MicrosoftDeploymentToolkit.psd1"
    If (Test-Path -Path $MdtModule) {
        Try {            
            Import-Module -Name $MdtModule -ErrorAction SilentlyContinue
            Return $True
        }
        Catch {
            Throw "Could not load MDT PowerShell Module. Please make sure that the MDT console is installed correctly."
            Return $False
        }
    }
    Else {
        Throw "Cannot find the MDT PowerShell module. Is the MDT console installed?"
        Return $False
    }
}