:top
@echo off
color B
echo Please enter your MySQL info
echo.
set /p host= MySQL Server Address (Default = localhost): 
if %host%. == . set host=localhost
set /p user= MySQL Username (Default = root): 
if %user%. == . set user=root
set /p pass= MySQL Password (Default = ascent): 
if %pass%. == . set pass=ascent
set /p trinitydb= Trinity World Database (Default = world): 
if %trinitydb%. == . set trinitydb=world
set port=3306
set mysqlpath=.\data\mysql\

:begin
CLS
echo.
echo          /\
echo         /  \
echo        /    \
echo       /______\
echo      /\      /\  Triforce Mall - Version 3.5 (Trinity)
echo     /  \    /  \  Updated by Furball of AC-Web.org
echo    /    \  /    \	    originally by Khaled
echo   /______\/______\
echo.
echo 	I - Import Mall Vendors/Trainers
echo 	S - Spawn GM Island Mall
echo 	D - Despawn All Mall Vendors/Trainers
echo 	R - Remove Triforce Mall
echo 	X - Exit
echo.
set /p f= Select an option: 
if %f%==* goto error
if %f%==i goto import
if %f%==I goto import
if %f%==s goto spawn
if %f%==S goto spawn
if %f%==d goto despawn
if %f%==D goto despawn
if %f%==r goto remove
if %f%==R goto remove
if %f%==x goto exit
if %f%==X goto exit
set f=
goto error

:import
CLS
echo.
echo          /\
echo         /  \
echo        /    \
echo       /______\
echo      /\      /\  Triforce Mall - Version 3.5 (Trinity)
echo     /  \    /  \  Updated by Furball of AC-Web.org
echo    /    \  /    \	    originally by Khaled
echo   /______\/______\  [ Importing NPCs.. ]
echo.
echo.
for %%C in (.\data\TriForceMall_conditions.sql) do (
echo Processing: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %trinitydb% < "%%~fC"
)
echo.
for %%C in (.\data\TriForceMall_creaturedefaulttrainer.sql) do (
echo Processing: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %trinitydb% < "%%~fC"
)
echo.
for %%C in (.\data\TriForceMall_gossipmenu.sql) do (
echo Processing: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %trinitydb% < "%%~fC"
)
echo.
for %%C in (.\data\TriForceMall_gossipmenuoptions.sql) do (
echo Processing: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %trinitydb% < "%%~fC"
)
echo.
for %%C in (.\data\TriForceMall_npctext.sql) do (
echo Processing: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %trinitydb% < "%%~fC"
)
echo.
for %%C in (.\data\TriForceMall_npcvendor.sql) do (
echo Processing: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %trinitydb% < "%%~fC"
)
echo.
for %%C in (.\data\TriForceMall_template.sql) do (
echo Processing: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %trinitydb% < "%%~fC"
)
echo.
for %%C in (.\data\TriForceMall_trainer.sql) do (
echo Processing: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %trinitydb% < "%%~fC"
)
echo.
for %%C in (.\data\TriForceMall_TrainerSpell.sql) do (
echo Processing: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %trinitydb% < "%%~fC"
)
echo.
set /p p= Press any key to continue.
set f=e
goto begin

:spawn
CLS
echo.
echo          /\
echo         /  \
echo        /    \
echo       /______\
echo      /\      /\  Triforce Mall - Version 3.5 (Trinity)
echo     /  \    /  \  Updated by Furball of AC-Web.org
echo    /    \  /    \	    originally by Khaled
echo   /______\/______\   [ Spawning NPCs.. ]
echo.
echo.
for %%C in (.\data\spawn_gmisland_trinity.sql) do (
echo Processing: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %trinitydb% < "%%~fC"
)
echo.
set /p p= Press any key to continue.
set f=e
goto begin

:despawn
CLS
echo.
echo          /\
echo         /  \
echo        /    \
echo       /______\
echo      /\      /\  Triforce Mall - Version 3.5 (Trinity)
echo     /  \    /  \  Updated by Furball of AC-Web.org
echo    /    \  /    \	    originally by Khaled
echo   /______\/______\   [ Despawning NPCs.. ]
echo.
echo.
for %%C in (.\data\despawn_trinity.sql) do (
echo Processing: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %trinitydb% < "%%~fC"
)
echo.
set /p p= Press any key to continue.
set f=e
goto begin

:remove
CLS
echo.
echo          /\
echo         /  \
echo        /    \
echo       /______\
echo      /\      /\  Triforce Mall - Version 3.5 (Trinity)
echo     /  \    /  \  Updated by Furball of AC-Web.org
echo    /    \  /    \	    originally by Khaled
echo   /______\/______\   [ Removing Triforce Mall.. ]
echo.
echo.
for %%C in (.\data\removeall_trinity.sql) do (
echo Processing: %%~nxC
%mysqlpath%\mysql --host=%host% --user=%user% --password=%pass% --port=%port% %trinitydb% < "%%~fC"
)
echo.
set /p p= Press any key to continue.
set f=e
goto begin

:error
CLS
echo.
echo Please enter a valid choice.
echo.
set /p p= Press any key to continue.
goto begin

:exit