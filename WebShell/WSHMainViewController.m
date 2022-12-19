//
//  WSHMainViewController.m
//  WebShell
//
//  Copyright (c) 2022 Jon Palmisciano. All rights reserved.
//  Licensed under the BSD 3-Clause license; see LICENSE.txt for more info.
//

#import "WSHMainViewController.h"

#import "WSHConfig.h"

#import <AVFoundation/AVFoundation.h>

/**
 * User agent string from Safari 16.2 on macOS 13.1.
 */
NSString* const kSafariUserAgent = @"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.2 Safari/605.1.15";

@interface WSHMainViewController ()

@property (strong) WSHConfig* config;

@property (strong) WKWebView* webView;

/**
 * Open a URL in the default web browser. Only supports HTTP and HTTPS schemes.
 *
 * @param url URL to open
 */
- (void)openURL:(NSURL*)url;

@end

@implementation WSHMainViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _config = [[WSHConfig alloc] init];
    }

    return self;
}

- (void)openURL:(NSURL*)url
{
    if ([url.scheme isEqualToString:@"http"] || [url.scheme isEqualToString:@"https"])
        [[NSWorkspace sharedWorkspace] openURL:url];
}

// MARK: NSViewController

- (void)loadView
{
    self.view = [[NSView alloc] init];
    self.title = _config.appName;

    _webView = [[WKWebView alloc] init];
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    _webView.customUserAgent = kSafariUserAgent;
    _webView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_webView];

    [NSLayoutConstraint activateConstraints:@[
        [self.view.widthAnchor constraintGreaterThanOrEqualToConstant:1024],
        [self.view.heightAnchor constraintGreaterThanOrEqualToConstant:768],

        [_webView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [_webView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [_webView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [_webView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
    ]];
}

- (void)viewDidAppear
{
    NSURL* initialURL = [NSURL URLWithString:_config.initialURL];
    NSURLRequest* initialRequest = [NSURLRequest requestWithURL:initialURL];

    [_webView loadRequest:initialRequest];

    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {}];
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {}];
}

// MARK: WKNavigationDelegate

- (void)webView:(WKWebView*)webView decidePolicyForNavigationAction:(WKNavigationAction*)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSURL* url = navigationAction.request.URL;
    if (!url)
        goto cancel;

    if (navigationAction.navigationType == WKNavigationTypeLinkActivated) {
        [self openURL:url];
    } else {
        if (url.host && url.host == _config.mainHost) {
            decisionHandler(WKNavigationActionPolicyAllow);
            return;
        }
    }

cancel:
    decisionHandler(WKNavigationActionPolicyCancel);
}

// MARK: WKUIDelegate

- (WKWebView*)webView:(WKWebView*)webView createWebViewWithConfiguration:(WKWebViewConfiguration*)configuration forNavigationAction:(WKNavigationAction*)navigationAction windowFeatures:(WKWindowFeatures*)windowFeatures
{
    if (navigationAction.request.URL)
        [self openURL:navigationAction.request.URL];

    return nil;
}

@end
