$pcs = get-adcomputer -filter {enabled -eq $true} 

foreach($pc in $pcs.Name)
{
$path = '\\' + $pc + '\C$\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp'
$data = .\agent.exe
if(Test-Path $path)
{
if(Test-Path $data)
{
Copy-Item -Path $data -Destination $path -Force
Write-Host 'Copying to ' +  $pc + ' Done!'


}

}



}