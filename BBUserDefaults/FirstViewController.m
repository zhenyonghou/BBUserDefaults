//
//  FirstViewController.m
//  BBUserDefaults
//
//  Created by mumuhou on 15/8/1.
//  Copyright (c) 2015年 mumuhou. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "BBUserDefaults.h"

@interface FirstViewController () <SecondViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableViewCell *userIdCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *userNameCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *userAgeCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *userInfoCell;
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userIdCell.textLabel.text = @"请选择用户";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"a2b"]) {
        SecondViewController *vc = segue.destinationViewController;
        vc.delegate = self;
    }
}

- (void)secondViewController:(SecondViewController *)viewController didSelectUserId:(NSNumber *)userId
{
    [[BBUserDefaults sharedInstance] setUserId:userId];
    
    self.userIdCell.textLabel.text = [NSString stringWithFormat:@"%@", [BBUserDefaults sharedInstance].userId];
    
    self.userNameTextField.text = [[BBUserDefaults sharedInstance] objectForKey:@"name"];
    
    NSInteger age = [[BBUserDefaults sharedInstance] integerForKey:@"age"];
    self.userAgeCell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)age];
    
    self.userInfoCell.textLabel.text = [[BBUserDefaults sharedInstance] objectForKey:@"info"];
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self performSegueWithIdentifier:@"a2b" sender:self];
        }
    }
}


#pragma mark- UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.text.length == 0) {
        return NO;
    }
    
    [[BBUserDefaults sharedInstance] setObject:textField.text forKey:@"name"];
    
    [[BBUserDefaults sharedInstance] synchronize];
    
    [textField resignFirstResponder];
    
    return YES;
}



//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
