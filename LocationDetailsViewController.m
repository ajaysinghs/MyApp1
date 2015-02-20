//
//  LocationDetailsViewController.m
//  MyLocations
//
//  Created by Ajay Singh on 2/19/15.
//  Copyright (c) 2015 Ajay Singh. All rights reserved.
//

#import "LocationDetailsViewController.h"

#import "CategoryPickerViewController.h"

@interface LocationDetailsViewController () <UITextViewDelegate>

@property (nonatomic, weak) IBOutlet UITextView *descriptionTextView;
@property (nonatomic, weak) IBOutlet UILabel *categoryLabel;
@property (nonatomic, weak) IBOutlet UILabel *latitudeLabel;
@property (nonatomic, weak) IBOutlet UILabel *longitudeLabel;
@property (nonatomic, weak) IBOutlet UILabel *addressLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;


@end

@implementation LocationDetailsViewController
{
    NSString *_descriptionText;
    NSString *_categoryName;
}


-(id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        _descriptionText = @"";
        _categoryName = @"No Category";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.descriptionTextView.text = _descriptionText;
    self.categoryLabel.text = _categoryName;
    self.latitudeLabel.text = [NSString stringWithFormat:@"%.8f",self.coordinate.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"%.8f", self.coordinate.longitude];
    
    if (self.placemark != nil) {
        self.addressLabel.text = [self stringFromPlacemark:self.placemark];
    }
    else{
        self.addressLabel.text = @"No Address Found";
    }
    
    self.dateLabel.text = [self formatDate:[NSDate date]];

}




-(NSString *)stringFromPlacemark:(CLPlacemark *)placemark
{
    return [NSString stringWithFormat:@"%@ %@, %@, %@ %@, %@", placemark.subThoroughfare,placemark.thoroughfare, placemark.locality,placemark.administrativeArea, placemark.postalCode, placemark.country];
}

-(NSString *)formatDate:(NSDate *)theDate
{
    static NSDateFormatter *formatter = nil;
    
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
    }
    return [formatter stringFromDate:theDate];
}





-(IBAction)done:(id)sender
{
    NSLog(@"Description '%@'", _descriptionText);
    
    [self closeScreen];
}


-(IBAction)cancel:(id)sender
{
    [self closeScreen];
}


-(void)closeScreen
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickCategory"]) {
        CategoryPickerViewController *controller = segue.destinationViewController;
        
        controller.selectedCategoryName = _categoryName;
    }
}


#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0){
        return 88;
    }
    else if (indexPath.section == 2 && indexPath.row == 2){
        
        CGRect rect = CGRectMake(100, 10, 205, 10000);
        self.addressLabel.frame = rect;
        [self.addressLabel sizeToFit];
        
        rect.size.height = self.addressLabel.frame.size.height;
        self.addressLabel.frame = rect;
        
        return self.addressLabel.frame.size.height + 20;
    }
    else {
        return 44;
    }
}



#pragma mark - UITextViewDelegate

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    _descriptionText = [textView.text stringByReplacingCharactersInRange:range withString:text];

    
    return YES;
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    _descriptionText = textView.text;
}


//For Unwind Segue

-(IBAction)categoryPickerdidPickCategory:(UIStoryboardSegue *)segue
{
    CategoryPickerViewController *viewController = segue.sourceViewController;
    
    _categoryName = viewController.selectedCategoryName;
    self.categoryLabel.text = _categoryName;
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end


























