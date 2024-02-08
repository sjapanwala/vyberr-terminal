 @echo off
chcp 65001 >nul
set mode=90,55
mode %mode%
set securitymode=false
set delsensfiles=true
set lockpass=root
set launchtime=3
set terminalname=terminal2.bat
set connectionstatus=Encrypted
if %connectionstatus%==Encrypted set connectioncolor=[40;32m 
if %connectionstatus%==Decrypted set connectioncolor=[40;31m
set customtitle=Vyber Terminal / %date%


::title
:loading   
mode 29,10                                                                                                                                                
echo  __                __
echo  \ \  ____  __  __/ /
echo   \ \/ __ \/ / / / / 
echo   / / / / / /_/ / /  
echo  / /_/ /_/\__,_/_/ 
echo /_/ ᵉⁿᵍᶦⁿᵉ 
echo.
echo Loading Resources...
timeout %launchtime% >nul
::if all resources load, then cont' if resources fail, goto to error page.
goto main
:: paramter checks
:main
::theme
set theme=[40;32m
if exist red.bat set theme=[40;31m
if exist yellow.bat set theme=[40;33m
if exist green.bat set theme=[40;32m
if exist blue.bat set theme=[40;34m
if exist purple.bat set theme=[40;35m
if exist cyan.bat set theme=[40;36m
if exist white.bat set theme=[40;37m
::
if exist securemode.mode set securitymode=true
if not exist securemode.mode set securitymode=false
set mode=90,55
mode %mode%
cls
echo %theme%                                          __                  
echo %theme%                             _   ____  __/ /_  ___  __________
echo %theme%                            │ │ / / / / / __ \/ _ \/ ___/ ___/
echo %theme%                            │ │/ / /_/ / /_/ /  __/ /  / /    
echo %theme%                            │___/\__, /_.___/\___/_/  /_/ [40;37m©2022   
echo %theme%                                /____/     
echo.
if %securitymode%==true echo [40;31m                                    Security Mode Enabled
echo.
echo [40;33m                                         %time%
echo.
if %securitymode%==false echo [40;35m                                    Command Prefix '!'
if %securitymode%==false echo [40;35m                            For A List Of Commands, Type '!help'.    
echo.
:commandline
if %securitymode%==true goto securityline && set mode=90,10
title %customtitle%
echo.
echo [40;37m╔═(%connectioncolor%%connectionstatus%[40;37m)
set command=
set /p command=[40;37m╚═( [40;35m%username%@%theme%vyberr.cmd[40;37m:!$:
if %command%==!help goto help
if %command%==!cls goto main
if %command%==!clear goto main
if %command%==!search goto search
if %command%==!searchurl goto searchurl
if %command%==!youtube goto youtube
if %command%==!watch goto youtube
if %command%==!amazon goto amazon
if %command%==!buy goto amazon
if %command%==!start goto start
if %command%==!changetitle goto changetitle
if %command%==!writefile goto writefile
if %command%==!securemode goto securemode
if %command%==!makefile goto makefile
if %command%==!lock start Rundll32.exe user32.dll,LockWorkStation && echo Your Device Was Locked At [%time%] && goto commandline
if %command%==!done exit
if %command%==!del goto delete
if %command%==!installapps goto startinstall
if %command%==!files goto files
if %command%==!refresh goto refresh
if %command%==!rain start rainit.bat && goto commandline
if %command%==!disconnect goto disconnet
if %command%==!reconnect goto reconnect
if %command%==!theme goto theme
goto error

:error
echo [40;31mCommand Is Invalid.
goto commandline
:help
echo.
echo Welcome To Help.
echo.
echo 01) !help             Brings You To This Command, isnt it self explanitory?...
echo 02) !cls/!clear       Clears Command Prompt
echo 03) !search           Searches The Web (Engine: Google )
echo 04) !searchurl        Searches in URL Format (www.google.com)
echo 05) !youtube/!watch   Searches Youtube
echo 06) !amazon/!buy      Searches Amazon 
echo 07) !start            Starts Entered File Name or CMD
echo 08) !changetitle      Change The Title Of The Window
echo 09) !writefile        Write A .txt File (create one, or auto create)
echo 10) !securemode       Locked Mode
echo 11) !makefile         Make Any File
echo 12) !del              Delete A File
echo 13) !installapps      Installs Applications From The Web (similar: sudo app)
echo 14) !refresh          Refresh Terminal (all data will be lost)
echo 15) !rain             Launch 'Rain.IT®'
echo 16) !disconnect       Disconnects You From A Secure Server
echo 17) !reconnect        Reconnects You To A Secure Server
echo 18) !theme            Change Theme Color


goto commandline

:search
echo Substitue Spaces for '+'
set search=
set /p search=[[40;34mG[40;31mo[40;33mo[40;34mg[40;32ml[40;31me[40;37m]Enter Search Keyword:[40;33m
if %search%==halt goto commandline
if %search%==home start www.google.com && goto commandline
goto searchg
:searchg
start https://www.google.com/search?q=%search% 
echo [%search%] Searched With [Google]>> searchhistory.txt
goto commandline

:searchurl
set searchurl=
set /p searchurl=[[40;34mG[40;31mo[40;33mo[40;34mg[40;32ml[40;31me[40;37m]Enter Search Keyword:[40;33m
if %searchurl%==halt goto commandline
goto searchu
:searchu
start https://%searchurl% 
echo [%searchurl%] Searched With [Google]>> searchhistory.txt
goto commandline

:searchedge
echo Substitue Spaces for '+'
set searchedge=
set /p searchedge=[[40;34mEdge[40;37m]Enter Search Keyword:[40;33m
if %searchedge%==home start www.bing.com && goto commandline
start https://www.bing.com/search?q=%searchedge%
echo [%searchedge%] Searched With [MicroSoft Edge]>> searchhistory.txt
goto commandline

:youtube
echo Substitue Spaces for '+'
set ytsearch=
set /p ytsearch=[40;37m[You[40;31mTube[40;37m]Search Youtube:[40;33m
if %ytsearch%==halt goto commandline
if %ytsearch%==home start www.youtube.com && goto commandline
start https://www.youtube.com/results?search_query=%ytsearch%
echo [%ytsearch%] Watched With [Youtube]>> watchhistory.txt
goto commandline

:amazon
echo Substitue Spaces for '+'
set amazon=
set /p amazon=[40;37m[[40;33mAmazon[40;37m]Search A Product Name:
if %amazon%==home start https://www.amazon.ca/ref=nav_logo && goto commandline
start https://www.amazon.ca/s?k=%amazon%
echo [%amazon%] Searches With [Amazon]>> searchhistory.txt
goto commandline
                    
:start
echo.
echo Leave Blank For 'CMD'
set start=
set /p start=Choose A File To Start!: 
start %start%
goto commandline

:changetitle
set customtitle=
set /p customtitle=Choose New Title!: 
goto commandline

:writefile
set filename=
set /p filename=Enter File To Write To:
echo.
set heading=
set /p heading=Enter Title: 
echo.
set content=
set /p content=Enter Content To Write: 
echo Heading: %heading%>> %filename%
echo Created: %date%>> %filename%
echo Author: %username%>> %filename%
echo ㅤ>> %filename%
echo Content: %content%>> %filename%
echo ㅤ>> %filename%
echo ㅤ>> %filename%
echo [40;32mSuccessfully Written in %filename%
goto commandline


:securemode
echo Please Set Your Unlock Key
set unlockkey=
set /p unlockkey=:
echo > %unlockkey%.reskey
goto countdown
:countdown
echo [40;31mSecure Mode In 3 Secs
timeout 1 >nul
echo [40;31mSecure Mode In 2 Secs
timeout 1 >nul
echo [40;31mSecure Mode In 1 Secs
timeout 1 >nul
goto lock

:lock
echo > securemode.mode && goto main

:securityline
echo [40;37m╔═(%connectioncolor%%connectionstatus%[40;37m)
set secunlock=
set /p secunlock=[40;37m╚═( [40;31mSecurity Mode Restricts Use, Enter Password To Unlock.[40;33m
if exist %secunlock%.reskey del securemode.mode && del goto main
goto restricted
:restricted
echo.
echo [40;31mThis Command is Restricted, Please Try Again
echo.
goto commandline

:makefile
set makefilename=
set /p makefilename=Enter The Name Of Your File:
set filextention=
set /p fileextention=Enter %makefilename%'s Extention: 
if exist %makefilename%.%fileextention% echo [40;31mFile Already Exists && goto commandline
echo >> %makefilename%.%fileextention%
timeout 2 >nul
echo [40;32m[%makefilename%.%fileextention%] Successfully Created
goto commandline

:delete 
set delfile=
set /p delfile=Enter The File To Delete: 
::if %delsensfiles%==false && if %delfile%==watchhistory.txt echo [40;31mFile Cannot Be Deleted (Restricted File Access) && goto commandline
::if %delsensfiles%==false && if %delfile%==searchhistory.txt echo [40;31mFile Cannot Be Deleted (Restricted File Access) && goto commandline
del %delfile%
if exist %delfile% echo [40;31mFile Could Not Be Deleted && goto commandline
echo [40;32m[%delfile%] Successfully Deleted
goto commandline

:startinstall
echo Apps Available To Install
echo 1) NetTool
echo 2) PingTool
echo 3) IP Tool
echo Custom Install
set install=
set /p install=:[40;37m
if %install%==1 goto nettool
if %install%==2 goto pingtool
if %install%==3 goto iptool
if %install%==custom goto custominstall
goto commandline


:custominstall
echo.
set packagelink=
set /p packagelink=[40;37mEnter The Download Package Link([40;31mSupported Download Links[40;37m)[40;37m:
start https://%packagelink%
echo.
echo [40;37mTo Install, Extract The Package File (.txt, .bat, .exe etc) To The Terminal Folder
echo To Start The Program, You Can Use "Start" Command.
echo Or Edit A Start Link in EDE, Or NotePad. ([40;31mNot Recomended[40;37m)
goto commandline

:: Token Tool (Discarded)

::tokentoolinstall
::if exist tokentool.bat echo [40;31mTokenTool Has Already Been Downloaded!
::goto commandline
::if not exist tokentool.bat goto tkdwnld
:::tkdwnld
::echo @echo off> tokentool.bat
::echo mode 40,20>> tokentool.bat
::echo title Token Tool [User: %username%]>> tokentool.bat
::echo :A>> tokentool.bat
::echo echo %random% %random% %random% %random%>> tokentool.bat
::echo goto A>> tokentool.bat
::echo echo Tokens Created!>> tokentool.bat
::echo pause>nul>> tokentool.bat
::echo [40;32mToken Tool Installed!
::goto commandline
:nettool
start https://github.com/vyberr/nettool/archive/refs/heads/main.zip
echo [40;37m--instructions--
echo extract the file into the same folder as the terminal
echo goto to terminal and start the application
echo using [nettool.bat] or [nettool]
goto commandline

:pingtool
start https://github.com/vyberr/pingtool/archive/refs/heads/main.zip
echo [40;37m--instructions--
echo extract the file into the same folder as the terminal
echo goto to terminal and start the application
echo using [start pingtool.bat] or [pingtool]
goto commandline

:iptool
start https://github.com/vyberr/iptool/archive/refs/heads/main.zip
echo [40;37m--instructions--
echo extract the file into the same folder as the terminal
echo goto to terminal and start the application
echo using "start iptool.bat" or "iptool"
goto commandline

:launchip
if exist iptool.bat goto ipcont
if not exist iptool.bat goto iperror
:iperror
echo [40;37mIPTool Has Not Been Installed
echo Use "install" command to download
goto commandline
:ipcont
start iptool.bat
goto commandline
:launchnet
if exist nettool.bat goto netcont
if not exist nettool.bat goto neterror
:neterror
echo [40;37mNetTool Has Not Been Installed
echo Use "install" command to download
goto commandline
:netcont
start nettool.bat
goto commandline
:launchping
if exist pingtool.bat goto pingcont
if not exist pingtool.bat goto pingerror
:pingerror
echo [40;37mPingTool Has Not Been Installed
echo Use "install" command to download
goto commandline
:pingcont
start pingtool.bat
goto commandline

:files
dir
goto commandline

:refresh
start %terminalname%

:reconnect
echo Please Relaunch/Refresh To Reconnect!
goto commandline
:disconnet
set discon=
set /p discon=Disconnect From Server [%servername%] (y/n)
if %discon%==y goto discon
if %discon%==Y goto discon
goto commandline

:discon
echo.
echo Disconnected From [%servername%]
set connectionstatus=Decrypted
goto commandline

:theme
if exist red.bat del red.bat && goto changetheme
if exist yellow.bat del yellow.bat && goto changetheme
if exist green.bat del green.bat && goto changetheme
if exist blue.bat del blue.bat && goto changetheme
if exist purple.bat del purple.bat && goto changetheme
if exist cyan.bat del cyan.bat && goto changetheme
if exist white.bat del white.bat && goto changetheme
:changetheme
echo Change Your Terminal Theme
echo.
echo [40;31m Red
echo [40;33m Yellow
echo [40;32m Green
echo [40;34m Blue
echo [40;35m Purple
echo [40;36m Cyan
echo [40;37m White
echo.
set themecolor=
set /p themecolor=Set Your Theme Color:
echo >%themecolor%.bat
goto main
