//
//  TasksTableViewController.h
//  TaskManager
//
//  Created by Mihail Moyseyenko on 25.04.15.
//  Copyright (c) 2015 Mihail Moyseyenko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Task.h"
#import "AddTaskTableViewController.h"
#import "TaskDetailsTableViewController.h"
#import "TaskTableViewCell.h"

@interface TasksTableViewController : UITableViewController

@property NSString *tasksFile;
@property NSMutableArray *tasks;
@property NSMutableArray *uncompletedTasks;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

- (IBAction)unwindToListAfterAdding:(UIStoryboardSegue *)segue;
- (IBAction)unwindToListAfterEditing:(UIStoryboardSegue *)segue;
- (IBAction)segmentedControlValueChanged:(id)sender;

- (void)setTasksFile;
- (void)setTasks;
- (void)setUncompletedTasks;
- (void)orderTasksByTitle;
- (void)orderTasksByPriority;
- (void)orderTasksByDate;
@end
