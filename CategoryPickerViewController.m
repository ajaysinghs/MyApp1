//
//  CategoryPickerViewController.m
//  MyLocations
//
//  Created by Ajay Singh on 2/20/15.
//  Copyright (c) 2015 Ajay Singh. All rights reserved.
//

#import "CategoryPickerViewController.h"

@interface CategoryPickerViewController ()

@end

@implementation CategoryPickerViewController


{
    NSArray *_categories;
    NSIndexPath *_selectedIndexPath;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    _categories = @[@"No Category", @"Apple Store", @"Bar", @"Bookstore", @"Club", @"Grocery Store", @"Historic Building", @"House", @"Icecream Vendor", @"Landmark", @"Park"];
 
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [_categories count];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    NSString *categoryName = _categories[indexPath.row];
    cell.textLabel.text = categoryName;
    
    if ([categoryName isEqualToString:self.selectedCategoryName]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        _selectedIndexPath = indexPath;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}



#pragma mark - UITableviewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != _selectedIndexPath.row) {
        
        UITableViewCell *newcell = [tableView cellForRowAtIndexPath:indexPath];
        newcell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:_selectedIndexPath];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        
        _selectedIndexPath = indexPath;
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickedCategory"]) {
        
        UITableViewCell *cell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        self.selectedCategoryName = _categories[indexPath.row];
    }
}


@end























