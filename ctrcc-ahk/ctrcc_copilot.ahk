#Persistent
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

~^c::
if (A_PriorHotkey = "~^c" and A_TimeSincePriorHotkey < 400)
{
    Send, #c
    ; wait for the app
    Sleep, 900
    ; original copied text save to temp
    OriginalClipboard := Clipboard
    ; add prompt to translate
    Clipboard := "以下の文が日本語の場合は英語に、英語の場合は日本語に翻訳してください。翻訳のみを返してください。余計な説明や注釈は不要です：" . OriginalClipboard
    ; wait for reflecting clipboard
    ClipWait, 10
    Send ^v
    Sleep, 80
    Send {Enter}
    ; restore original copied text
    Sleep, 100
    Clipboard := OriginalClipboard
}
return
