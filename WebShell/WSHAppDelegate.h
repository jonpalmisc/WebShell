//
//  WSAppDelegate.h
//  WebShell
//
//  Copyright (c) 2022 Jon Palmisciano. All rights reserved.
//  Licensed under the BSD 3-Clause license; see LICENSE.txt for more info.
//

#import <Cocoa/Cocoa.h>

#import "WSHMainViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WSHAppDelegate : NSResponder <NSApplicationDelegate>

@property (strong) NSWindow* mainWindow;
@property (strong) WSHMainViewController* mainViewController;

@end

NS_ASSUME_NONNULL_END
