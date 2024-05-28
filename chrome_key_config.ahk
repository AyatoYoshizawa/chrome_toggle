#1:: ; Win + 1 キーの組み合わせでトリガー
SetTitleMatchMode, 2 ; 部分一致モードを使用
WinGet, chromeWindows, List, - Google Chrome ; タイトルに "- Google Chrome" を含むウィンドウのリストを取得

; 現在のアクティブウィンドウのタイトルを取得
WinGetActiveTitle, activeWindowTitle

; アクティブウィンドウがChromeでない場合
if (InStr(activeWindowTitle, "- Google Chrome") = 0)
{
    ; Chromeウィンドウが1つ以上ある場合
    if (chromeWindows >= 1)
    {
        WinActivate, ahk_id %chromeWindows1% ; 最初のChromeウィンドウをアクティブにする
    }
    else
    {
        Run, chrome.exe ; 新しいChromeウィンドウを起動する
    }
}
else
{
    if (chromeWindows > 1) ; ウィンドウが2つ以上ある場合
    {
        WinActivate, ahk_id %chromeWindows2% ; 2番目のウィンドウをアクティブにする
    }
    else if (chromeWindows = 1) ; ウィンドウが1つだけの場合
    {
        WinActivate, ahk_id %chromeWindows1% ; 既存のウィンドウをアクティブにする
    }
    else
    {
        Run, chrome.exe ; 新しいChromeウィンドウを起動する
    }
}
return
