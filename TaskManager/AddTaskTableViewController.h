//
//  AddTaskTableViewController.h
//  TaskManager
//
//  Created by Mihail Moyseyenko on 25.04.15.
//  Copyright (c) 2015 Mihail Moyseyenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "BackgroundColorTableViewController.h"
#import "CategoryListTableViewController.h"

@interface AddTaskTableViewController : UITableViewController
@property Task *task;
@property NSInteger colorIndex;
@property NSInteger categoryIndex;


@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UISlider *prioritySlider;
- (IBAction)prioritySliderValueChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *backgroundColorCell;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

- (IBAction)unwind:(UIStoryboardSegue *)segue;
@end
