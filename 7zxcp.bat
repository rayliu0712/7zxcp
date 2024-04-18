:: ANSI
:: 2024/04/18 Thu
:: Ray Liu
:: https://github.com/rayliu0712/7zxcp

@echo off
setlocal enabledelayedexpansion

set file=%1
set pre=%file:~0,1%
if not ^%pre%==^" (
    set file="%file%"
)

set /a i=1
set dir=foo


:loop


set c=!file:~%i%,1!
if ^%c%==^" (
    goto break
) else if ^%c%==. (
    set dir=!file:~0,%i%!
)
set /a i+=1
goto loop


:break


set dir=%dir%"
echo.
echo [ https://learn.microsoft.com/zh-tw/windows/win32/intl/code-page-identifiers ]
echo.
echo [ 英文 ] 437 & echo.
echo [ 日文 ] 932 & echo.
echo [ 簡中 ] 936 & echo.
echo [ 韓文 ] 949 & echo.
echo [ 繁中 ] 950 & echo.
echo [ UTF8 ] 65001 & echo.
set /p "cp=Code Page > "

:: 自訂7z路徑，建議用絕對路徑，必要時加雙引號
"C:\Program Files\7-Zip\7z.exe" x %file% -o%dir% -mcp=%cp%

:: 如果不在乎解壓縮結果可以拿掉pause
pause