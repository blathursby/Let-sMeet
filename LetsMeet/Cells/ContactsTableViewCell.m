//
//  ContactsTableViewCell.m
//  LetsMeet
//
//  Created by Polaris on 12/8/15.
//  Copyright (c) 2015 Anton. All rights reserved.
//

#import "ContactsTableViewCell.h"

@implementation ContactsTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    _imgUserPhoto.layer.cornerRadius = _imgUserPhoto.frame.size.height/2.0f;
    _imgUserPhoto.layer.masksToBounds = YES;
    _imgUserPhoto.layer.borderWidth = 1;
    _imgUserPhoto.layer.borderColor = [[UIColor greenColor] CGColor];

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
    // Configure the view for the selected state
}

@end
