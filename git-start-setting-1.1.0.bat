@echo off

chcp 65001 > NUL

echo ==============================
<nul set /p "_demo=|                            |"
echo.
<nul set /p "_demo=|     싸피 Git 초기 설정     |"
echo.
<nul set /p "_demo=|                            |"
echo.
echo ==============================

:MENU
echo ============================================
<nul set /p "_demo=|   1. GitLab 계정 등록                    |"
echo.
<nul set /p "_demo=|   2. Github 계정 등록                    |"
echo.
<nul set /p "_demo=|   3. 기타 Git 설정(autocrlf, credential) |"
echo.
<nul set /p "_demo=|   q. 종료                                |"
echo.
echo ============================================
set /p choice="원하는 작업을 선택하세요 (1, 2, 3, q를 입력해주세요): "

if "%choice%"=="1" (
    echo GitLab 계정 설정
    set /p name1="GitLab UserName을 입력해 주세요. : "
    set /p email1="GitLab UserEmail을 입력해 주세요. : "
    set /p pw1="GitLab Token을 입력해 주세요. : "

    echo GitLab 계정 설정 완료

    echo.
) else if "%choice%"=="2" (
    echo Github 계정 설정
    set /p name2="Github UserName을 입력해 주세요. : "
    set /p email2="Github UserEmail을 입력해 주세요. : "
    set /p pw2="Github Token을 입력해 주세요. : "

    echo Github 계정 설정 완료
    echo.
) else if "%choice%"=="3" (
    echo Git 기타 설정
    git config --global core.autocrlf true
    git config --global credential.helper store

    echo Git 기타 설정 완료
    echo.
) else if /i "%choice%"=="q" (
    echo "프로그램을 종료합니다."
    echo.

    echo 설정 결과 출력
    git config --global --list
    pause
    exit /b
) else (
    echo "잘못된 입력입니다. 1, 2, 3 또는 q를 입력해주세요."
    echo.
)

set NLM=^


set NL=^^^%NLM%%NLM%^%NLM%%NLM%
set cre_path=C:\Users\%username%\.git-credentials

if not "%name1%"=="" set cre1=https://%name1%:%pw1%@lab.ssafy.com
if not "%name2%"=="" set cre2=https://%name2%:%pw2%@github.com

if not "%cre1%"=="" if not "%cre2%"=="" (
    echo %cre1%%NL%%cre2%%NL%> %cre_path%

    if not "%email1%"=="%email2%" (
        git config --global user.name %name1%
        git config --global user.email %email1%
        echo GitLab 이메일과 Github 이메일이 다릅니다.
        echo 대표 이메일을 선택해주세요.
        echo 1. %email1%
        echo 2. %email2%
        set /p choice="대표 이메일을 선택해 주세요 (1, 2를 입력해주세요) : "
        if "%choice%"=="1" (
            git config --global user.email %email1%
        ) else if "%choice%"=="2" (
            git config --global user.email %email2%
        ) else (
            echo "잘못된 입력입니다. 1 또는 2를 입력해주세요."
        )
    )
) else if not "%cre1%"=="" (
    echo %cre1%%NL%> %cre_path%
    git config --global user.name %name1%
    git config --global user.email %email1%
) else if not "%cre2%"=="" (
    echo %cre2%%NL%> %cre_path%
    git config --global user.name %name2%
    git config --global user.email %email2%
)

goto MENU