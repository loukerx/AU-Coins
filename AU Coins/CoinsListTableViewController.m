//
//  CoinsListTableViewController.m
//  AU Coins
//
//  Created by Yin Hua on 15/02/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import "CoinsListTableViewController.h"
#import "AppDelegate.h"
#import "CoinImageViewController.h"
@import CoreData;

@interface CoinsListTableViewController ()
{
      id delegate_;
}

@property (strong) NSString *imageName;
@property (strong) NSMutableArray *images;
@property (strong) NSMutableArray *coins;

@end

@implementation CoinsListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    delegate_ = [[UIApplication sharedApplication] delegate];
    
//    self.coins = [[NSMutableArray alloc]init];
//    self.images  = [[NSMutableArray alloc]init];
//    UIImage *image1 = [UIImage imageNamed:@"20c_1995_unitednations.jpg"];
//    UIImage *image2 = [UIImage imageNamed:@"20c_2001_ACT.jpg"];
//    [self.images addObject:image1];
//    [self.images addObject:image2];
    

    if ([self.barColor isEqualToString:@"Gold"]) {
        [self.navigationController.navigationBar setBarTintColor:[self colorWithHexString:@"FFD700"]];
    }else{
        [self.navigationController.navigationBar setBarTintColor:[self colorWithHexString:@"DBDDDE"]];
    }
    
    // Fetch the devices from persistent data store
//    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Coins"];
//    self.coins = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
//    
//    
    
    
//     [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    
    if ([delegate_ performSelector:@selector(managedObjectContext)]) {
        context = [delegate_ managedObjectContext];
    }
    return context;
}




 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {


     CoinImageViewController *civc = [segue destinationViewController];
     
     UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:self.tableView.indexPathForSelectedRow];
     civc.coinImage = cell.imageView.image;
     
    
 }


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:@"To Image View" sender:self];
}


#pragma mark - Table view data source
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 60;
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    // Return the number of rows in the section.
//    return [self.coins count];
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
////    cell.imageView.image = self.images[indexPath.row];
////    cell.textLabel.text = @"1989";
////    cell.detailTextLabel.text = @"this is a test description.";
////    cell.accessoryView.backgroundColor = [UIColor greenColor];
//
//    NSManagedObject *coin = [self.coins objectAtIndex:indexPath.row];
////    [cell.textLabel setText:[NSString stringWithFormat:@"%@ %@", [device valueForKey:@"name"], [device valueForKey:@"version"]]];
////    [cell.detailTextLabel setText:[device valueForKey:@"company"]];
//    
//    [cell.imageView setImage:[coin valueForKey:@"coinImage"]];
//    [cell.textLabel setText:[coin valueForKey:@"coinYear"]];
//    [cell.detailTextLabel setText:[coin valueForKey:@"coinDescription"]];
////    cell.accessoryView.backgroundColor = [UIColor greenColor];
//    
//    
//    
//    return cell;
//}



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



#pragma color
-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}



@end
