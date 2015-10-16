//
//  MyData.m
//  AU Coins
//
//  Created by Yin Hua on 1/03/2015.
//  Copyright (c) 2015 Yin Hua. All rights reserved.
//

#import "MyData.h"
#import "AppDelegate.h"
@import CoreData;



@interface MyData()
{
    id delegate_;
}

@end

@implementation MyData

- (void)initialClass{
    
    delegate_ = [[UIApplication sharedApplication] delegate];
    [self populateData];
}



-(void)populateData
{
    //populate one dollars
    int year = 1984;
  
//    NSString *coinID = [NSString stringWithFormat:@"onedollar_%d", year];
    NSString *country = @"Australia";
    NSString *cointype = @"One Dollar";
    NSString *production =@"186.3 million";
    UIImage *image = [UIImage imageNamed:@"onedollar_1984-1985.jpg"];
    int status = 0;
    NSString *coinDescription = @"Five kangaroos designed and sculpted by Stuart Devlin.";
    
    
    
    
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newCoin = [NSEntityDescription insertNewObjectForEntityForName:@"Coins" inManagedObjectContext:context];
    
    NSNumber *coinYear = [NSNumber numberWithInt:year];
    [newCoin setValue:coinYear forKey:@"coinYear"];
    [newCoin setValue:country forKey:@"country"];
    [newCoin setValue:cointype forKey:@"cointype"];
    [newCoin setValue:production forKey:@"production"];
    NSData *coinImage = UIImageJPEGRepresentation(image, 0.0);
    [newCoin setValue:coinImage forKey:@"coinImage"];
    NSNumber *coinStatus = [NSNumber numberWithInt:status];
    [newCoin setValue:coinStatus forKey:@"coinStatus"];
    [newCoin setValue:coinDescription forKey:@"coinDescription"];


    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }

}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;

    if ([delegate_ performSelector:@selector(managedObjectContext)]) {
        context = [delegate_ managedObjectContext];
    }
    return context;
}

@end
