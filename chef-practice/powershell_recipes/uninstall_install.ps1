$app = Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE Name = 'TextPad 8'"
$app.Uninstall()
#$pathvargs = {c:\Users\vishnuch\Downloads\txpeng812-64\setup.exe /S /v/qn }
$pathvargs = {c:\Users\vishnuch\Downloads\txpeng764-64\setup.exe /S /v/qn }
Invoke-Command -ScriptBlock $pathvargs
