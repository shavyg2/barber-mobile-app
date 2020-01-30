
while($true){
    cmd /c "$PSScriptRoot\build.cmd";
    Start-Sleep (60 * 5);
}