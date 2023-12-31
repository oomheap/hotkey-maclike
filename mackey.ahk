﻿
;; 最小化
!h::WinMinimize "A"
!m::WinMinimize "A"

;; 最大化
^!f::WinMaximize "A"

;;^!q::<#l


;; 行首/行末 Command(Alt)+Left/Right -> Home/End
<!Right::End
<!Left::Home


;; 行首/行末 Command(Alt)+Left/Right -> Home/End
<!Down::
{
    if WinActive("ahk_exe idea64.exe")
        send "!{Down}"
    else
        send "^{End}"
    return
}
<!Up::
{
    if WinActive("ahk_exe idea64.exe")
        send "!{Up}"
    else
        send "^{Home}"
    return
}



;; 退出 Command(Alt)+Q -> Alt+F4
<!q::<!F4


;; Command(Alt)+Z/X/C/V/A/F -> Ctrl+Z/X/C/V/A/F
<!z::^z ;; 撤销
<!x::^x ;; 剪切
<!c::^c ;; 复制
<!v::^v ;; 粘贴
<!a::^a ;; 全选
<!s::^s ;; 保存


;; 查找
<!f::
{
    if WinActive("ahk_exe wps.exe") or WinActive("ahk_exe dbeaver.exe") or WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe brave.exe") or WinActive("ahk_exe explorer.exe") or WinActive("ahk_exe ApiPost7.exe") or WinActive("ahk_exe Postman.exe") or WinActive("ahk_exe Code.exe") or WinActive("ahk_exe Notepad.exe")
      send "^f"
    else
      send "!f"
    return
}

;; 关闭窗口（Tab）（Edge，文件管理器，Visual Studio Code）
<!w::
{
    if WinActive("ahk_exe wps.exe") or WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe brave.exe") or WinActive("ahk_exe explorer.exe") or WinActive("ahk_exe Code.exe") or WinActive("ahk_exe Notepad.exe")
        send "^w"
    else if WinActive("ahk_exe DingTalk.exe")
        WinMinimize ;; 使用WinActive找到的窗口
    else if WinActive("ahk_exe WeChat.exe")
        send "{Esc}" ;; 使用WinActive找到的窗口
    else
        send "!w"
    return
}

;; 刷新
<!r::
{
    if WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe brave.exe") or WinActive("ahk_exe explorer.exe")
        send "^r"
    else if WinActive("ahk_exe DingTalk.exe")
        WinMinimize ;; 使用WinActive找到的窗口
    else
        send "!r"
    return
}

;; draw.io 加粗，WPS加粗
<!b::
{
    if WinActive("ahk_exe draw.io.exe") or WinActive("ahk_exe wps.exe")
        send "^b"
    else
        send "!b"
    return
}


;;;;;;;;;;;;;; Termius
;; 复制
<!c::
{
    if WinActive("ahk_exe Termius.exe") ;; Termius复制
        send "^{Insert}"
    else
        send "^c"
    return
}
;; 清屏
<!k::
{
    if WinActive("ahk_exe Termius.exe") ;; Termius清屏
        send "^l"
    else
        send "!k"
    return
}
;; Up
;;<!u::
;;{
;;    if WinActive("ahk_exe Termius.exe") ;; Up
;;        send "{Up}"
;;    else
;;        send "!u"
;;    return
;;}
;;;; Down
;;<!d::
;;{
;;    if WinActive("ahk_exe Termius.exe") ;; Down
;;        send "{Down}"
;;    else
;;        send "!d"
;;    return
;;}
;;;;;;;;;;;;;; Termius

;; 粘贴【draw.io，Termius】
<!v::
{
    if WinActive("ahk_exe draw.io.exe") ;; draw.io 无格式粘贴
        send "^+v"
    else if WinActive("ahk_exe Termius.exe") or WinActive("ahk_exe Tabby.exe") ;; Termius，Tabby 粘贴
        send "+{Insert}"
    else
        send "^v"
    return
}

;; WPS只粘贴文本
<!+v::
{
    if WinActive("ahk_exe wps.exe") ;; WPS只粘贴文本
        send "!^t"
    else
        send "!+v"
    return
}


;;;;;;;;;;;;;;;;;;;;;;;;; draw.io
;; 格式【draw.io】
<!+p::
{
    if WinActive("ahk_exe draw.io.exe") ;; draw.io 格式
        send "^+p"
    else
        send "!+p"
    return
}
<!+k::
{
    if WinActive("ahk_exe draw.io.exe") ;; draw.io 格式
        send "^+k"
    else
        send "!+k"
    return
}
;;;;;;;;;;;;;;;;;;;;;;;;; draw.io


;; 新建标签【Edge，文件资源管理器】
<!t::
{
    if WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe brave.exe") or WinActive("ahk_exe explorer.exe")
        send "^t"
    else
        send "!t"
    return
}

;; 光标定位地址栏【Edge，文件资源管理器】
<!l::
{
    if WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe brave.exe") or WinActive("ahk_exe explorer.exe")
        send "^l"
    else
        send "!l"
    return
}

; Alt + F1 激活 Termius
<!F1::
{
    if ( WinExist("ahk_exe Termius.exe") and WinActive("ahk_exe Termius.exe") ) {
      WinMinimize ; Use the window found by WinWait.
    }
    else if WinExist("ahk_exe Termius.exe") {
      WinActivate ; Use the window found by WinExist.
    }
    
    if not WinExist("ahk_exe Termius.exe")
        run "C:\Users\kratzer\AppData\Local\Programs\Termius\Termius.exe"
    
    return
}

; Alt + F4 激活 Intellij IDEA
<!F4::
{
    if ( WinExist("ahk_exe idea64.exe") and WinActive("ahk_exe idea64.exe") ) {
      WinMinimize ; Use the window found by WinWait.
    }
    else if WinExist("ahk_exe idea64.exe") {
      WinActivate ; Use the window found by WinExist.
    }
    
    return
}

; Win + B 激活 Brave
<#b::
{
    if ( WinExist("ahk_exe brave.exe") and WinActive("ahk_exe brave.exe") ) {
      WinMinimize ; Use the window found by WinWait.
    }
    else if WinExist("ahk_exe brave.exe") {
      WinActivate ; Use the window found by WinExist.
    }
    if not WinExist("ahk_exe brave.exe")
        run "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
    
    return
}
; Alt + F3 激活 Microsoft Edge
<!F3::
{
    if ( WinExist("ahk_exe msedge.exe") and WinActive("ahk_exe msedge.exe") ) {
      WinMinimize ; Use the window found by WinWait.
    }
    else if WinExist("ahk_exe msedge.exe") {
      WinActivate ; Use the window found by WinExist.
    }
    if not WinExist("ahk_exe msedge.exe")
        run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
    
    return
}

; Win + T 激活 Tabby
<#t::
{
    if ( WinExist("ahk_exe Tabby.exe") and WinActive("ahk_exe Tabby.exe") ) {
      WinMinimize ; Use the window found by WinWait.
    }
    else if WinExist("ahk_exe Tabby.exe") {
      WinActivate ; Use the window found by WinExist.
    }
    if not WinExist("ahk_exe Tabby.exe")
        run "C:\Users\kratzer\AppData\Local\Programs\Tabby\Tabby.exe"
    
    return
}

