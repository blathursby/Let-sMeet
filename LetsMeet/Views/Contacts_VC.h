//
//  Contacts_VC.h
//  LetsMeet
//
//  Created by Polaris on 12/7/15.
//  Copyright © 2015 Anton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface Contacts_VC :BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end
