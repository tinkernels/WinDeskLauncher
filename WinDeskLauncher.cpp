// WinDeskLauncher.cpp : Defines the entry point for the application.
//

#include "framework.h"
#include "WinDeskLauncher.h"

#include <shellapi.h>

int APIENTRY wWinMain(
        _In_ HINSTANCE hInstance,
        _In_opt_ HINSTANCE hPrevInstance,
        _In_ LPWSTR    lpCmdLine,
        _In_ int       nCmdShow)
{
    UNREFERENCED_PARAMETER(hInstance);
    UNREFERENCED_PARAMETER(hPrevInstance);
    UNREFERENCED_PARAMETER(nCmdShow);

    int exeArgc=0;

    auto exeArgv = CommandLineToArgvW(lpCmdLine, &exeArgc);
    if (NULL == exeArgv || exeArgc == 1)
    {

    }
    else for (int i = 0; i < exeArgc; i++) {
        // Retrive parameters.
        
    }
    return 0;
}