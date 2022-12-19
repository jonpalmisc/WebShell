//
//  WSHMainViewController.h
//  WebShell
//
//  Copyright (c) 2022 Jon Palmisciano. All rights reserved.
//  Licensed under the BSD 3-Clause license; see LICENSE.txt for more info.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WSHMainViewController : NSViewController <WKUIDelegate, WKNavigationDelegate>

@end

NS_ASSUME_NONNULL_END
