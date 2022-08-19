//
//  extraHeaders.c
//  
//  This is a shim to bring make the physac.h header implementation available to the swift projects. Although that header is part of the
//  Stregasgate raylib project, the header file in this module can navigate to the path of that header file (as long as the Raylib package is
//  listed as a dependency of this module in the Package.swift file.
//
//  Created by Adam Mitchell on 6/14/22.
//
#ifndef PHYSAC_IMPLEMENTATION
#define PHYSAC_IMPLEMENTATION
#endif

#ifndef RAYGUI_IMPLEMENTATION
#define RAYGUI_IMPLEMENTATION
#endif

//#ifndef RAYGUI_CUSTOM_RICONS
//#define RAYGUI_CUSTOM_RICONS
//#endif

//#ifndef RAYGUI_NO_RICONS
//#define RAYGUI_NO_RICONS
//#endif

//#ifndef RAYGUI_STANDALONE
//#define RAYGUI_STANDALONE
//#endif

#include "extraHeaders.h"
#include "rguiShim.h"

typedef enum {
    VAL3 = 16,
    VAL2,
    VAL1,
} SpecialEnum;
