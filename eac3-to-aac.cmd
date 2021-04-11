@echo off
setlocal EnableDelayedExpansion

set /p input="Enter video path (Shift + Right Click -> Copy as path): "

for %%i in (%input%) do (
    set fullPath=%%~di%%~pi%
    set file=%%~ni
    set ext=%%~xi
)

set output=%fullPath%%file%.aac%ext%
@REM ffmpeg -i %input% -map 0:s -c copy -vcodec copy -acodec aac -ab 320K %output%
@REM ffmpeg -i %input% -map 0:v -map 0:a -c aac -map 0:s -c copy %output%
ffmpeg -i %input% -map 0 -c copy -c:a aac -ab 320K %output%
echo Saved to %output%

pause