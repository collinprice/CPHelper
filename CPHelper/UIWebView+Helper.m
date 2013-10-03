//
//  UIWebView+Helper.m
//  CPHelper
//
//  Created by Collin on 2013-08-29.
//  Copyright (c) 2013 Collin Price. All rights reserved.
//

#import "UIWebView+Helper.h"
#import "NSString+Helper.h"

@implementation UIWebView (Helper)

+(UIWebView*)fromFile:(NSString*)filename {
    
    int index = [filename lastIndexOf:@"."];
    if (index == -1) {
        return nil;
    }
    
    NSDictionary* fileinfo = [filename fileInfo];
    if (fileinfo) {
        UIWebView* webView = [[UIWebView alloc] init];
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:fileinfo[@"base"] ofType:fileinfo[@"extension"]] isDirectory:NO]]];
        return webView;
    } else {
        return nil;
    }
}

-(void)loadFromFile:(NSString*)filename {
    
    int index = [filename lastIndexOf:@"."];
    if (index == -1) {
        return;
    }
    
    NSDictionary* fileinfo = [filename fileInfo];
    if (fileinfo) {
        [self loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:fileinfo[@"base"] ofType:fileinfo[@"extension"]] isDirectory:NO]]];
    }

}

-(float)contentHeight {
    return [[self stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight;"] floatValue];
}

@end
