#Persistent
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

~^c::
if (A_PriorHotkey = "~^c" and A_TimeSincePriorHotkey < 400)
{
    if WinExist("PLaMo翻訳")
    {
        WinActivate
        Sleep, 500
    }
    else
    {
        EdgeCommand := "C:\Program Files (x86)\Microsoft\Edge\Application\msedge_proxy.exe"
        . " --profile-directory=Default"
        . " --app=https://translate-demo.plamo.preferredai.jp/"
        . " --app-launch-source=4"
        Run, %EdgeCommand%
        Sleep, 2000
    }
    Send ^a
    Sleep, 100
    Send ^v
    Sleep, 500
    Send {Enter}
}
return
