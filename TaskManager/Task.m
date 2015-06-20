//
//  Task.m
//  HomeworkPlanner
//
//  Created by Mihail Moyseyenko on 11.04.15.
//  Copyright (c) 2015 Mihail Moyseyenko. All rights reserved.
//

#import "Task.h"

@implementation Task

//This function makes us conform to NSCoding and encodes our class members for archive file writing
- (void)encodeWithCoder:(NSCoder *)encoder{
    //Archive each instance varaible using its name
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeInteger:[self.priority integerValue] forKey:@"priority"];
    [encoder encodeObject:self.finalDate forKey:@"dateOfCompletion"];
    [encoder encodeBool:self.completed forKey:@"completed"];
    [encoder encodeObject:self.color forKey:@"color"];
    [encoder encodeInteger:self.colorIndex forKey:@"colorIndex"];
    
    [encoder encodeObject:self.category forKey:@"category"];
}

//This function makes us conform to NSCoding and decodes our class members from archive file reading
- (id)initWithCoder:(NSCoder *)decoder{
    if (self = [super init]) {
        self.title = [decoder decodeObjectForKey:@"title"];
        self.priority = [NSNumber numberWithInteger:[decoder decodeIntegerForKey:@"priority"]];
        self.finalDate = [decoder decodeObjectForKey:@"dateOfCompletion"];
        self.completed = [decoder decodeBoolForKey:@"completed"];
        self.color = [decoder decodeObjectForKey:@"color"];
        self.colorIndex = [decoder decodeIntegerForKey:@"colorIndex"];
        
        self.category = [decoder decodeObjectForKey:@"category"];
    }
    
    return self;
}

@end
