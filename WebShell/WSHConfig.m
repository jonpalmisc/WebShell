//
//  WSHConfig.m
//  WebShell
//
//  Copyright (c) 2022 Jon Palmisciano. All rights reserved.
//  Licensed under the BSD 3-Clause license; see LICENSE.txt for more info.
//

#import "WSHConfig.h"

// MARK: Config Keys

const NSString* kWSHConfigAppNameKey = @"AppName";
const NSString* kWSHConfigMainHostKey = @"MainHost";
const NSString* kWSHConfigInitialURLKey = @"InitialURL";

// MARK: WSHConfig

@implementation WSHConfig

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString* configPath = [[NSBundle mainBundle] pathForResource:@"Config" ofType:@"plist"];
        NSDictionary* rawConfig = [NSDictionary dictionaryWithContentsOfFile:configPath];

        _appName = [rawConfig objectForKey:kWSHConfigAppNameKey];
        _mainHost = [rawConfig objectForKey:kWSHConfigMainHostKey];
        _initialURL = [rawConfig objectForKey:kWSHConfigInitialURLKey];
    }

    return self;
}

@end
