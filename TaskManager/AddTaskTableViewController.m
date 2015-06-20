//
//  AddTaskTableViewController.m
//  TaskManager
//
//  Created by Mihail Moyseyenko on 25.04.15.
//  Copyright (c) 2015 Mihail Moyseyenko. All rights reserved.
//

#import "AddTaskTableViewController.h"

@interface AddTaskTableViewController ()

@end

@implementation AddTaskTableViewController

- (IBAction)unwind:(UIStoryboardSegue *)segue{
    if ([[segue sourceViewController] isKindOfClass:[BackgroundColorTableViewController class]]) {
        BackgroundColorTableViewController *source = [segue sourceViewController];
        self.backgroundColorCell.backgroundColor = [source.colors objectAtIndex:source.colorIndex];
        
        self.colorIndex = source.colorIndex;
    }else if([[segue sourceViewController] isKindOfClass:[CategoryListTableViewController class]]){
        CategoryListTableViewController *source = [segue sourceViewController];
        self.categoryIndex = source.categoryIndex;
        self.categoryLabel.text = source.selectedCategory;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colorIndex = 0;
    self.categoryIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 0;
}
*/
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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


#pragma mark - Navigation
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if (sender == self.saveButton){
        if(self.titleTextField.text.length == 0){
            UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Task's title can't be empty!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [messageAlert show];
            return NO;
        }else if ([self.categoryLabel.text isEqual:@"Select category"] || self.categoryLabel.text.length == 0){
            UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You must select task's category from existing or create a new!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [messageAlert show];
            return NO;
        }
    }
    return YES;
}
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if (sender == self.saveButton && self.titleTextField.text.length > 0) {
        self.task = [[Task alloc] init];
        self.task.title = self.titleTextField.text;
        self.task.category = self.categoryLabel.text;
        self.task.priority = [NSNumber numberWithFloat:self.prioritySlider.value];
        self.task.finalDate = self.datePicker.date;
        self.task.completed = NO;
        self.task.color = self.backgroundColorCell.backgroundColor;
        self.task.colorIndex = self.colorIndex;
    }else self.task = nil;
    
    UINavigationController *navigation = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"showBackgroundColours"]) {
        BackgroundColorTableViewController *destination = (BackgroundColorTableViewController *)navigation.topViewController;
        
        destination.colorIndex = self.colorIndex;
    }else if([segue.identifier isEqualToString:@"showCategoriyList"]){
        CategoryListTableViewController *destination = (CategoryListTableViewController *)navigation.topViewController;
        
        destination.categoryIndex = self.categoryIndex;
        destination.selectedCategory = self.categoryLabel.text;
    }
    
}

- (IBAction)prioritySliderValueChanged:(id)sender {
    self.prioritySlider.value = round(self.prioritySlider.value);
    NSNumber *priority = [NSNumber numberWithFloat:[self.prioritySlider value]];
    self.priorityLabel.text = [priority stringValue];
}
@end
