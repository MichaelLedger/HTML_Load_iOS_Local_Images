//
//  ViewController.m
//  Demo
//
//  Created by MountainX on 2019/3/4.
//  Copyright © 2019 MTX Software Technology Co.,Ltd. All rights reserved.
//

#import "ViewController.h"
#import "CustomURLProtocol.h"

@interface ViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    [NSURLProtocol registerClass:[CustomURLProtocol class]];
    NSString *localHtmlFilePath = [[NSBundle mainBundle] pathForResource:@"file" ofType:@"html"];
    NSString *localHtmlFileURL = [NSString stringWithFormat:@"file://%@", localHtmlFilePath];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:localHtmlFileURL]]];
    NSString *html = [NSString stringWithContentsOfFile:localHtmlFilePath encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:html baseURL:nil];
}


@end
