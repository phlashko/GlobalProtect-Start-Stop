##########################################################################
# ** Checks to see if batch script is already is made, if so deletes it **
##########################################################################
$filename = "C:\Temp\batch.bat"
if (Test-Path $filename) {
    Remove-Item $filename
}

##########################################################################
# This checks to see if script is running as admin, then spawns if not ***
##########################################################################
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))

{   
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}

##########################################################################
# ****** This creates the bash script to be used to kill GP stuff* *******
##########################################################################
New-Item -Path C:\Temp\batch.bat
Add-Content -Path C:\Temp\batch.bat "echo off"
Add-Content -Path C:\Temp\batch.bat "taskkill /f /im pangpa.exe"
Add-Content -Path C:\Temp\batch.bat "sc stop PanGPS"
Add-Content -Path C:\Temp\batch.bat "rem sc config PanGPS start= demand"
Add-Content -Path C:\Temp\batch.bat "rem pause"

##########################################################################
# ****** This allows for dialog boxes to be utilized in the script *******
##########################################################################
[reflection.assembly]::LoadWithPartialName("System.Windows.Forms")
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

##########################################################################
# ******************** This is the gui container *************************
##########################################################################
$folderForm = New-Object System.Windows.Forms.Form
$folderForm.Text = "Phlashko's G.P. Start/Stop"
$folderForm.Size = "365,100"

##########################################################################
# ************* This adds the Stop It button to the gui ****************** 
##########################################################################
$StopButton = New-Object System.Windows.Forms.Button

$StopButton.Text = 'Stop It'
$StopButton.Location = '180,10'
$StopButton.BackColor = 'Red'
$StopButton.Size = "150,40"
$StopButton.Font = New-Object System.Drawing.Font("Lucida Console",14,[System.Drawing.FontStyle]::Regular)

$folderForm.Controls.Add($StopButton)

##########################################################################
# ************ This makes the Stop It Button Stop GP auto respawn ********
##########################################################################
$StopButton.Add_Click({
    cmd /c "C:\Temp\batch.bat"
})

##########################################################################
# ************* This adds the Start It button to the gui ************** 
##########################################################################
$StartButton = New-Object System.Windows.Forms.Button

$StartButton.Text = 'Start It'
$StartButton.Location = '20,10'
$StartButton.BackColor = 'Green'
$StartButton.Size = "150,40"
$StartButton.Font = New-Object System.Drawing.Font("Lucida Console",14,[System.Drawing.FontStyle]::Regular)

$folderForm.Controls.Add($StartButton)

##########################################################################
# ************ This makes the Start It Button the selected file **********
##########################################################################
$StartButton.Add_Click({
    cmd /c "sc start PanGPS"
})

##########################################################################
# ****** This is the end that shows everything above on one nice gui *****
##########################################################################
$folderForm.ShowDialog()