//
//  Item.h
//  DemoUIPickerView
//
//  Created by techmaster on 11/20/12.
//  Copyright (c) 2012 TechMaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property (nonatomic, assign) NSInteger point;
@property (nonatomic, strong) UIImage *image;
- (id) init: (NSInteger) point andPhotoFile: (NSString *) photoFile;

@end
