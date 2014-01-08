//
//  MBVerticalSegmentedViewController.m
//  SkinnedSegmentedControl
//
//  Created by Rob on 05/01/2014.
//  Copyright (c) 2014 Rob Nadin. All rights reserved.
//

#import "MBVerticalSegmentedViewController.h"

@interface MBVerticalSegmentedViewController ()

@end

@implementation MBVerticalSegmentedViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

#pragma mark - Table view data source

/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}
*/

/*
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}
*/

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    
    if (cell.selectedBackgroundView) {
        UIImageView *selectedBackgroundView;
        
        if (indexPath.row == 0) {
            // Top cell
            selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"verticalTop"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 4, -1, 4)]];
        } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
            // Bottom cell
            selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"verticalBottom"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 4, -1, 4)]];
        } else {
            // Middle cell
            selectedBackgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"verticalMiddle"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 1, -1, 1)]];
        }
        
        // Set selected background view
        cell.selectedBackgroundView = selectedBackgroundView;
    }

    if (!cell.backgroundView) {
        UIImageView *backgroundView;
        
        if ([tableView numberOfRowsInSection:indexPath.section] == 1) {
            // Single cell
//            backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"group_cell_background_single.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 8, 0, 8)]];
        } else if (indexPath.row == 0) {
            // Top cell
            backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"verticalBackgroundTop"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)]];
        } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
            // Bottom cell
            backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"verticalBackgroundBottom"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)]];
        } else {
            // Middle cell
            backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"verticalBackgroundMiddle"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)]];
        }
        
        // Set text label background colours
        cell.textLabel.backgroundColor = [UIColor clearColor];
        
        // Set background view
        cell.backgroundView = backgroundView;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    // Fix bug in iOS 7
//    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
//        cell.selectedBackgroundView.frame = cell.bounds;
//        [cell.layer setNeedsDisplay];
//        [cell.layer displayIfNeeded];
//    }
    
    cell.textLabel.textColor = [UIColor whiteColor];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor colorWithWhite:.6f alpha:1.f];
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self tableView:tableView didSelectRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![tableView cellForRowAtIndexPath:indexPath].isSelected)
        [self tableView:tableView didDeselectRowAtIndexPath:indexPath];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
