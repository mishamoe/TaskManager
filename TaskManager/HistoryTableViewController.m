//
//  HistoryTableViewController.m
//  TaskManager
//
//  Created by Mihail Moyseyenko on 26.04.15.
//  Copyright (c) 2015 Mihail Moyseyenko. All rights reserved.
//

#import "HistoryTableViewController.h"

@interface HistoryTableViewController ()

@end

@implementation HistoryTableViewController

- (void)setTasksFile{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    self.tasksFile = [documentsDirectory stringByAppendingPathComponent:@"tasks.misha"];
}

- (void)setTasks{
    self.tasks = [[NSMutableArray alloc] init];
    self.tasks = [NSKeyedUnarchiver unarchiveObjectWithFile:self.tasksFile];
}

- (void)setCompletedTasks{
    self.completedTasks = [NSMutableArray array];
    for (int i=0; i<[self.tasks count]; i++) {
        Task *oneTask = [self.tasks objectAtIndex:i];
        if (oneTask.completed) {
            NSArray *array = [NSArray arrayWithObjects:[NSNumber numberWithInt:i], oneTask, nil];
            [self.completedTasks addObject:array];
        }
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    [self setTasks];
    [self setCompletedTasks];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTasksFile];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.completedTasks count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HistoryPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Task *oneTask = [[self.completedTasks objectAtIndex:indexPath.row] objectAtIndex:1];
    
    if (oneTask.title.length > 30) {
        cell.textLabel.text = [oneTask.title substringToIndex:30];
    }else{
        cell.textLabel.text = oneTask.title;
    }
    
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *uncompleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Uncomplete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        NSNumber *index = [[self.completedTasks objectAtIndex:indexPath.row] objectAtIndex:0];
        
        [[self.tasks objectAtIndex:[index integerValue]] setCompleted:NO];
        [self setCompletedTasks];
        //Write tasks to file
        [NSKeyedArchiver archiveRootObject:self.tasks toFile:self.tasksFile];
        [self.tableView reloadData];
        
        
        
        UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"Task uncompleted" message:@"Task was successfully uncompleted!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [messageAlert show];
    }];
    uncompleteAction.backgroundColor = [UIColor blueColor];
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete"  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        NSNumber *index = [[self.completedTasks objectAtIndex:indexPath.row] objectAtIndex:0];
        
        [self.tasks removeObjectAtIndex:[index integerValue]];
        [self setCompletedTasks];
        //Write tasks to file
        [NSKeyedArchiver archiveRootObject:self.tasks toFile:self.tasksFile];
        [self.tableView reloadData];
        
        
    }];
    
    return @[deleteAction, uncompleteAction];
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
     
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
