$version = "8.12.2"
$filebeat = @{
  Url = "https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$version-windows-x86_64.zip"
  OutputFile = "filebeat.zip"
  DestinationPath = "C:\Program Files"
  OldName = "filebeat-$version-windows-x86_64"
  NewName = "Filebeat"
}

Invoke-WebRequest -Uri $filebeat.Url -OutFile $filebeat.OutputFile
Expand-Archive -Path $filebeat.OutputFile -DestinationPath $filebeat.DestinationPath

$oldPath = Join-Path -Path $filebeat.DestinationPath -ChildPath $filebeat.OldName
$newPath = Join-Path -Path $filebeat.DestinationPath -ChildPath $filebeat.NewName
Rename-Item -Path $oldPath -NewName $filebeat.NewName

Set-Location -Path $newPath
.\install-service-filebeat.ps1
