//
//  WKWebViewController.h
//  NavCtrl
//
//  Created by Chris on 6/30/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "NSObjectProduct.h"

@interface WKWebViewController : UIViewController <WKNavigationDelegate>
@property (nonatomic, retain) WKWebView *webView;
@property (nonatomic, retain) NSObjectProduct *currentProduct;

@end
