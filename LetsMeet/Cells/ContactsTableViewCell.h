//
//  ContactsTableViewCell.h
//  LetsMeet
//
//  Created by Polaris on 12/8/15.
//  Copyright (c) 2015 Anton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactsTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgUserPhoto;
@property (strong, nonatomic) IBOutlet UILabel *lblUserName;
@property (strong, nonatomic) IBOutlet UILabel *lblConnectState;
@property (strong, nonatomic) IBOutlet UILabel *lblDistance;
@property (strong, nonatomic) IBOutlet UIButton *btnCheck;

@property (nonatomic,assign) NSInteger ncheck;

@end
