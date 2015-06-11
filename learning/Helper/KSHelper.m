//
//  KSHelper.m
//  KeyShare
//
//  Created by Singro on 12/5/14.
//  Copyright (c) 2014 Singro. All rights reserved.
//

#import "KSHelper.h"


@implementation KSHelper

#pragma mark - View

+ (CGSize)screenSize {
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}


@end
