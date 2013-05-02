//
//  ViewController.h
//  CCJSChartInteract
//
//  Created by iOS7 on 11/20/12.
//  Copyright (c) 2012 Techmaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate, UIAlertViewDelegate>
@property (nonatomic, strong) UIAlertView *alertViewWeb;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)loadChart:(id)sender;

@end
