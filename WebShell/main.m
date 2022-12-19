//
//  main.m
//  WebShell
//
//  Copyright (c) 2022 Jon Palmisciano. All rights reserved.
//  Licensed under the BSD 3-Clause license; see LICENSE.txt for more info.
//

#import <Cocoa/Cocoa.h>

#import "WSHAppDelegate.h"

int main(int argc, const char* argv[])
{
    @autoreleasepool {
        NSApplication* app = [NSApplication sharedApplication];
        [[NSBundle mainBundle] loadNibNamed:@"MainMenu" owner:app topLevelObjects:nil];

        WSHAppDelegate* appDelegate = [[WSHAppDelegate alloc] init];
        [app setDelegate:appDelegate];
        [app run];
    }

    return EXIT_SUCCESS;
}
