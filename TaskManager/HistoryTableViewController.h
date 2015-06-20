//
//  HistoryTableViewController.h
//  TaskManager
//
//  Created by Mihail Moyseyenko on 26.04.15.
//  Copyright (c) 2015 Mihail Moyseyenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface HistoryTableViewController : UITableViewController
@property NSString *tasksFile;
@property NSMutableArray *tasks;
@property NSMutableArray *completedTasks;

- (void)setTasksFile;
- (void)setTasks;
- (void)setCompletedTasks;
@end
