//
//  WFUserBaseViewController.m
//  Woof
//
//  Created by Mac on 1/9/15.
//  Copyright (c) 2015 Silver. All rights reserved.
//

#import "UserBaseViewController.h"
#import "MySidePanelController.h"
@interface UserBaseViewController ()

@end

@implementation UserBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

   
        [self.navigationController popToRootViewControllerAnimated:NO];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) prefersStatusBarHidden {
    return YES;
}

#pragma mark - Nagivate Events
- (void) navToMainView {
    MySidePanelController *panelController = [self.storyboard instantiateViewControllerWithIdentifier:@"sidePanel"];
    [self.navigationController presentViewController:panelController animated:YES completion: nil];
}
- (IBAction)menuBackClicked:(id)sender {
    if(self.isLoadingUserBase) return;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
