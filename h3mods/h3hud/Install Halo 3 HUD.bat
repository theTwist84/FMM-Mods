FOR %%f IN (tags\*.*) DO (echo import %%~nf %%f >> "installScript2.cmds")
FOR /d %%d IN (bitmaps\importbitmap\*.*) DO (FOR %%f IN (bitmaps\importbitmap\%%~nd\*.dds) DO (echo EditTag %%~nf >> "installScript1.cmds" && echo ImportBitmap %%~nd "%%f" >> "installScript1.cmds" && echo Exit >> "installScript1.cmds" ))
FOR /d %%d IN (bitmaps\import\*.*) DO (FOR %%f IN (bitmaps\import\%%~nd\*.dds) DO (echo edit %%~nf >> "installScript2.cmds" && echo import %%~nd "%%f" >> "installScript2.cmds" && echo exit >> "installScript2.cmds" ))
FOR %%f IN (scripts\*.cmds) DO (Type %%f >> "installScript1.cmds")
Type "installScript2.cmds" | "h3h_TagTool_Old.exe" "..\..\..\..\maps/tags.dat"
Type "installScript1.cmds" | "h3h_TagTool.exe" "..\..\..\..\maps/tags.dat"
del "installScript1.cmds"
del "installScript2.cmds"
FOR %%f IN (fonts\*.bin) DO copy %%f ..\..\..\..\maps\fonts
if exist "..\..\..\..\mtndew.dll" ( if not exist "..\..\..\..\Halo 3 HUD Backup\" ( mkdir "..\..\..\..\Halo 3 HUD Backup\")
move "..\..\..\..\mtndew.dll" "..\..\..\..\Halo 3 HUD Backup\%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2% backup.dll" )
copy "bin\mtndew.dll" "..\..\..\..\mtndew.dll"
pause