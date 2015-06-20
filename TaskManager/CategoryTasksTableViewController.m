//
//  CategoryTasksTableViewController.m
//  TaskManager
//
//  Created by Михаил on 28.05.15.
//  Copyright (c) 2015 Mihail Moyseyenko. All rights reserved.
//

#import "CategoryTasksTableViewController.h"

@interface CategoryTasksTableViewController ()
@property NSMutableArray *categoryTasks;
@end

@implementation CategoryTasksTableViewController

- (void)setUncompletedTasks{
    self.uncompletedTasks = [NSMutableArray array];
    for (int i=0; i<[self.tasks count]; i++) {
        Task *oneTask = [self.tasks objectAtIndex:i];
        if (!oneTask.completed && [oneTask.category isEqualToString:self.category]) {
            NSArray *array = [NSArray arrayWithObjects:[NSNumber numberWithInt:i], oneTask, nil];
            [self.uncompletedTasks addObject:array];
        }
    }
    [self orderTasksByTitle];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.category);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
