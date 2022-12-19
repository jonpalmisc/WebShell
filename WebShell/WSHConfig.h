//
//  WSHConfig.h
//  WebShell
//
//  Copyright (c) 2022 Jon Palmisciano. All rights reserved.
//  Licensed under the BSD 3-Clause license; see LICENSE.txt for more info.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * Configuration describing the wrapped website.
 */
@interface WSHConfig : NSObject

/**
 * Name of the wrapped website to use in window titles, menus, etc.
 */
@property (strong) NSString* appName;

/**
 * Main host name for the wrapped website.
 *
 * Attempts to navigate to URLs under this host will be honored; any other URLs
 * will be opened in the default browser.
 */
@property (strong) NSString* mainHost;

/**
 * URL to navigate to on startup.
 */
@property (strong) NSString* initialURL;

@end

NS_ASSUME_NONNULL_END
