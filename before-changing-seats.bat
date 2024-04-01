@echo off
chcp 65001 >> null 


set "menu="
set "menu===============================!newline!"
set "menu=%menu%1. Git 설정 초기화!newline!"
set "menu=%menu%2. VSCode 설정 초기화!newline!"
set "menu=%menu%q. 종료!newline!"


:MENU
echo ===============================
echo '초기화할 설정을 선택해주세요.'
echo ===============================
set /p choice="원하는 작업을 선택하세요 (1 또는 2를 입력해주세요, 종료하려면 q를 입력해주세요): "

if "%choice%"=="1" (
    echo "Git 설정 초기화 시작"

    git config --global --unset user.name
    git config --global --unset user.email

    git config --global --unset credential.helper

    del C:\Users\%username%\.git-credentials

    cmdkey /delete:LegacyGeneric:target=git:https://lab.ssafy.com
    cmdkey /delete:LegacyGeneric:target=git:https://github.com

    echo "Git 설정 초기화 완료"
    goto MENU
) else if "%choice%"=="2" (
    echo "VSCode 설정 초기화 시작"
    
    rmdir /s /q C:\Users\%username%\AppData\Roaming\Code
    
    echo "VSCode 설정 초기화 완료"
    goto MENU
) else if /i "%choice%"=="q" (
    echo "프로그램을 종료합니다."
    exit /b
) else (
    echo "잘못된 입력입니다. 1, 2 또는 q를 입력해주세요."
    goto MENU
)

pause 