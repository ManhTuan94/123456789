//
//  ViewController.m
//  CCJSChartInteract
//
//  Created by iOS7 on 11/20/12.
//  Copyright (c) 2012 Techmaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self loadChart];

    }

-(void)viewWillAppear:(BOOL)animated
{
}
-(void) loadChart
{
    NSString *pathname = [[NSBundle mainBundle]  pathForResource:@"index" ofType:@"htm" inDirectory:@"/"];
    
    NSString *htmlString = [NSString stringWithContentsOfFile:pathname encoding:NSUTF8StringEncoding error:nil];
    
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    
    [self.webView loadHTMLString:htmlString baseURL:baseURL];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self loadMyChart];
}

- (IBAction)loadChart:(id)sender {
    [self loadMyChart];
   }

-(void) loadMyChart
{
    NSArray *array = [NSArray arrayWithObjects: @"2.4", @"3.4", @"4.3", @"5", @"5.6", @"6", @"6.4", @"6.8", @"7", @"7.2", @"7.4", @"7.6",@"7.8",@"8.0",@"8.1", @"8.2", @"8.3", @"8.4", @"8.5",@"8.6", @"8.7", @"8.8", @"8.9",@"9.0",@"9.1", nil];
    NSString *myString1 = [array componentsJoinedByString:@","];
    
    array=[NSArray arrayWithObjects:@"4.5", @"5.9", @"7.1", @"8", @"8.9", @"9.3", @"10", @"10.3", @"10.9", @"11.2", @"11.8", @"12",@"12.2",@"12.4",@"12.6", @"12.8", @"13", @"13.2", @"13.4",@"13.6", @"13.8", @"14", @"14.2",@"14.4",@"14.6",nil];
    NSString *myString2 = [array componentsJoinedByString:@","];


    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    int  mark=1;
    if(orientation== UIDeviceOrientationLandscapeLeft||orientation== UIDeviceOrientationLandscapeRight)
    {
        mark=0;    }
    
    
    [self.webView stringByEvaluatingJavaScriptFromString: [NSString stringWithFormat:@"creatChart([%@],[%@],%d)",myString1,myString2,mark]];

}

@end
