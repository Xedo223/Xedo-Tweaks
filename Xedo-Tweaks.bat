@echo off
mode 120,30
set version=1.02
title Xedo Tweaks - %version%

:: Color Codes
set u=[0m
set underline=[04m
set bold=[1m
::
set y=[38;5;226m
set a=[38;5;51m
set w=[97m
set g=[90m
set p=[95m
set b=[96m
set o=[1m
set l=[38;5;154m
set gd=[38;5;220m
set r=[38;5;160m
set gn=[92m

:: Enabling ANSI Escape Sequences
reg add "HKCU\CONSOLE" /v "VirtualTerminalLevel" /t REG_DWORD /d 1 /f  > nul

chcp 65001 > nul

:menu_idioma
cls
    call :SetupConsole
    echo.
    echo.
    echo.
    echo.
    echo                     %gd%╔══════════════════════════════════════════════════════════════════════════════╗
    echo                     ║                       CHOOSE YOUR LANGUAGE / IDIOMA                          ║
    echo                     ╚══════════════════════════════════════════════════════════════════════════════╝%u%
    echo.
    echo                                                    %gd%[%w%1%gd%]%u% %gd%English%u%
    echo.
    echo                                                    %gd%[%w%2%gd%]%u% %gd%Português%u%
    echo.
    echo                     %gd%╚══════════════════════════════════════════════════════════════════════════════╝%u%
    echo.
    echo.
    echo.
set /p lang="%gd%Choose / Escolha (1-2) »%u% "

if "%lang%"=="1" (
    set "en="
    set "pt=@rem "
    goto script_principal
)
if "%lang%"=="2" (
    set "en=@rem "
    set "pt="
    goto script_principal
)

echo Opção inválida / Invalid option!
timeout /t 2 > nul
goto menu_idioma



:script_principal

cls 
chcp 437 >nul 2>&1 
for /f %%i in ('powershell -NoProfile -Command "(New-Object System.Security.Principal.NTAccount($env:USERNAME)).Translate([System.Security.Principal.SecurityIdentifier]).Value"') do set "USER_SID=%%i" >nul 2>&1

::Enabling Restore points 
powershell -NoProfile Enable-ComputerRestore -Drive 'C:\' >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "RPSessionInterval" /f  >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "DisableConfig" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d 0 /f >nul 2>&1
chcp 65001 >nul 2>&1

::Enabling Delayed Expansion
setlocal EnabledelayedExpansion > nul

cls 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo             %gd% ██╗  ██╗███████╗██████╗  █████╗        %w% ████████╗ ██╗       ██╗███████╗ █████╗ ██╗  ██╗ ██████╗™
echo             %gd% ╚██╗██╔╝██╔════╝██╔══██╗██╔══██╗       %w% ╚══██╔══╝ ██║  ██╗  ██║██╔════╝██╔══██╗██║ ██╔╝██╔════╝
echo             %gd%  ╚███╔╝ █████╗  ██║  ██║██║  ██║       %w%    ██║    ╚██╗████╗██╔╝█████╗  ███████║█████═╝ ╚█████╗
echo             %gd%  ██╔██╗ ██╔══╝  ██║  ██║██║  ██║       %w%    ██║     ████╔═████║ ██╔══╝  ██╔══██║██╔═██╗  ╚═══██╗
echo             %gd% ██╔╝╚██╗███████╗██████╔╝╚█████╔╝       %w%    ██║     ╚██╔╝ ╚██╔╝ ███████╗██║  ██║██║ ╚██╗██████╔╝
echo             %gd% ╚═╝  ╚═╝╚══════╝╚═════╝  ╚════╝        %w%    ╚═╝      ╚═╝   ╚═╝  ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ %u%
%pt%echo.                                                   %gd% *Edição %version%*           
%en%echo.                                                   %gd% *Edition %version%*           
echo.
echo.
%pt%echo.                                  %w% - Verificando privilégios administrativos... 🛡️  %u% 
%en%echo.                                  %w% - Checking for Administrative Privelages... 🛡️  %u% 
echo.                       
echo.
echo.
echo.     
echo.
timeout /t 3 /nobreak > NUL
rmdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
mkdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
if %errorlevel% neq 1 goto welcome  
) ELSE ( 
cls 
timeout /t 1 /nobreak > NUL
chcp 437 >nul 2>&1
powershell -NoProfile -NonInteractive -Command start -verb runas "'%~s0'" >nul 2>&1
chcp 65001 >nul 2>&1
:rmenu

cls
echo. 
echo. 
echo. 
echo.
echo             %r% ██╗  ██╗███████╗██████╗  █████╗        %w% ████████╗ ██╗       ██╗███████╗ █████╗ ██╗  ██╗ ██████╗™
echo             %r% ╚██╗██╔╝██╔════╝██╔══██╗██╔══██╗       %w% ╚══██╔══╝ ██║  ██╗  ██║██╔════╝██╔══██╗██║ ██╔╝██╔════╝
echo             %r%  ╚███╔╝ █████╗  ██║  ██║██║  ██║       %w%    ██║    ╚██╗████╗██╔╝█████╗  ███████║█████═╝ ╚█████╗
echo             %r%  ██╔██╗ ██╔══╝  ██║  ██║██║  ██║       %w%    ██║     ████╔═████║ ██╔══╝  ██╔══██║██╔═██╗  ╚═══██╗
echo             %r% ██╔╝╚██╗███████╗██████╔╝╚█████╔╝       %w%    ██║     ╚██╔╝ ╚██╔╝ ███████╗██║  ██║██║ ╚██╗██████╔╝
echo             %r% ╚═╝  ╚═╝╚══════╝╚═════╝  ╚════╝        %w%    ╚═╝      ╚═╝   ╚═╝  ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ %u%
echo.        %r%"═══════════════════════════════════════════════════════════════════════════════════════════════════════════"%u%
%pt%echo.                                            %W%   Xedo não está rodando como Admin!
%en%echo.                                             %W%   Xedo is not running as Admin!
echo.                                         
%pt%echo.          %W% Feche o utilitário e execute-o como administrador para que as otimizações possam ser aplicadas corretamente!
%en%echo.                 %W% Please close the utility and run it as administrator so the optimizations can apply properly!
echo.                                         
%pt%echo.                                             %W%  Se você quiser sair pressione X  
%en%echo.                                              %W%  If you want to Exit press X  
echo.        %r%"═══════════════════════════════════════════════════════════════════════════════════════════════════════════"%u%
echo.                 
%pt%echo.        %W% Se isso não funcionar, pressione %r%U%w% para desativar o UAC, então reinicie o pc e o utilitário deve funcionar
%en%echo.        %W% If that doesnt work, you can press %r%U%w% to disable UAC, after that restart your pc and utility should work
echo.                  
echo.        %r%"═══════════════════════════════════════════════════════════════════════════════════════════════════════════"%u%

set /p input=:
if /i %input% == X exit
if /i %input% == U exit
)
) ELSE (
echo Invalid Input & goto rmenu
%u%
:welcome
CLS
echo. 
echo. 
echo. 
echo.
echo.                             %w% ██╗       ██╗███████╗██╗      █████╗  █████╗ ███╗   ███╗███████╗ 
echo.                             %w% ██║  ██╗  ██║██╔════╝██║     ██╔══██╗██╔══██╗████╗ ████║██╔════╝ 
echo.                             %w% ╚██╗████╗██╔╝█████╗  ██║     ██║  ╚═╝██║  ██║██╔████╔██║█████╗   
echo.                             %w%  ████╔═████║ ██╔══╝  ██║     ██║  ██╗██║  ██║██║╚██╔╝██║██╔══╝   
echo.                             %w%  ╚██╔╝ ╚██╔╝ ███████╗███████╗╚█████╔╝╚█████╔╝██║ ╚═╝ ██║███████╗ 
echo.                             %w%   ╚═╝   ╚═╝  ╚══════╝╚══════╝ ╚════╝  ╚════╝ ╚═╝     ╚═╝╚══════╝ %u%
echo.        %gd%"═══════════════════════════════════════════════════════════════════════════════════════════════════════════"%u%
%pt%echo.%w%          Não nos responsabilizamos por quaisquer problemas que isso possa causar ao seu pc, se você encontrar algum,
%pt%echo.%w%                                  não tenha medo de entrar em contato em nosso servidor discord 
%en%echo.%w%                    We are not responsible for any problems this may cause to your pc, if you encounter any,
%en%echo.%w%                                      don't be afraid to reach out in our discord server 
echo.
%pt%echo.%w%          É proibido revender/reembalar qualquer uma de nossas ferramentas gratuitas, isso acarretará consequências
%en%echo.%w%                   It is prohibited to resell/repackage any of our free tools, it will lead to consequences
echo.        %gd%"═══════════════════════════════════════════════════════════════════════════════════════════════════════════"%u%
%pt%echo.%w%                           Pressione um NÚMERO no teclado seguido de ENTER para selecionar uma opção, 
%pt%echo.%w%                         Por favor, leia todos os avisos, não pressione botões cegamente sem ler.
%en%echo.%w%                           Press a NUMBER on your keyboard followed by ENTER to select an option, 
%en%echo.%w%                         Please Read All warnings, don't just blindly press buttons without reading.
echo.           
echo.        %gd%"═══════════════════════════════════════════════════════════════════════════════════════════════════════════"%u%
echo.                               
echo.
echo.                                 %gd%╔═════════════════════════════════════════════════════════╗
%pt%echo.                                 %gd%║     %w%   Pressione qualquer tecla para continuar... ➡️    %gd%║
%en%echo.                                 %gd%║       %w%   Press any key to continue... ➡️                %gd%║
echo.                                 %gd%╚═════════════════════════════════════════════════════════╝   

pause > nul
CLS



::for /f "tokens=2 delims==" %%b in ('wmic os get BuildNumber /value 2^>nul ^| findstr "="') do set "_OS_BUILD=%%b"
for /f "tokens=2*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuildNumber 2^>nul') do set "_OS_BUILD=%%b"
set /a _OS_BUILD_NUM=_OS_BUILD+0
if !_OS_BUILD_NUM! LSS 26100 (
    call :SetupConsole
    echo.
    echo.
    echo.
    echo.
    %pt%echo.                  %r%╔══════════════════════════════════════════════════════════════════════════════╗
    %pt%echo.                  ║                      SISTEMA OPERACIONAL NÃO SUPORTADO                       ║
    %pt%echo.                  ╚══════════════════════════════════════════════════════════════════════════════╝%u%
    %en%echo.                  %r%╔══════════════════════════════════════════════════════════════════════════════╗
    %en%echo.                  ║                        UNSUPPORTED OPERATING SYSTEM                          ║
    %en%echo.                  ╚══════════════════════════════════════════════════════════════════════════════╝%u%
    echo.
    %pt%echo %w%  Xedo Tweaks requer Windows 11 24h2 ou posterior.%u%
    %pt%echo.
    %pt%echo %r%  Windows 10 não é mais compatível.%u%
    %pt%echo %r%  Atualize para o Windows 11 24h2 antes de usar esta ferramenta.%u%
    %pt%echo.
    %pt%echo %gd%  Detectado build: !_OS_BUILD_NUM!   Requerido: 26100 ^(Windows 11 24h2^)%u%
    %pt%echo.
    %pt%echo %w%  Fechando em 10 segundos...%bu%
    %en%echo %w%  Xedo Tweaks requires Windows 11 24h2 or later.%u%
    %en%echo.
    %en%echo %r%  Windows 10 is no longer supported.%u%
    %en%echo %r%  Please upgrade to Windows 11 24h2 before using this tool.%u%
    %en%echo.
    %en%echo %gd%  Detected build: !_OS_BUILD_NUM!   Required: 26100 ^(Windows 11 24h2^)%u%
    %en%echo.
    %en%echo %g%  Exiting in 10 seconds...%bu%
    timeout /t 10 >nul /nobreak
    exit
)

:: Restore Point
:restorepoint
cls
echo.
echo.
echo.
echo.                                                  
echo.                %p%██████╗ ███████╗ ██████╗████████╗ █████╗ ██████╗ ███████╗  ██████╗  █████╗ ██╗███╗  ██╗████████╗        
echo.                %p%██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝  ██╔══██╗██╔══██╗██║████╗ ██║╚══██╔══╝        
echo.                %p%██████╔╝█████╗  ╚█████╗    ██║   ██║  ██║██████╔╝█████╗    ██████╔╝██║  ██║██║██╔██╗██║   ██║           
echo.                %p%██╔══██╗██╔══╝   ╚═══██╗   ██║   ██║  ██║██╔══██╗██╔══╝    ██╔═══╝ ██║  ██║██║██║╚████║   ██║           
echo.                %p%██║  ██║███████╗██████╔╝   ██║   ╚█████╔╝██║  ██║███████╗  ██║     ╚█████╔╝██║██║ ╚███║   ██║           
echo.                %p%╚═╝  ╚═╝╚══════╝╚═════╝    ╚═╝    ╚════╝ ╚═╝  ╚═╝╚══════╝  ╚═╝      ╚════╝ ╚═╝╚═╝  ╚══╝   ╚═╝ %u%        
echo.     %gd%"═══════════════════════════════════════════════════════════════════════════════════════════════════════════"%u%
%pt%echo.                                         %w% Você deseja criar um ponto de restauração?                                 
%en%echo.                                         %w% Do you want to Create a Restore Point?                                 
echo.
%pt%echo.            %gn%[1%gn%] Faça um ponto de restauração 🔄                          %r%[2%r%] Ignorar ponto de restauração ⏩
%en%echo.            %gd%[1%gd%] Make a restore point 🔄                                  %r%[2%r%] Skip restore point ⏩
echo.
echo.
%pt%echo.                                            %gd%[R%gd%]%w% Use o ponto de restauração 🔁
%en%echo.                                            %gd%[R%gd%]%w% Use a restore point 🔁
echo.
echo.     %gd%"════════════════════════════════════════════════════════════════════════════════════════════════════════════"%u%
%pt%echo.             %W% Permite que você reverta seu PC para as mesmas configurações de quando fez o ponto de restauração
%pt%echo.             %W% Você pode usar um ponto de restauração para reverter os ajustes feitos pelo utilitário, se desejar
%en%echo.                  %W% Allows you to revert your PC to the same settings as when you did the restore point         
%en%echo.                  %W% You can use a restore point to revert the tweaks made by the utility, if you wish so         
echo.     %gd%"════════════════════════════════════════════════════════════════════════════════════════════════════════════"%u%
echo. 
echo. 
echo. 
echo. 
echo. 
echo. 
echo. 
 
set /p input="%gd%Choose / Escolha »%u% "
if /i %input% == 1 goto createRP
if /i %input% == 2 goto resources
if /i %input% == R goto restore
if /i %input% == mgoto menu
) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu

:RedirectMenu
goto :restorepoint


:createRP
cls 
echo.
echo.
echo.
echo.                %w%██████╗ ███████╗ ██████╗████████╗ █████╗ ██████╗ ███████╗  ██████╗  █████╗ ██╗███╗  ██╗████████╗
echo.                %w%██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝  ██╔══██╗██╔══██╗██║████╗ ██║╚══██╔══╝
echo.                %w%██████╔╝█████╗  ╚█████╗    ██║   ██║  ██║██████╔╝█████╗    ██████╔╝██║  ██║██║██╔██╗██║   ██║   
echo.                %w%██╔══██╗██╔══╝   ╚═══██╗   ██║   ██║  ██║██╔══██╗██╔══╝    ██╔═══╝ ██║  ██║██║██║╚████║   ██║   
echo.                %w%██║  ██║███████╗██████╔╝   ██║   ╚█████╔╝██║  ██║███████╗  ██║     ╚█████╔╝██║██║ ╚███║   ██║   
echo.                %w%╚═╝  ╚═╝╚══════╝╚═════╝    ╚═╝    ╚════╝ ╚═╝  ╚═╝╚══════╝  ╚═╝      ╚════╝ ╚═╝╚═╝  ╚══╝   ╚═╝ %u%
echo.
%pt%echo. %w% Criando um ponto de restauração... %u%   
%en%echo. %w% Creating a restore point... %u%    
chcp 437 >nul 2>&1
powershell "Checkpoint-Computer -Description 'Xedo Tweaks'
%pt%powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Ponto de restauracao concluido com sucesso, pressione "OK" para continuar', 'Xedo Tweaks', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
%en%powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Restore point completed successfully, press "OK" to continue', 'Xedo Tweaks', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 2>&1 
cls
goto :resources

:resources
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.%p% ██████╗ █████╗  █████╗ ███╗  ██╗  ██████╗ ███████╗ ██████╗  █████╗ ██╗   ██╗██████╗  ██████╗███████╗ ██████╗
echo.%p%██╔════╝██╔══██╗██╔══██╗████╗ ██║  ██╔══██╗██╔════╝██╔════╝██╔═══██╗██║   ██║██╔══██╗██╔════╝██╔════╝██╔════╝
echo.%p%╚█████╗ ██║  ╚═╝███████║██╔██╗██║  ██████╔╝█████╗  ╚█████╗ ██║   ██║██║   ██║██████╔╝╚█████╗ █████╗  ╚█████╗
echo.%p% ╚═══██╗██║  ██╗██╔══██║██║╚████║  ██╔══██╗██╔══╝   ╚═══██╗██║   ██║██║   ██║██╔══██╗ ╚═══██╗██╔══╝   ╚═══██╗
echo.%p%██████╔╝╚█████╔╝██║  ██║██║ ╚███║  ██║  ██║███████╗██████╔╝╚█████ ╔╝╚██████╔╝██║  ██║██████╔╝███████╗██████╔╝
echo.%p%╚═════╝  ╚════╝ ╚═╝  ╚═╝╚═╝  ╚══╝  ╚═╝  ╚═╝╚══════╝╚═════╝   ╚════╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═════╝ %u%
echo.
%pt%echo. %w%- Procurando recursos e certificando-se de que estejam atualizados...%u% 
%en%echo. %w%- Looking for Resources and making sure they are up to date...%u% 
timeout /t 3 /nobreak > NUL


if not exist "C:\xedo\Free_Power_Plan_V8.pow" (
goto download
)
if not exist "C:\SetTimerResolution.exe" (
goto download
)
if not exist "C:\xedo\Free_NVPI_V10.nip" (
goto download
)
if not exist "C:\xedo\Nvidia_Porfile_Inspector_2.4.0.27.exe" (
goto download
)
if not exist "C:\xedo\backup" (
goto download
)

) ELSE (
goto menu

:Download
chcp 437 >nul 2>&1
%pt%powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Recursos nao encontrados ou desatualizados, pressione "OK" para baixa-los', 'Xedo Tweaks', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
%en%powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Resources Not found or out of date, Press "OK" To download them', 'Xedo Tweaks', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 2>&1
::Downloading power plan, nvidia profile inspector, NVPI config
::making exm folder
echo.
echo.
echo.
echo. %w%- Deleting old resource folder
md C:\xedo 
del /s /q C:\xedo
echo. %w%- Creating C:\xedo folder
md C:\xedo
md C:\xedo\backup
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.                             %p%██████╗ ███████╗ ██████╗ █████╗ ██╗   ██╗██████╗  █████╗ ███████╗ ██████╗
echo.                             %p%██╔══██╗██╔════╝██╔════╝██╔══██╗██║   ██║██╔══██╗██╔══██╗██╔════╝██╔════╝
echo.                             %p%██████╔╝█████╗  ╚█████╗ ██║  ██║██║   ██║██████╔╝██║  ╚═╝█████╗  ╚█████╗ 
echo.                             %p%██╔══██╗██╔══╝   ╚═══██╗██║  ██║██║   ██║██╔══██╗██║  ██╗██╔══╝   ╚═══██╗
echo.                             %p%██║  ██║███████╗██████╔╝╚█████╔╝╚██████╔╝██║  ██║╚█████╔╝███████╗██████╔╝
echo.                             %p%╚═╝  ╚═╝╚══════╝╚═════╝  ╚════╝  ╚═════╝ ╚═╝  ╚═╝ ╚════╝ ╚══════╝╚═════╝ %u%
echo.
chcp 65001 >nul 2>&1
%pt%echo. %w%- Baixando o plano de energia gratuito EXM... %g%(Parte dos recursos utilizados pela ferramenta. %u%
%pt%echo. %g%Você pode encontrá-los na pasta C:\xedo, todos eles são arquivos confiáveis ​​usados ​​por milhares de pessoas) %u%
%en%echo. %w%- Downloading the EXM Free Power Plan... %g%(Part of the Resources Used by the tool. %u%
%en%echo. %g%You can find them in the C:\xedo folder, they are all trusted files used by thousands of people) %u%
echo.
echo [======                       20.5%                         ]
echo.
chcp 437 >nul 2>&1
curl -g -k -L -# -o "C:\xedo\Free_Power_Plan_V8.pow" "https://raw.githubusercontent.com/Xedo223/Xedo-Tweaks/refs/heads/main/xedo/Free_Power_Plan_V8.pow" >nul 2>&1
:: Power plan made by exmtweaks
chcp 65001 >nul 2>&1
timeout /t 3 /nobreak > NUL
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.                             %p%██████╗ ███████╗ ██████╗ █████╗ ██╗   ██╗██████╗  █████╗ ███████╗ ██████╗
echo.                             %p%██╔══██╗██╔════╝██╔════╝██╔══██╗██║   ██║██╔══██╗██╔══██╗██╔════╝██╔════╝
echo.                             %p%██████╔╝█████╗  ╚█████╗ ██║  ██║██║   ██║██████╔╝██║  ╚═╝█████╗  ╚█████╗ 
echo.                             %p%██╔══██╗██╔══╝   ╚═══██╗██║  ██║██║   ██║██╔══██╗██║  ██╗██╔══╝   ╚═══██╗
echo.                             %p%██║  ██║███████╗██████╔╝╚█████╔╝╚██████╔╝██║  ██║╚█████╔╝███████╗██████╔╝
echo.                             %p%╚═╝  ╚═╝╚══════╝╚═════╝  ╚════╝  ╚═════╝ ╚═╝  ╚═╝ ╚════╝ ╚══════╝╚═════╝ %u%
echo.
chcp 65001 >nul 2>&1
%pt%echo. %w%- Baixando o Nvidia Profile Inspector... %g%(Parte dos recursos utilizados pela ferramenta. Você pode ver na
%pt%echo. %g%- pasta C:\xedo, todos eles são arquivos confiáveis ​​usados ​​por milhares de pessoas) %u% 
%en%echo. %w%- Downloading Nvidia Profile Inspector... %g%(Part of the Resources Used by the tool. You can find them in the
%en%echo. %g%- C:\xedo folder, they are all trusted files used by thousands of people) %u% 
echo.
echo [=============================55.0%                         ]
echo.
chcp 437 >nul 2>&1
curl -g -k -L -# -o "C:\xedo\Nvidia_Porfile_Inspector_2.4.0.27.exe" "https://raw.githubusercontent.com/Xedo223/Xedo-Tweaks/refs/heads/main/xedo/Nvidia_Porfile_Inspector_2.4.0.27.exe" >nul 2>&1
:: credit to Orbmu2k :: https://github.com/Orbmu2k/nvidiaProfileInspector/releases
chcp 65001 >nul 2>&1
timeout /t 3 /nobreak > NUL
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.                             %p%██████╗ ███████╗ ██████╗ █████╗ ██╗   ██╗██████╗  █████╗ ███████╗ ██████╗
echo.                             %p%██╔══██╗██╔════╝██╔════╝██╔══██╗██║   ██║██╔══██╗██╔══██╗██╔════╝██╔════╝
echo.                             %p%██████╔╝█████╗  ╚█████╗ ██║  ██║██║   ██║██████╔╝██║  ╚═╝█████╗  ╚█████╗ 
echo.                             %p%██╔══██╗██╔══╝   ╚═══██╗██║  ██║██║   ██║██╔══██╗██║  ██╗██╔══╝   ╚═══██╗
echo.                             %p%██║  ██║███████╗██████╔╝╚█████╔╝╚██████╔╝██║  ██║╚█████╔╝███████╗██████╔╝
echo.                             %p%╚═╝  ╚═╝╚══════╝╚═════╝  ╚════╝  ╚═════╝ ╚═╝  ╚═╝ ╚════╝ ╚══════╝╚═════╝ %u%
echo.
chcp 65001 >nul 2>&1
%pt%echo. %w%- Baixando Nvidia Profile Inspector Config... %g%(Parte dos recursos utilizados pela ferramenta. Você pode ver na
%pt%echo. %g%- pasta C:\xedo, todos eles são arquivos confiáveis ​​usados ​​por milhares de pessoas)%u%
%en%echo. %w%- Downloading Nvidia Profile Inspector Config... %g%(Part of the Resources Used by the tool. You can find them
%en%echo. %g%- in the C:\xedo folder, they are all trusted files used by thousands of people)%u%
echo.
echo. [=============================99.9%=======================]
echo.
chcp 437 >nul 2>&1
curl -g -k -L -# -o "C:\xedo\Free_NVPI_V10.nip" "https://raw.githubusercontent.com/Xedo223/Xedo-Tweaks/refs/heads/main/xedo/Free_NVPI_V10.nip" >nul 2>&1  
chcp 65001 >nul 2>&1
timeout 2 > nul
chcp 437 >nul 2>&1
curl -g -k -L -# -o "C:\SetTimerResolution.exe" "https://raw.githubusercontent.com/Xedo223/Xedo-Tweaks/refs/heads/main/xedo/SetTimerResolution.exe" >nul 2>&1  
chcp 65001 >nul 2>&1
timeout /t 3 /nobreak > NUL
cls
chcp 437 >nul 2>&1
%pt%powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Recursos baixados com sucesso, pressione "OK" para continuar no menu', 'Xedo Tweaks', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
%en%powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Downloaded resources successfully, Press "OK" To continue to the menu', 'Xedo Tweaks', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 2>&1
cls
goto menu


:restore
cls 
echo.
echo.
echo.
echo.                %w%██████╗ ███████╗ ██████╗████████╗ █████╗ ██████╗ ███████╗  ██████╗  █████╗ ██╗███╗  ██╗████████╗
echo.                %w%██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝  ██╔══██╗██╔══██╗██║████╗ ██║╚══██╔══╝
echo.                %w%██████╔╝█████╗  ╚█████╗    ██║   ██║  ██║██████╔╝█████╗    ██████╔╝██║  ██║██║██╔██╗██║   ██║   
echo.                %w%██╔══██╗██╔══╝   ╚═══██╗   ██║   ██║  ██║██╔══██╗██╔══╝    ██╔═══╝ ██║  ██║██║██║╚████║   ██║   
echo.                %w%██║  ██║███████╗██████╔╝   ██║   ╚█████╔╝██║  ██║███████╗  ██║     ╚█████╔╝██║██║ ╚███║   ██║   
echo.                %w%╚═╝  ╚═╝╚══════╝╚═════╝    ╚═╝    ╚════╝ ╚═╝  ╚═╝╚══════╝  ╚═╝      ╚════╝ ╚═╝╚═╝  ╚══╝   ╚═╝ %u%
echo.
rstrui.exe
echo.
echo.
echo.
chcp 65001 >nul 2>&1
echo.                              %gd%╔═════════════════════════════════════════════════════════╗
%pt%echo.                              %gd%║     %w%   Pressione qualquer tecla para continuar... ➡️    %gd%║
%en%echo.                              %gd%║     %w%   Press any key to continue... ➡️                  %gd%║
echo.                              %gd%╚═════════════════════════════════════════════════════════╝   
echo.
pause > nul
cls
goto menu


:SetupConsole
chcp 437 >nul
chcp 65001 >nul
cls
goto :eof

:DisplayBanner
if not defined CPUName (
    chcp 437 >nul
    for /f "delims=" %%A in ('powershell -NoProfile -Command "(Get-CimInstance Win32_Processor).Name" 2^>nul') do set "CPUName=%%A"
    chcp 65001 >nul
    if not defined CPUName for /f "tokens=*" %%A in ('powershell -NoProfile -Command "(Get-CimInstance Win32_Processor).Name"') do set "CPUName=%%A"
)

if not defined GPUName (
    chcp 437 >nul
    for /f "delims=" %%G in ('powershell -NoProfile -Command "(Get-CimInstance Win32_VideoController | Select-Object -First 1).Name" 2^>nul') do set "GPUName=%%G"
    chcp 65001 >nul
    if not defined GPUName for /f "tokens=*" %%G in ('powershell -NoProfile -Command "(Get-CimInstance Win32_VideoController).Name"') do (
        if not defined GPUName set "GPUName=%%G"
    )
)



:GotGPU
echo.
echo             %p% ██╗  ██╗███████╗██████╗  █████╗        %w% ████████╗ ██╗       ██╗███████╗ █████╗ ██╗  ██╗ ██████╗™
echo             %p% ╚██╗██╔╝██╔════╝██╔══██╗██╔══██╗       %w% ╚══██╔══╝ ██║  ██╗  ██║██╔════╝██╔══██╗██║ ██╔╝██╔════╝
echo             %p%  ╚███╔╝ █████╗  ██║  ██║██║  ██║       %w%    ██║    ╚██╗████╗██╔╝█████╗  ███████║█████═╝ ╚█████╗
echo             %p%  ██╔██╗ ██╔══╝  ██║  ██║██║  ██║       %w%    ██║     ████╔═████║ ██╔══╝  ██╔══██║██╔═██╗  ╚═══██╗
echo             %p% ██╔╝╚██╗███████╗██████╔╝╚█████╔╝       %w%    ██║     ╚██╔╝ ╚██╔╝ ███████╗██║  ██║██║ ╚██╗██████╔╝
echo             %p% ╚═╝  ╚═╝╚══════╝╚═════╝  ╚════╝        %w%    ╚═╝      ╚═╝   ╚═╝  ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ %u%
%pt%echo.                                                                                                %gd%Hora:%u%%w% %time%%u%
%en%echo.                                                                                               %gd%hours:%u%%w% %time%%u%
echo.
%pt%echo                                 %gd%Versão:%u% %w%%version%%u%     %gd%Usuário:%u%%w% %username%%u%  %gd%Data:%u%%w% %date%%u%
%en%echo                                 %gd%Version:%u% %w%%version%%u%   %gd%User:%u%%w% %username%%u%     %gd%Date:%u%%w% %date%%u%
echo.
echo.
echo                     %gd%GPU:%u%%w% %GPUName% %u%    %gd%CPU:%u%%w% %CPUName%%u%
echo.
echo   %gd%===================================================================================================================%u%
%pt%echo                                  %p%Xedo%w% Tweaks%p%%gd% é um script em lote que otimiza seu sistema%u%
%pt%echo                                   %gd%para fornecer a melhor experiência possível em jogos%u%
%en%echo                                %p%Xedo%w% Tweaks%p%%gd% is a batch script that optimizes your system%u%
%en%echo                                      %gd%to provide the best gaming experience possible%u%
echo   %gd%===================================================================================================================%u%
goto :eof


:menu
cls
call :SetupConsole
call :DisplayBanner
echo.
echo.
%pt%echo                       %a%» [%w%1%a%] %underline%Otimização com 1 Click%u%   %gd%[%w%2%gd%]%p% Correção Timer Resolution   %gd%[%w%3%gd%]%l% Limpeza
%en%echo                       %a%» [%w%1%a%] %underline%1 Click Optimizations%u%    %gd%[%w%2%gd%]%p% Timer Resolution FIX   %gd%[%w%3%gd%]%l% Cleaner
echo.
%pt%echo                  %gd%[%w%4%gd%]%gn% Desativar VBS / Mitigations (+FPS)     %gd%[%w%5%gd%]%y% Otimização Tela Cheia     %gd%[%w%6%gd%]%r% Backup
%en%echo                  %gd%[%w%4%gd%]%gn% Disable VBS / Mitigations (+FPS)     %gd%[%w%5%gd%]%y% Full Screen Optimization     %gd%[%w%6%gd%]%r% Backup
echo.
echo                                                         %gd%[%w%7%gd%]%l% Info%u%
echo.
echo.
%pt%echo                                                      %gd%[ %r%X para fechar %gd%]%u%
%en%echo                                                      %gd%[ %r%X to close %gd%]%u%
echo.
set /p M="%gd%Choose / Escolha »%u% "
set choice=%errorlevel%
if "%M%"=="1" goto 1
if "%M%"=="2" goto 2
if "%M%"=="3" goto 3
if "%M%"=="4" goto 4
if "%M%"=="5" goto 5
if "%M%"=="6" goto 6
if "%M%"=="222" goto 222
if "%M%"=="7" goto More
if "%M%"=="X" goto Destruct
if "%M%"=="x" goto Destruct
cls
%pt%echo %underline%%r%Entrada inválida. Pressione qualquer tecla para continuar.%u%
%en%echo %underline%%r%Invalid Input. Press any key to continue.%u%
pause >nul
goto Menu


:1
cls
call :SetupConsole
echo.
    %pt%echo.                  %a%╔═══════════════════════════════════════════════════════════════════════════════╗
    %pt%echo.                  ║                      CONFIGURAÇÃO DE DESEMPENHO AUTOMATIZADA                  ║
    %pt%echo.                  ╚═══════════════════════════════════════════════════════════════════════════════╝%u%
    %en%echo.                  %a%╔═══════════════════════════════════════════════════════════════════════════════╗
    %en%echo.                  ║                         AUTOMATED PERFORMANCE SETTING                         ║
    %en%echo.                  ╚═══════════════════════════════════════════════════════════════════════════════╝%u%
echo.
%pt%echo %a%APLICANDO OTIMIZACOES SEGURAS DE DESEMPENHO E LATENCIA:%u%

%pt%echo %gd% • DESATIVANDO A SEGURANÇA BASEADA EM VIRTUALIZAÇÃO%u%
%pt%echo %gd% • OTIMIZAÇÃO TIMERESOLUTION E BCDEDIT%u%
%pt%echo %gd% • CONFIGURACOES DE REDE, ENERGIA E LIMPEZA DE CACHE%u%
%pt%echo %gd% • RESPOSTA DA INTERFACE E DESATIVAÇÃO DE ANIMAÇÕES INÚTEIS%u%
%pt%echo %gd% • LATENCIA E PRIORIDADE DE JOGOS (MMCSS)%u%
%pt%echo %gd% • OTIMIZAÇÃO DO DESKTOP WINDOW MANAGER%u%
%pt%echo %gd% • GERENCIAMENTO E ALOCAÇÃO DE PROCESSADOR%u%
%pt%echo %gd% • OTIMIZAÇÃO DE MOUSE E TECLADO%u%
%pt%echo %gd% • BLOQUEIO DE ANÚNCIOS NATIVOS E NOTIFICAÇOES INVASIVAS%u%
%en%echo %a%APPLYING SECURE PERFORMANCE AND LATENCY OPTIMIZATIONS:%u%
%en%echo %gd% • DISABLING VIRTUALIZATIONBASEDSECURITY%u%
%en%echo %gd% • TIMERESOLUTION AND BCDEDIT OPTIMIZATION%u%
%en%echo %gd% • NETWORK, POWER AND CACHE CLEARING SETTINGS%u%
%en%echo %gd% • INTERFACE RESPONSE AND DISABLING USELESS ANIMATIONS%u%
%en%echo %gd% • LATENCY AND GAME PRIORITY (MMCSS)%u%
%en%echo %gd% • DESKTOP WINDOW MANAGER OPTIMIZATION%u%
%en%echo %gd% • PROCESSOR MANAGEMENT AND ALLOCATION%u%
%en%echo %gd% • MOUSE AND KEYBOARD OPTIMIZATION%u%
%en%echo %gd% • BLOCKING NATIVE ADS AND INVASIVE NOTIFICATIONS%u%
echo.
%pt%echo %a%ISSO DEFINIRÁ AUTOMATICAMENTE AS CONFIGURAÇÕES RECOMENDADAS PARA JOGOS...%u%
%pt%echo.
%pt%echo %r%⚠️ AVISO: Isso modificará as configurações do sistema e exigirá uma reinicialização.%u%
%pt%echo.
%pt%choice /C YN /M "%gd%Continuar com a configuração automatizada? (Y/N)%u%"
%en%echo %a%THIS WILL AUTOMATICALLY SET THE RECOMMENDED GAMING SETTINGS...%u%
%en%echo.
%en%echo %r%⚠️ WARNING: This will modify system settings and require a restart.%u%
%en%echo.
%en%choice /C YN /M "%gd%Continue with automated setup? (Y/N)%u%"
if errorlevel 2 goto menu

echo.
echo %a% - Disabling VirtualizationBasedSecurity%u%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 0 /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d 0 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 0 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "RequirePlatformSecurityFeatures" /t REG_DWORD /d 0 /f

echo.
echo %a% - Disabling HVCIMAT%u%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "HVCIMATRequired" /t REG_DWORD /d 0 /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "HypervisorEnforcedCodeIntegrity" /t REG_DWORD /d 0 /f

echo.
echo %a% - Disabling ExceptionChainValidation and MitigationOptions%u%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d 1 /f 
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationOptions" /f

echo.
echo %a% - Disabling Sehop%u%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPEnabled" /t REG_DWORD /d 0 /f

echo.
echo %a% - Disabling CFG%u%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d 0 /f 

echo.
echo %a% - Disabling Protection Mode%u%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d 0 /f 

echo.
echo %a% - Disabling Spectre/Meltdown CPU Mitigations%u%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 3 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d 3 /f

echo.
echo %a% - Disabling Hyper-V%u%
bcdedit /set hypervisorlaunchtype off

echo.
echo %a% - Disabling Fast Startup%u%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f 
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Disabling Hibernation%u%
powercfg /h off
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "SleepReliabilityDetailedDiagnostics" /t REG_DWORD /d "0" /f 
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Disabling Sleep Study%u%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "SleepStudyDisabled" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Disable Prefetch and superfetch%u%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Network Throttoling Index%u%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f

echo.
echo %a% - Disabling Dynamic Tick%u%
bcdedit /set Disabledynamictick yes >nul 2>&1
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Disable High Precision Event Timer (HPET)%u%
bcdedit /deletevalue useplatformclock  >nul 2>&1
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Disabling Synthetic Timers%u%
bcdedit /set useplatformtick no >nul 2>&1
bcdedit /set tscsyncpolicy Enhanced >nul 2>&1

echo.
echo %a% - Setting GlobalTimerResolutionRequests%u%
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v GlobalTimerResolutionRequests /t REG_DWORD /d 1 /f
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Setting TimerResolution%u%
schtasks /create /tn "SetTimerResolution" /tr "C:\SetTimerResolution.exe --resolution 5070 --no-console" /sc onstart /ru "SYSTEM" /rl highest /f
timeout /t 1 /nobreak > NUL

echo.
echo %a% - NFTS Tweaks%u%
fsutil behavior set memoryusage 2 >nul 2>&1
fsutil behavior set mftzone 4 >nul 2>&1
fsutil behavior set disablelastaccess 1 >nul 2>&1
fsutil behavior set disabledeletenotify 0 >nul 2>&1
fsutil behavior set encryptpagingfile 0 >nul 2>&1
timeout /t 1 /nobreak > nul

echo.
echo %a% - Decreasing process kill time and menu show delay%u%
reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d 1 /f
reg add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f
reg add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "1000" /f
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "1000" /f
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Setting System Responsiveness%u%
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "10" /f 
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Track Only Important Failure Events %u%
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Disabling Windows Insider Experiments%u%
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d 0 /f 
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation" /v "value" /t REG_DWORD /d 0 /f 
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Disabling Activity feed%u%
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v "EnableFeeds" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft" /v "AllowNewsAndInterests" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Disabling Automatic Maintenance%u%
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d 1 /f 
timeout /t 1 /nobreak > NUL

echo.
echo %a%- Stop Reinstalling Preinstalled apps %u%
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d 0 /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d 0 /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d 0 /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContentEnabled" /t REG_DWORD /d 0 /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d 0 /f
timeout /t 1 /nobreak > nul

echo.
echo %a% - Tweaking Compatibility Settings%u%
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Disabling Tracking and some diagnostics%u%
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d 1 /f
reg add "HKLM\System\CurrentControlSet\Control\Diagnostics\Performance" /v "DisablediagnosticTracing" /t REG_DWORD /d 1 /f >nul 2>&1 
reg add "HKLM\Software\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" /v "ScenarioExecutionEnabled" /t REG_DWORD /d 0 /f
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /Disable
schtasks /end /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"
schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable
timeout /t 1 /nobreak > nul

echo.
echo %a% - Disabling Filter Keys %g%(the filterkeys app is completely useless placebo, dont use it)%u%
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "122" /f

echo.
echo %a% - Disabling Toggle Keys%u%
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "58" /f

echo.
echo %a% - Disabling Sticky Keys%u%
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "506" /f

echo.
echo %a% - Disabling Mouse Keys%u%
reg add "HKCU\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_SZ /d 0 /f
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Disabling Mouse Acceleration%u%
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d 0 /f

echo.
echo %a% - Enabling 1:1 Pixel Mouse Movements%u%
reg add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f

echo.
echo %a% - Reducing Keyboard Repeat Delay%u%
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_SZ /d 0 /f

echo.
echo %a% - Increasing Keyboard Repeat Rate%u%
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f
timeout /t 1 /nobreak > nul

echo.
echo %a% Import Exm Free Power Plan V8%u%
powercfg -import "C:\xedo\Free_Power_Plan_V8.pow" 11111112-2223-3334-4445-555555555555
timeout /t 1 /nobreak > nul
powercfg /setactive 11111112-2223-3334-4445-555555555555
%pt%REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Xedo" /v "MUIVerb" /t REG_SZ /d "Plano Energia Gamer" /f
%en%REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Xedo" /v "MUIVerb" /t REG_SZ /d "Power Plan Gamer" /f
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Xedo" /v "SubCommands" /t REG_SZ /d "" /f
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Xedo" /v "Icon" /t REG_SZ /d "powercpl.dll" /f
%pt%REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Xedo\shell\Extremo" /v "MUIVerb" /t REG_SZ /d "Plano Energia EXM" /f
%pt%REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Xedo\shell\Extremo2" /v "MUIVerb" /t REG_SZ /d "Opções de Energia" /f
%en%REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Xedo\shell\Extremo" /v "MUIVerb" /t REG_SZ /d "EXM Power Plan" /f
%en%REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Xedo\shell\Extremo2" /v "MUIVerb" /t REG_SZ /d "Power Options" /f
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Xedo\shell\Extremo" /v "Icon" /t REG_SZ /d "powercpl.dll" /f
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Xedo\shell\Extremo2" /v "Icon" /t REG_SZ /d "powercpl.dll" /f
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Xedo\shell\Extremo\command" /ve /t REG_SZ /d "powercfg /setactive 11111112-2223-3334-4445-555555555555" /f
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Xedo\shell\Extremo2\command" /ve /t REG_SZ /d "explorer.exe shell:::{025A5937-A6BE-4686-A844-36FE4BEC8B6D}" /f

timeout /t 1 /nobreak > NUL

echo.
echo %a%- Disabling Core Parking  %u%
powercfg -setacvalueindex scheme_current sub_processor CPMINCORES 100
powercfg /setactive SCHEME_CURRENT
Reg.exe add HKLM\SYSTEM\CurrentControlSet\Control\Power /v CoreParkingDisabled /t REG_DWORD /d 1 /f
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Setting Best SvcHostSplitThresholdInKB for your ram size%u%
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "0xcfffffff" /f
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Game Latency and Priority (MMCSS)%u%
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d 0 /f
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Desktop Window Manager (Window Mode) Optimization and Hardware Scheduling (HAGS)%u%
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Scheduling Category" /t REG_SZ /d "High" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Priority" /t REG_DWORD /d 6 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MaximumDeviceContexts" /t REG_DWORD /d 255 /f
reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "GlobalGpuPreference" /t REG_DWORD /d 2 /f
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Processor Management and Allocation%u%
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQPriority" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalCriticalWorkerThreads" /t REG_DWORD /d 16 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "PriorityQuantum" /t REG_DWORD /d 6 /f
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Physical Mouse/Keyboard Response (Increased Data Queues)%u%
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d 100 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d 100 /f
timeout /t 1 /nobreak > NUL

echo.
echo %a% - SSD and File Subsystem (NTFS) Performance%u%
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters\Device" /v "BypassIoSupported" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsMemoryUsage" /t REG_DWORD /d 2 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "DisableDeleteNotification" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "ConfigFileAllocSize" /t REG_DWORD /d 1024 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableEncryption" /t REG_DWORD /d 1 /f
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Native Audio Subsystem Optimization%u%
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Clock Rate" /t REG_DWORD /d 10000 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "GPU Priority" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Priority" /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Scheduling Category" /t REG_SZ /d "Medium" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "SFIO Priority" /t REG_SZ /d "Normal" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Background Only" /t REG_SZ /d "False" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Disable Logging" /t REG_DWORD /d 1 /f

timeout /t 1 /nobreak > NUL


echo.
echo %a% - Interface Response and Disabling Useless Animations%u%
reg add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d 9012018010000000 /f
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "2000" /f
reg add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f
reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
reg add "HKCU\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Accessibility" /v "DynamicAnimateWindows" /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowInfoTip" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ThumbnailLivePreviewHoverDelay" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DontShowTypeCube" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableThumbnailCache" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShareAvailable" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "VisualFXSetting" /t REG_DWORD /d 2 /f
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Enabling Game Mode %u%
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 1 /f

:: --- NETWORK, POWER AND CACHE CLEARING SETTINGS ---
echo.
echo %a% - Optimizing network buffers and hardware power...%u%
netsh interface tcp set global heuristics=disabled
netsh int tcp set global rss=enabled
netsh int tcp set global autotuninglevel=normal
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
ipconfig /flushdns
taskkill /f /im explorer.exe
del /f /s /q "%LocalAppData%\Microsoft\DirectXShaderCache\*" 2>nul
del /f /s /q "%LocalAppData%\Microsoft\FontCache\*" 2>nul
del /S /F /Q "%temp%\*.*" 2>nul
del /S /F /Q "%WINDIR%\Temp\*.*" 2>nul
del /S /F /Q "%WINDIR%\Prefetch\*.*" 2>nul
del /S /F /Q "%WINDIR%\logs\cbs\*.log" 2>nul
del /S /F /Q "%WINDIR%\Logs\MoSetup\*.log" 2>nul
del /S /F /Q "%WINDIR%\Panther\*.log" 2>nul
del /S /F /Q "%WINDIR%\inf\*.log" 2>nul
del /S /F /Q "%WINDIR%\logs\*.log" 2>nul
del /S /F /Q "%WINDIR%\SoftwareDistribution\*.log" 2>nul
del /S /F /Q "%WINDIR%\Microsoft.NET\*.log" 2>nul
timeout /t 1 /nobreak > NUL
del /S /F /Q "%SystemDrive%\Users\%%USERNAME%%\AppData\Local\Microsoft\Windows\WebCache\*.log" 2>nul
del /S /F /Q "%SystemDrive%\Users\%%USERNAME%%\AppData\Local\Microsoft\Windows\SettingSync\*.log" 2>nul
del /S /F /Q "%SystemDrive%\Users\%%USERNAME%%\AppData\Local\Microsoft\Windows\Explorer\ThumbCacheToDelete\*.tmp" 2>nul
del /S /F /Q "%SystemDrive%\Users\%%USERNAME%%\AppData\Local\Microsoft\Terminal Server Client\Cache\*.bin" 2>nul
del /f /s /q "%LocalAppData%\Microsoft\DirectXShaderCache\*" 2>nul
start explorer.exe
net stop wuauserv
net stop UsoSvc
del /S /F /Q "%WINDIR%\SoftwareDistribution" 2>nul
timeout /t 1 /nobreak > NUL

choice /C YN /M "%gd%Limpar o cache da placa de video? (Y/N)%u%"
if errorlevel 2 goto menu

:: Caches de Placa de Vídeo (NVIDIA/AMD/Intel)
del /s /f /q "%USERPROFILE%\AppData\LocalLow\NVIDIA\PerDriverVersion\DXCache\*.*" 2>nul
del /s /f /q "%USERPROFILE%\AppData\Local\NVIDIA\DXCache\*.*" 2>nul
del /s /f /q "%USERPROFILE%\AppData\Local\NVIDIA\GLCache\*.*" 2>nul
del /s /f /q "%USERPROFILE%\AppData\Local\AMD\DxCache\*.*" 2>nul
del /s /f /q "%USERPROFILE%\AppData\Local\AMD\DxcCache\*.*" 2>nul
del /s /f /q "%USERPROFILE%\AppData\Local\AMD\VkCache\*.*" 2>nul
del /s /f /q "%USERPROFILE%\AppData\LocalLow\AMD\DxCache\*.*" 2>nul
del /s /f /q "%USERPROFILE%\AppData\Local\Intel\ShaderCache\*.*" 2>nul
del /s /f /q "%USERPROFILE%\AppData\LocalLow\Intel\ShaderCache\*.*" 2>nul
echo.
echo.
cls
call :SetupConsole
echo.
echo.
echo.                              %gd%╔═════════════════════════════════════════════════════════╗
%pt%echo.                              %gd%║     %w%   Pressione qualquer tecla para continuar... ➡️    %gd%║
%en%echo.                              %gd%║     %w%   Press any key to continue... ➡️                  %gd%║
echo.                              %gd%╚═════════════════════════════════════════════════════════╝   
echo.
pause >nul
cls
chcp 437 >nul 2>&1
%pt%powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Sistema Otimizado Com Sucesso, pressione "OK" para continuar', 'Xedo Tweaks', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
%en%powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Successfully Optimized System, Press "OK" To continue', 'Xedo Tweaks', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
shutdown /r /f /t 0


:2
cls
call :SetupConsole
echo.
    %pt%echo.                  %p%╔═══════════════════════════════════════════════════════════════════════════════╗
    %pt%echo.                  ║                                 TimerResolution                               ║
    %pt%echo.                  ╚═══════════════════════════════════════════════════════════════════════════════╝%u%
    %en%echo.                  %p%╔═══════════════════════════════════════════════════════════════════════════════╗
    %en%echo.                  ║                                 TimerResolution                               ║
    %en%echo.                  ╚═══════════════════════════════════════════════════════════════════════════════╝%u%
echo.
echo.
%pt%choice /C YN /M "%gd%Aplicar Otimização TimerResolution (Y/N)%u%"
%en%choice /C YN /M "%gd%Apply TimerResolution Optimization (Y/N)%u%"
if errorlevel 2 goto menu

echo.
echo %a% - Disabling Dynamic Tick%u%
bcdedit /set Disabledynamictick yes >nul 2>&1
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Disable High Precision Event Timer (HPET)%u%
bcdedit /deletevalue useplatformclock  >nul 2>&1
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Disabling Synthetic Timers%u%
bcdedit /set useplatformtick no >nul 2>&1
bcdedit /set tscsyncpolicy Enhanced >nul 2>&1

echo.
echo %a% - Setting GlobalTimerResolutionRequests%u%
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v GlobalTimerResolutionRequests /t REG_DWORD /d 1 /f
timeout /t 1 /nobreak > NUL

echo.
echo %a% - Setting TimerResolution%u%
schtasks /create /tn "SetTimerResolution" /tr "C:\SetTimerResolution.exe --resolution 5070 --no-console" /sc onstart /ru "SYSTEM" /rl highest /f
timeout /t 1 /nobreak > NUL
echo.
cls
call :SetupConsole
echo.
echo.
echo.                              %gd%╔═════════════════════════════════════════════════════════╗
%pt%echo.                              %gd%║     %w%   Pressione qualquer tecla para continuar... ➡️    %gd%║
%en%echo.                              %gd%║     %w%   Press any key to continue... ➡️                  %gd%║
echo.                              %gd%╚═════════════════════════════════════════════════════════╝   
echo.
pause >nul
cls
goto menu


:3
cls
call :SetupConsole
echo.
    %pt%echo.                  %l%╔═══════════════════════════════════════════════════════════════════════════════╗
    %pt%echo.                  ║                                 Limpar arquivos                               ║
    %pt%echo.                  ╚═══════════════════════════════════════════════════════════════════════════════╝%u%
    %en%echo.                  %l%╔═══════════════════════════════════════════════════════════════════════════════╗
    %en%echo.                  ║                                    Cleaner                                    ║
    %en%echo.                  ╚═══════════════════════════════════════════════════════════════════════════════╝%u%
echo.
echo.
%pt%choice /C YN /M "%gd%Limpar arquivos temporários do Sistema? (Y/N)%u%"
%en%choice /C YN /M "%gd%Clear temporary system files? (Y/N)%u%"
if errorlevel 2 goto menu

%pt%echo %a% - Limpando...%u%
%en%echo %a% - Cleaning...%u%
ipconfig /flushdns
taskkill /f /im explorer.exe
del /f /s /q "%LocalAppData%\Microsoft\DirectXShaderCache\*" 2>nul
del /f /s /q "%LocalAppData%\Microsoft\FontCache\*" 2>nul
del /S /F /Q "%temp%\*.*" 2>nul
del /S /F /Q "%WINDIR%\Temp\*.*" 2>nul
del /S /F /Q "%WINDIR%\Prefetch\*.*" 2>nul
del /S /F /Q "%WINDIR%\logs\cbs\*.log" 2>nul
del /S /F /Q "%WINDIR%\Logs\MoSetup\*.log" 2>nul
del /S /F /Q "%WINDIR%\Panther\*.log" 2>nul
del /S /F /Q "%WINDIR%\inf\*.log" 2>nul
del /S /F /Q "%WINDIR%\logs\*.log" 2>nul
del /S /F /Q "%WINDIR%\SoftwareDistribution\*.log" 2>nul
del /S /F /Q "%WINDIR%\Microsoft.NET\*.log" 2>nul
timeout /t 1 /nobreak > NUL
del /S /F /Q "%SystemDrive%\Users\%%USERNAME%%\AppData\Local\Microsoft\Windows\WebCache\*.log" 2>nul
del /S /F /Q "%SystemDrive%\Users\%%USERNAME%%\AppData\Local\Microsoft\Windows\SettingSync\*.log" 2>nul
del /S /F /Q "%SystemDrive%\Users\%%USERNAME%%\AppData\Local\Microsoft\Windows\Explorer\ThumbCacheToDelete\*.tmp" 2>nul
del /S /F /Q "%SystemDrive%\Users\%%USERNAME%%\AppData\Local\Microsoft\Terminal Server Client\Cache\*.bin" 2>nul
del /f /s /q "%LocalAppData%\Microsoft\DirectXShaderCache\*" 2>nul
start explorer.exe
net stop wuauserv
net stop UsoSvc
del /S /F /Q "%WINDIR%\SoftwareDistribution" 2>nul
timeout /t 1 /nobreak > NUL

%pt%choice /C YN /M "%gd%Limpar o cache da placa de video? (Y/N)%u%"
%en%choice /C YN /M "%gd%Clear the video card cache? (Y/N)%u%"
if errorlevel 2 goto menu

:: Caches de Placa de Vídeo (NVIDIA/AMD/Intel)
del /s /f /q "%USERPROFILE%\AppData\LocalLow\NVIDIA\PerDriverVersion\DXCache\*.*" 2>nul
del /s /f /q "%USERPROFILE%\AppData\Local\NVIDIA\DXCache\*.*" 2>nul
del /s /f /q "%USERPROFILE%\AppData\Local\NVIDIA\GLCache\*.*" 2>nul
del /s /f /q "%USERPROFILE%\AppData\Local\AMD\DxCache\*.*" 2>nul
del /s /f /q "%USERPROFILE%\AppData\Local\AMD\DxcCache\*.*" 2>nul
del /s /f /q "%USERPROFILE%\AppData\Local\AMD\VkCache\*.*" 2>nul
del /s /f /q "%USERPROFILE%\AppData\LocalLow\AMD\DxCache\*.*" 2>nul
del /s /f /q "%USERPROFILE%\AppData\Local\Intel\ShaderCache\*.*" 2>nul
del /s /f /q "%USERPROFILE%\AppData\LocalLow\Intel\ShaderCache\*.*" 2>nul
echo.
echo.
cls
call :SetupConsole
echo.
echo.
echo.                              %gd%╔═════════════════════════════════════════════════════════╗
%pt%echo.                              %gd%║     %w%   Pressione qualquer tecla para continuar... ➡️    %gd%║
%en%echo.                              %gd%║     %w%   Press any key to continue... ➡️                  %gd%║
echo.                              %gd%╚═════════════════════════════════════════════════════════╝   
echo.
pause >nul
cls
goto menu


:4
cls
call :SetupConsole
call :DisplayBanner
echo                             %gn%╔══════════════════════════════╦═══════════════════════════════╗ 
echo                             %gn%║                                                              ║
%pt%echo                             %gn%║               %gd%[%w%1%gd%] %gn%Desativar VBS / Mitigações                 ║
%en%echo                             %gn%║               %gd%[%w%1%gd%] %gn%Disable VBS / Mitigations                  ║
echo                             %gn%║                                                              ║
%pt%echo                             %gn%║               %gd%[%w%2%gd%] %gn%Ativar VBS / Mitigações                    ║
%en%echo                             %gn%║               %gd%[%w%2%gd%] %gn%Enable VBS / Mitigations                   ║
echo                             %gn%║                                                              ║
echo                             %gn%║                                                              ║
echo                             %gn%╚══════════════════════════════╩═══════════════════════════════╝
echo.
%pt%echo                                       %gd%[%w%0%gd%] %gd%Voltar ao Menu   %gd%[%w%X%gd%] %r%Sair do aplicativo
%en%echo                                       %gd%[%w%0%gd%] %gd%Back to Main   %gd%[%w%X%gd%] %r%Exit Application
echo.
set /p M="%gd%Choose / Escolha »%u% "
if "%M%"=="1" goto A
if "%M%"=="2" goto B
if "%M%"=="0" goto menu
if "%M%"=="X" goto Destruct
if "%M%"=="x" goto Destruct
cls
%pt%echo %underline%%r%Entrada inválida. Pressione qualquer tecla para continuar.%u%
%en%echo %underline%%r%Invalid Input. Press any key to continue.%u%
pause >nul
goto 4


:A
cls
call :SetupConsole
echo.
    %pt%echo.                  %gn%╔═══════════════════════════════════════════════════════════════════════════════╗
    %pt%echo.                  ║                                 VBS / Mitigações                              ║
    %pt%echo.                  ╚═══════════════════════════════════════════════════════════════════════════════╝%u%
    %en%echo.                  %gn%╔═══════════════════════════════════════════════════════════════════════════════╗
    %en%echo.                  ║                                 VBS / Mitigations                             ║
    %en%echo.                  ╚═══════════════════════════════════════════════════════════════════════════════╝%u%
echo.
echo.
%pt%choice /C YN /M "%gd%Desativar VBS / Mitigações? (Y/N)%u%"
%en%choice /C YN /M "%gd%Disable VBS / Mitigations? (Y/N)%u%"
if errorlevel 2 goto menu

echo.
echo %gn% - Disabling VirtualizationBasedSecurity%u%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 0 /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d 0 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 0 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "RequirePlatformSecurityFeatures" /t REG_DWORD /d 0 /f

echo.
echo %gn% - Disabling HVCIMAT%u%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "HVCIMATRequired" /t REG_DWORD /d 0 /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "HypervisorEnforcedCodeIntegrity" /t REG_DWORD /d 0 /f

echo.
echo %gn% - Disabling ExceptionChainValidation and MitigationOptions%u%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d 1 /f 
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationOptions" /f

echo.
echo %gn% - Disabling Sehop%u%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPEnabled" /t REG_DWORD /d 0 /f

echo.
echo %gn% - Disabling CFG%u%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d 0 /f 

echo.
echo %gn% - Disabling Protection Mode%u%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d 0 /f 

echo.
echo %gn% - Disabling Spectre/Meltdown CPU Mitigations%u%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 3 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d 3 /f

echo %a% - Disabling Hyper-V%u%
bcdedit /set hypervisorlaunchtype off
echo.
echo.
cls
call :SetupConsole
echo.
echo.
echo.                              %gd%╔═════════════════════════════════════════════════════════╗
%pt%echo.                              %gd%║     %w%   Pressione qualquer tecla para continuar... ➡️    %gd%║
%en%echo.                              %gd%║     %w%   Press any key to continue... ➡️                  %gd%║
echo.                              %gd%╚═════════════════════════════════════════════════════════╝   
echo.
pause >nul
cls
goto menu


:B
cls
call :SetupConsole
echo.
    %pt%echo.                  %gn%╔═══════════════════════════════════════════════════════════════════════════════╗
    %pt%echo.                  ║                                 VBS / Mitigações                              ║
    %pt%echo.                  ╚═══════════════════════════════════════════════════════════════════════════════╝%u%
    %en%echo.                  %gn%╔═══════════════════════════════════════════════════════════════════════════════╗
    %en%echo.                  ║                                 VBS / Mitigations                             ║
    %en%echo.                  ╚═══════════════════════════════════════════════════════════════════════════════╝%u%
echo.
echo.
%pt%choice /C YN /M "%gd%Ativar VBS / Mitigações? (Y/N)%u%"
%en%choice /C YN /M "%gd%Enable VBS / Mitigations? (Y/N)%u%"
if errorlevel 2 goto menu

echo.
echo %gn% - Enabling Isolation Memory Integrity%b%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 1 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "RequirePlatformSecurityFeatures" /t REG_DWORD /d 1 /f

echo %gn% - Enabling HVCIMAT%b%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "HVCIMATRequired" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "HypervisorEnforcedCodeIntegrity" /t REG_DWORD /d 1 /f

echo %gn% - Enabling ExceptionChainValidation%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationOptions" /t REG_BINARY /d "ffffffffffffffff" /f

echo %gn% - Enabling Sehop%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPEnabled" /t REG_DWORD /d "1" /f

echo %gn% - Enabling CFG%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d "1" /f 

echo %gn% - Enabling Protection Mode%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d "1" /f 

echo %gn% - Enabling Spectre/Meltdown CPU Mitigations%u%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 0 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d 3 /f

bcdedit /deletevalue hypervisorlaunchtype
echo.
echo.
cls
call :SetupConsole
echo.
echo.
echo.                              %gd%╔═════════════════════════════════════════════════════════╗
%pt%echo.                              %gd%║     %w%   Pressione qualquer tecla para continuar... ➡️    %gd%║
%en%echo.                              %gd%║     %w%   Press any key to continue... ➡️                  %gd%║
echo.                              %gd%╚═════════════════════════════════════════════════════════╝   
echo.
pause >nul
cls
goto menu


:6
goto restorepoint


:5
cls
call :SetupConsole
call :DisplayBanner
echo                             %y%╔══════════════════════════════╦═══════════════════════════════╗ 
echo                             %y%║                                                              ║
%pt%echo                             %y%║               %gd%[%w%1%gd%] %y%Desativar FSO (Jogos Antigos)              ║
%en%echo                             %y%║               %gd%[%w%1%gd%] %y%Disable FSO (Old Games)                    ║
echo                             %y%║                                                              ║
%pt%echo                             %y%║               %gd%[%w%2%gd%] %y%Ativar FSO (Jogos modernos)                ║
%en%echo                             %y%║               %gd%[%w%2%gd%] %y%Enable FSO (Modern Games)                  ║
echo                             %y%║                                                              ║
%pt%echo                             %y%║               %gd%[%w%3%gd%] %y%Configuração MPO / HAGS                    ║
%en%echo                             %y%║               %gd%[%w%3%gd%] %y%MPO / HAGS Configuration                   ║
echo                             %y%╚══════════════════════════════════════════════════════════════╝
echo.
%pt%echo                                       %gd%[%w%0%gd%] %gd%Voltar ao Menu   %gd%[%w%X%gd%] %r%Sair do aplicativo
%en%echo                                       %gd%[%w%0%gd%] %gd%Back to Main   %gd%[%w%X%gd%] %r%Exit Application
echo.
set /p M="%gd%Choose / Escolha »%u% "
if "%M%"=="1" goto FSE
if "%M%"=="2" goto FSO
if "%M%"=="3" goto MPO
if "%M%"=="0" goto menu
if "%M%"=="X" goto Destruct
if "%M%"=="x" goto Destruct
cls
%pt%echo %underline%%r%Entrada inválida. Pressione qualquer tecla para continuar.%u%
%en%echo %underline%%r%Invalid Input. Press any key to continue.%u%
pause >nul
goto 5


:FSE
cls
call :SetupConsole
echo.
    %pt%echo.                  %y%╔═══════════════════════════════════════════════════════════════════════════════╗
    %pt%echo.                  ║                               Otimização Tela FSE                             ║
    %pt%echo.                  ╚═══════════════════════════════════════════════════════════════════════════════╝%u%
    %en%echo.                  %y%╔═══════════════════════════════════════════════════════════════════════════════╗
    %en%echo.                  ║                             FSE Screen Optimization                           ║
    %en%echo.                  ╚═══════════════════════════════════════════════════════════════════════════════╝%u%
echo.
echo.
%pt%choice /C YN /M "%y%Ativar Otimização de Tela FSE? (Y/N)%u%"
%en%choice /C YN /M "%y%Enable FSE Screen Optimization? (Y/N)%u%"
if errorlevel 2 goto menu

echo.
%pt%echo %a% - Ativando FSE...%u%
%en%echo %a% - Activating FSE...%u%
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d 1 /f
echo.
echo.
cls
call :SetupConsole
echo.
echo.
echo.                              %gd%╔═════════════════════════════════════════════════════════╗
%pt%echo.                              %gd%║     %w%   Pressione qualquer tecla para continuar... ➡️    %gd%║
%en%echo.                              %gd%║     %w%   Press any key to continue... ➡️                  %gd%║
echo.                              %gd%╚═════════════════════════════════════════════════════════╝   
echo.
pause >nul
cls
goto menu


:FSO
cls
call :SetupConsole
echo.
    %pt%echo.                  %y%╔═══════════════════════════════════════════════════════════════════════════════╗
    %pt%echo.                  ║                               Otimização Tela FSO                             ║
    %pt%echo.                  ╚═══════════════════════════════════════════════════════════════════════════════╝%u%
    %en%echo.                  %y%╔═══════════════════════════════════════════════════════════════════════════════╗
    %en%echo.                  ║                             FSO Screen Optimization                           ║
    %en%echo.                  ╚═══════════════════════════════════════════════════════════════════════════════╝%u%
echo.
echo.
%pt%choice /C YN /M "%y%Ativar Otimização de Tela FSO? (Y/N)%u%"
%en%choice /C YN /M "%y%Enable FSO Screen Optimization? (Y/N)%u%"
if errorlevel 2 goto menu

echo.
%pt%echo %a% - Ativando FSO...%u%
%en%echo %a% - Activating FSO...%u%
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d 0 /f
echo.
echo.
cls
call :SetupConsole
echo.
echo.
echo.                              %gd%╔═════════════════════════════════════════════════════════╗
%pt%echo.                              %gd%║     %w%   Pressione qualquer tecla para continuar... ➡️    %gd%║
%en%echo.                              %gd%║     %w%   Press any key to continue... ➡️                  %gd%║
echo.                              %gd%╚═════════════════════════════════════════════════════════╝   
echo.
pause >nul
cls
goto menu


:MPO
cls
call :SetupConsole
echo.
    echo.                  %y%╔═══════════════════════════════════════════════════════════════════════════════╗
    echo.                  ║                                     MPO / HAGS                                ║
    echo.                  ╚═══════════════════════════════════════════════════════════════════════════════╝%u%
echo.
echo.
%pt%echo %a% • Desativar MPO e HAGS podem resolver ou reduzir micro travadas e tela piscando!%u%
%pt%echo %gn%   (+)Melhora a estabilidade geral do FPS e resolve engasgos crônicos de tela.%u%
%en%echo %a% • Disabling MPO and HAGS can resolve or reduce micro freezes and screen flickering!%u%
%en%echo %gn%   (+)Improves overall FPS stability and resolves chronic screen stuttering.%u%
%pt%echo %r%⚠️ AVISO: Não recomendo desativar caso esteja usando Frame Generation (DLSS/FSR).%u%
%en%echo %r%⚠️ WARNING: I do not recommend disabling if you are using Frame Generation (DLSS/FSR).%u%
echo.
%pt%choice /C YN /M "%y%Desativar MPO / HAGS?%r% Aperte [N] para manter ativados (Y/N)%u%"
%en%choice /C YN /M "%y%Disable MPO / HAGS?%r% Press [N] to keep activated (Y/N)%u%"
if errorlevel 2 goto NMPO

%pt%echo %r% - Desativando MPO / HAGS...%u%
%en%echo %r% - Disabling MPO / HAGS...%u%
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "OverlayTestMode" /t REG_DWORD /d "00000005" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 1 /f
timeout /t 2 /nobreak > NUL
echo.
echo.                              %gd%╔═════════════════════════════════════════════════════════╗
%pt%echo.                              %gd%║     %w%   Pressione qualquer tecla para continuar... ➡️    %gd%║
%en%echo.                              %gd%║     %w%   Press any key to continue... ➡️                  %gd%║
echo.                              %gd%╚═════════════════════════════════════════════════════════╝   
echo.
pause >nul
cls
goto menu

:NMPO

%pt%echo %gn% - Ativando MPO / HAGS...%u%
%en%echo %gn% - Enabling MPO / HAGS...%u%
reg delete "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "OverlayTestMode" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f
timeout /t 2 /nobreak > NUL
echo.
echo.                              %gd%╔═════════════════════════════════════════════════════════╗
%pt%echo.                              %gd%║     %w%   Pressione qualquer tecla para continuar... ➡️    %gd%║
%en%echo.                              %gd%║     %w%   Press any key to continue... ➡️                  %gd%║
echo.                              %gd%╚═════════════════════════════════════════════════════════╝   
echo.
pause >nul
cls
goto menu


:more
cls
call :SetupConsole
echo.
echo.
    echo.                  %l%╔══════════════════════════════════════════════════════════════════════════════╗
    echo.                  ║                                    INFO                                      ║
    echo.                  ╚══════════════════════════════════════════════════════════════════════════════╝%u%
echo.
echo.
%pt%echo                    %gn%▌ Criador:%u% %gd%Xedo223%u%
%pt%echo                    %gn%▌ Propósito:%u% %gd%Melhorar o desempenho do sistema%u%
%pt%echo                    %gn%▌ Versão:%u% %gd%%version% %u%
%en%echo                    %gn%▌ Creator:%u% %gd%Xedo223%u%
%en%echo                    %gn%▌ Purpose:%u% %gd%Improve System Performance%u%
%en%echo                    %gn%▌ Version:%u% %gd%%version% %u%
echo.
echo.
%pt%echo                   %gd%Xedo Tweaks representa anos de pesquisa e desenvolvimento em sistemas%u%
%pt%echo                   %gd%técnicas de otimização. Este kit de ferramentas abrangente fornece cuidadosamente%u%
%pt%echo                   %gd%ajustes e modificações selecionados projetados para aprimorar sua experiência%u%
%pt%echo                   %gd%de computação enquanto mantém a estabilidade e a confiabilidade do sistema..%u%
%en%echo                   %gd%Xedo Tweaks represents years of research and development in system%u%
%en%echo                   %gd%optimization techniques. This comprehensive toolkit provides carefully%u%
%en%echo                   %gd%curated tweaks and modifications designed to enhance your computing%u%
%en%echo                   %gd%experience while maintaining system stability and reliability.%u%
echo.
echo.
echo.                              %gd%╔═════════════════════════════════════════════════════════╗
%pt%echo.                              %gd%║     %w%   Pressione qualquer tecla para continuar... ➡️    %gd%║
%en%echo.                              %gd%║     %w%   Press any key to continue... ➡️                  %gd%║
echo.                              %gd%╚═════════════════════════════════════════════════════════╝   
echo.
pause >nul
cls
goto menu


:Destruct
%pt%title Obrigado por usar Xedo Tweaks!
%en%title Thanks for using Xedo Tweaks!
cls
echo.            
%pt%echo %u%Desenvolvido por: %gd%Xedo223
%en%echo %u%Developed by: %gd%Xedo223
echo %u%Github: %gd%https://github.com/Xedo223
timeout /t 5 >nul
endlocal
exit
