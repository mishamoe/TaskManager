//
//  TaskDetailsTableViewController.h
//  TaskManager
//
//  Created by Mihail Moyseyenko on 25.04.15.
//  Copyright (c) 2015 Mihail Moyseyenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface TaskDetailsTableViewController : UITableViewController
@property Task *item;

@property NSInteger colorIndex;//Index of color in array
@property NSNumber *index;//Index of task in array
@property NSInteger categoryIndex;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UISlider *prioritySlider;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UITableViewCell *backgroundColorCell;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

- (IBAction)unwind:(UIStoryboardSegue *)segue;
- (IBAction)prioritySliderValueChanged:(id)sender;
@end
