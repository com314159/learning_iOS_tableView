//
//  macros.h
//  KeyShare
//
//  Created by Singro on 12/1/14.
//  Copyright (c) 2014 Singro. All rights reserved.
//


#define kScreenHeight ([KSHelper screenSize].height)
#define kScreenWidth ([KSHelper screenSize].width)
#define kScreenSize ([KSHelper screenSize])
#define kScreenBounds ((CGRect){0, 0, kScreenWidth, kScreenHeight})
#define RGBA(c,a)    [UIColor colorWithRed:((c>>16)&0xFF)/256.0  green:((c>>8)&0xFF)/256.0   blue:((c)&0xFF)/256.0   alpha:a]
#define RGB(c,a)    [UIColor colorWithRed:((c>>16)&0xFF)/256.0  green:((c>>8)&0xFF)/256.0   blue:((c)&0xFF)/256.0   alpha:1.0f]
#define ARGB(c)     [UIColor colorWithRed:((c>>24)&0xFF)/256.0  green:((c>>16)&0xFF)/256.0   blue:((c>>8)&0xFF)/256.0   alpha:((c)&0xFF)/256.0]