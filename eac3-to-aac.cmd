@echo off
setlocal EnableDelayedExpansion

set /p input="Enter video path (Shift + Right Click -> Copy as path): "

for %%i in (%input%) do (
    set fullPath=%%~di%%~pi%
    set file=%%~ni
    set ext=%%~xi
)

set output=%fullPath%%file%.aac%ext%
ffmpeg -i %input% -vcodec copy -acodec aac -ab 320K -strict -2 %output%
echo Saved to %output%

pause