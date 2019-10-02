SET VS150COMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools
call "%VS150COMNTOOLS%\..\..\VC\Auxiliary\Build\vcvarsall.bat" x64
echo on

msbuild /m VirtualKD-Redux.sln /property:Platform=Win32 /property:Configuration="Debug" || goto error
msbuild /m VirtualKD-Redux.sln /property:Platform=x64 /property:Configuration="Debug" || goto error
msbuild /m VirtualKD-Redux.sln /property:Platform=Win32 /property:Configuration="Release" || goto error
msbuild /m VirtualKD-Redux.sln /property:Platform=x64 /property:Configuration="Release" || goto error

goto end
:error
echo Build failed!
pause

:end
call "createbundle.bat"
pause