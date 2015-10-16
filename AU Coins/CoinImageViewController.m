//
//  CoinImageViewController.m
//  AU Coins
//
//  Created by Yin Hua on 7/03/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import "CoinImageViewController.h"

@interface CoinImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CoinImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imageView.image = self.coinImage;
//    self.imageView.image = [UIImage imageNamed:self.imageName];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
