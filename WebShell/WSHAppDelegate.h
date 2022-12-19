//
//  WSAppDelegate.h
//  WebShell
//
//  Copyright (c) 2022 Jon Palmisciano. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "WSHMainViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WSHAppDelegate : NSResponder <NSApplicationDelegate>

@property (strong) NSWindow* mainWindow;
@property (strong) WSHMainViewController* mainViewController;

@end

NS_ASSUME_NONNULL_END
