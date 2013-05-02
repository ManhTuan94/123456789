//
//  ViewController.h
//  DemoUIPickerView
//
//  Created by techmaster on 11/20/12.
//  Copyright (c) 2012 TechMaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end
