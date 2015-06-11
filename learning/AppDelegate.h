//
//  AppDelegate.h
//  learning
//
//  Created by gzc on 15/6/11.
//  Copyright (c) 2015年 jiaxue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) ViewController *rootViewController;
@property (nonatomic, strong) UINavigationController *rootNavigationController;

@end

