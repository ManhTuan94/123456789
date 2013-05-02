//
//  ViewController.m
//  DemoUIPickerView
//
//  Created by techmaster on 11/20/12.
//  Copyright (c) 2012 TechMaster. All rights reserved.
//

#import "ViewController.h"
#import "Item.h"
@interface ViewController ()
{
    NSArray *_array;
    NSInteger _totalRows;
    NSInteger _totalItems;
    NSInteger _numberOfRandom;
    NSInteger _currentRandom;
    NSTimer * _timer;
}
@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _array = @[
            [[Item alloc] init:1 andPhotoFile:@"ballfish.png"],
            [[Item alloc] init:6 andPhotoFile:@"crab.png"],
            [[Item alloc] init:5 andPhotoFile:@"gold_fish.png"],
            [[Item alloc] init:3 andPhotoFile:@"nemo.png"],
            [[Item alloc] init:7 andPhotoFile:@"shark.png"],
            [[Item alloc] init:2 andPhotoFile:@"shrimp.png"],
            [[Item alloc] init:9 andPhotoFile:@"seahorse.png"],
            [[Item alloc] init:4 andPhotoFile:@"nemo2.png"],
            [[Item alloc] init:8 andPhotoFile:@"star.png"]
        ];
        _totalItems = [_array count];
        _totalRows = _totalItems * 100;
        _numberOfRandom = 3;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.pickerView setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPickerViewDataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _totalRows;
}


#pragma mark - UIPickerViewDelegate
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 70;
}
- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view
{
    UIImageView *imageView = view ? (UIImageView *) view : [[UIImageView alloc] initWithFrame:CGRectMake(3.0f, 3.0f, 64.0f, 64.0f)];
	Item *item = (Item *) [_array objectAtIndex:row % _totalItems];
	imageView.image = item.image;
    [imageView setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
	return imageView;    
}

  

- (IBAction)playGame:(id)sender {
    _currentRandom = 0;

    _timer = [NSTimer scheduledTimerWithTimeInterval:0.4
                                     target:self
                                   selector:@selector(randomRows)
                                   userInfo:nil
                                    repeats:YES];
    
  
}

- (void) randomRows
{
    
    [self.pickerView selectRow:(arc4random() % _totalRows) inComponent:0 animated:YES];
    [self.pickerView selectRow:(arc4random() % _totalRows) inComponent:1 animated:YES];
    [self.pickerView selectRow:(arc4random() % _totalRows) inComponent:2 animated:YES];
    _currentRandom ++;
    if (_currentRandom > _numberOfRandom)
    {
        [_timer invalidate];
    }

 /*   [UIView animateWithDuration:2.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         // the animation code
                         _currentRandom ++;
                         [self.pickerView selectRow:(arc4random() % _totalRows) inComponent:0 animated:YES];
                         [self.pickerView selectRow:(arc4random() % _totalRows) inComponent:1 animated:YES];
                         [self.pickerView selectRow:(arc4random() % _totalRows) inComponent:2 animated:YES];

                     }
                     completion:^(BOOL finished) {
                         if (_currentRandom > _numberOfRandom) {
                           //  finished = TRUE;
                         }
                         [self randomRows];
                     }
    ];*/
    
}

@end
