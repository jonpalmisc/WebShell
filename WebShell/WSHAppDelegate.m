//
//  WSAppDelegate.m
//  WebShell
//
//  Copyright (c) 2022 Jon Palmisciano. All rights reserved.
//

#import "WSHAppDelegate.h"

@implementation WSHAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification*)notification
{
    _mainViewController = [[WSHMainViewController alloc] init];
    _mainWindow = [NSWindow windowWithContentViewController:_mainViewController];

    [_mainWindow makeKeyAndOrderFront:self];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication*)sender
{
    return YES;
}

@end
