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

echo GitLab 계정 설정
set /p name1="GitLab UserName을 입력해 주세요. : "
set /p email1="GitLab UserEmail을 입력해 주세요. : "
set /p pw1="GitLab Token을 입력해 주세요. : "

git config --global core.autocrlf true
echo .
echo ..
echo ...
echo CRLF 설정 완료

git config --global user.name %name1%
git config --global user.email %email1%
git config --global credential.helper store

echo .
echo ..
echo ...
echo 계정 설정 완료

for /l %%x in (1, 1, 3) do (echo.)


echo ==============================
echo Github 계정 설정
set /p name2="Github UserName을 입력해 주세요. : "
set /p email2="Github UserEmail을 입력해 주세요. : "
set /p pw2="Github Token을 입력해 주세요. : "

set cre1=https://%name1%:%pw1%@lab.ssafy.com
set cre2=https://%name2%:%pw2%@github.com

cd C:\Users\%username%

set NLM=^


set NL=^^^%NLM%%NLM%^%NLM%%NLM%


set concre=test%NL%test
@REM echo | set /p _tmp=%cre1%%NL%> .git-credentials
@REM echo | set /p _tmp=%cre2%>> .git-credentials

@REM echo | set /p _tmp=%concre%> .git-credentials

echo %concre%> .git-credentials

echo .
echo ..
echo ...
echo 계정 설정 완료

pause