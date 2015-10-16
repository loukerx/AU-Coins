//
//  MyCollectionTableViewController.m
//  AU Coins
//
//  Created by Yin Hua on 15/02/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import "MyCollectionTableViewController.h"
#import "AppDelegate.h"
#import "CoinsListTableViewController.h"
#import "MenuViewController.h"



@import CoreData;

@interface MyCollectionTableViewController ()


@end

@implementation MyCollectionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

}




-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBarTintColor:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source




 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
     CoinsListTableViewController *cltvc = [segue destinationViewController];
     //how to transfer the value;???????
     switch (self.tableView.indexPathForSelectedRow.row) {
         case 0:
             cltvc.barColor = @"Gold";
             break;
         case 1:
             cltvc.barColor = @"Gold";
             break;
         case 2:
             cltvc.barColor = @"Silver";
             break;
         case 3:
             cltvc.barColor = @"Silver";
             break;
         default:
             break;
     }
 }






@end
