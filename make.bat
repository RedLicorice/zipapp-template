@echo off
echo Preparing dist folder..
rmdir /s /q .\dist > nul
mkdir dist
xcopy /s /D /E /Y app dist > nul
del /q .\dist\requirements.txt

if not exist .\deps\ (
    mkdir /s /q .\deps
    echo Installing dependencies to deps folder..
    python -m pip install -r app/requirements.txt --target deps/
)

echo Copying dependencies to dist folder..
xcopy /s /D /E /Y deps dist > nul

echo Packaging dist folder to deploy.pyz
python -m zipapp ./dist -o deploy.pyz --main=main:main

rmdir /s /q .\dist > nul
