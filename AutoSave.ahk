#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#Persistent ; 让脚本持续运行, 直到用户退出.
SetTitleMatchMode RegEx

Menu, tray, add
Menu, tray, add, 感应存, InducingSaveReset
Menu, tray, add, 暴力存, ForceSaveReset

Return

InducingSaveReset:
InputBox, WTitle, 你要存的窗口标题
if ErrorLevel
{
    MsgBox, 搞乜啊
    Return
}else
{
    MsgBox, 吼哇 每当您换到标题有 "%WTitle%" 的窗口 咱家就给您自个儿保存了
    Gosub, InducingSave
}

InducingSave:
WinWaitActive, % WTitle
Send, ^s
WinWaitNotActive, % WTitle
Gosub, InducingSave

ForceSaveReset:
InputBox, T, 设定每隔多久( 0 ~ 2147483647 毫秒)
if ErrorLevel
{
    MsgBox, 搞乜啊
    Return
}else if T is not integer
{
    MsgBox, 必须输入整数
    Return
}Else
{
    MsgBox, 吼哇 每过 "%T%" 秒 咱家就给您自个儿保存了
    Gosub, ForceSave
}

ForceSave:
Sleep, % T
Send, ^s
Gosub, ForceSave

    ; 感应存调试片段
    ; IfWinExist, % WTitle
    ; {
    ;     WinGetTitle, WindowsTitle, %WTitle%
    ;     MsgBox % " Window " . WindowsTitle . "Detected"
    ; }