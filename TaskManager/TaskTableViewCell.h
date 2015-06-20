//
//  TaskTableViewCell.h
//  TaskManager
//
//  Created by Михаил on 04.05.15.
//  Copyright (c) 2015 Mihail Moyseyenko. All rights reserved.
//
// Класс для настройки внешнего вида ячеек таблицы,
// которая отображает список невыполненных заданий (TasksTableViewController)

#import <UIKit/UIKit.h>

@interface TaskTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *stars;

@end
