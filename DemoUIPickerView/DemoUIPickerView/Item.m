//
//  Item.m
//  DemoUIPickerView
//
//  Created by techmaster on 11/20/12.
//  Copyright (c) 2012 TechMaster. All rights reserved.
//

#import "Item.h"

@implementation Item
- (id) init: (NSInteger) point andPhotoFile: (NSString *) photoFile
{
    if (self = [super init]) {
        _point = point;
        _image = [UIImage imageNamed:photoFile];
    }
    return self;
}
@end
