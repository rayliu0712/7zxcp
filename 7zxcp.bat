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
echo [ �^�� ] 437 & echo.
echo [ ��� ] 932 & echo.
echo [ ²�� ] 936 & echo.
echo [ ���� ] 949 & echo.
echo [ �c�� ] 950 & echo.
echo [ UTF8 ] 65001 & echo.
set /p "cp=Code Page > "

:: �ۭq7z���|�A��ĳ�ε�����|�A���n�ɥ[���޸�
"C:\Program Files\7-Zip\7z.exe" x %file% -o%dir% -mcp=%cp%

:: �p�G���b�G�����Y���G�i�H����pause
pause