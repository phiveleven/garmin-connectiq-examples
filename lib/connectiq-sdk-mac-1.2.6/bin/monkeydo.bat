@echo off
"%~dp0shell.exe" --transport=tcp push "%~dpnxs1" "0:/GARMIN/APPS/%~nxs1"
set device_id=square_watch
IF NOT [%2]==[] set device_id=%2
"%~dp0shell.exe" --transport=tcp tvm "0:/GARMIN/APPS/%~nxs1" %device_id%
