//
//  WFBaseViewController.h
//  Woof
//
//  Created by Mac on 1/9/15.
//  Copyright (c) 2015 Silver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
@interface BaseViewController : UIViewController

@property (nonatomic, assign) BOOL isLoadingBase;

@property (nonatomic, strong) IBOutlet UIView *topNavBarView, *containerView;
@property (nonatomic, strong) IBOutlet UILabel *topNavBarLabel;

- (IBAction)menuClicked:(id)sender;
- (IBAction)menuBackClicked:(id)sender;

@end
