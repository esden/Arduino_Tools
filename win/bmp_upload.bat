@echo off
rem: Note %~dp0 get path of this batch file
rem: Need to change drive if My Documents is on a drive other than C:
set driverLetter=%~dp0
set driverLetter=%driverLetter:~0,2%
%driverLetter%
cd %~dp0
rem: get all parameters that we will be using and make sure the slashes are all correct
set working_directory=%~p0
set toolchain_path=%~1
set toolchain_path=%toolchain_path:/=\%
set bmp_gdb_port=%2
set bmp_gdb_port=%bmp_gdb_port:/=\%
set elf_file=%3
set elf_file=%elf_file:/=\%
%toolchain_path%\arm-none-eabi-gdb.exe --batch -nx ^
	-ex "target extended-remote %bmp_gdb_port%" ^
	-x %working_directory%..\shared\bmp_gdb_upload_swd.scr ^
	%elf_file%
