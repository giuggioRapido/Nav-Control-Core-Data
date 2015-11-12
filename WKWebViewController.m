//
//  WKWebViewController.m
//  NavCtrl
//
//  Created by Chris on 6/30/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import "WKWebViewController.h"

@interface WKWebViewController ()

@end

@implementation WKWebViewController {
    NSURLRequest* urlReq;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WKWebViewConfiguration *theConfiguration =[[WKWebViewConfiguration alloc] init];
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:theConfiguration];
    urlReq = [[NSURLRequest alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    urlReq = [NSURLRequest requestWithURL:self.currentProduct.productURL];
    [self.webView loadRequest:urlReq];
    self.view = self.webView;
}

#pragma mark - WKNavigationDelegate methods
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation: (WKNavigation *)navigation {
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation: (WKNavigation *)navigation{
    
}

-(void)webView:(WKWebView *)webView didFailNavigation: (WKNavigation *)navigation withError:(NSError *)error {
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
