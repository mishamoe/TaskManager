//
//  Task.h
//  HomeworkPlanner
//
//  Created by Mihail Moyseyenko on 11.04.15.
//  Copyright (c) 2015 Mihail Moyseyenko. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Task : NSObject <NSCoding>

@property NSString *title;
@property NSNumber *priority;
@property NSDate *finalDate;
@property BOOL completed;
@property UIColor *color;
@property NSInteger colorIndex;

@property NSString *category;
@end
