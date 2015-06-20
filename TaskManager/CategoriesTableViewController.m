//
//  CategoriesTableViewController.m
//  TaskManager
//
//  Created by Михаил on 26.05.15.
//  Copyright (c) 2015 Mihail Moyseyenko. All rights reserved.
//

#import "CategoriesTableViewController.h"

@interface CategoriesTableViewController ()
@property NSMutableArray *categories;
@property NSString *path;
@end

@implementation CategoriesTableViewController

- (void)setCategoriesFile{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    self.path = [documentsDirectory stringByAppendingPathComponent:@"categories.misha"];
}

- (void)setCategories{
    self.categories = [[NSMutableArray alloc] init];
    self.categories = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
    //Write empty array of tasks to file (if file doesn't exist)
    if (self.categories == nil){
        self.categories = [NSMutableArray array];
        [NSKeyedArchiver archiveRootObject:self.categories toFile:self.path];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCategoriesFile];
    [self setCategories];
    
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
    return [self.categories count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.categories objectAtIndex:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.categories removeObjectAtIndex:indexPath.row];
        //Write tasks to file
        [NSKeyedArchiver archiveRootObject:self.categories toFile:self.path];
        [self.tableView reloadData];
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UINavigationController *navigation = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"showCategoryTasks"]) {
        CategoryTasksTableViewController *destination = (CategoryTasksTableViewController *)navigation.topViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        destination.category = [self.categories objectAtIndex:indexPath.row];
    }
}


- (IBAction)unwind:(UIStoryboardSegue *)segue{
    AddCategoryTableViewController *source = [segue sourceViewController];
    
    NSString *category = source.category;
    if (category != nil) {
        [self.categories addObject:category];

        [self.tableView reloadData];
        //Write tasks to file
        [NSKeyedArchiver archiveRootObject:self.categories toFile:self.path];
    }
}
@end
