@echo off
setlocal EnableDelayedExpansion

set /p input="Enter video path (Shift + Right Click -> Copy as path): "

for %%i in (%input%) do (
    set fullPath=%%~di%%~pi%
    set file=%%~ni
    set ext=%%~xi
)

set output=%fullPath%%file%.ac3%ext%
ffmpeg -y -i %input% -map 0 -c:s copy -c:v copy -c:a ac3 -b:a 640k %output%
echo Saved to %output%

pause