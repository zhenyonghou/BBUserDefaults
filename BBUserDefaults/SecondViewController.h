//
//  SecondViewController.h
//  BBUserDefaults
//
//  Created by mumuhou on 15/8/1.
//  Copyright (c) 2015年 mumuhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondViewControllerDelegate;

@interface SecondViewController : UITableViewController

@property (nonatomic, weak) id<SecondViewControllerDelegate> delegate;

@end


@protocol SecondViewControllerDelegate <NSObject>

- (void)secondViewController:(SecondViewController *)viewController didSelectUserId:(NSNumber *)userId;

@end
