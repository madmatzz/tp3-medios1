Get-ChildItem -Filter *.gif | ForEach-Object {
    $outName = $_.BaseName + ".mp4"
    Write-Host "Converting $($_.Name) to $outName..."
    ffmpeg -y -v warning -i $_.FullName -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" $outName
}
Write-Host "Conversion finished."
