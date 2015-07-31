//
//  ModalViewController.h
//  32 -- CoreList -- John Holsapple
//
//  Created by John Holsapple on 7/29/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreListTableViewController.h"

@interface ModalViewController : UIViewController

@property (strong, nonatomic) id<ModalViewControllerDelegate> delegate;

@end
