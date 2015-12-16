//
//  LeftPanelViewController.m
//  DomumLink
//
//  Created by AnMac on 1/15/15.
//  Copyright (c) 2015 Petr. All rights reserved.
//

#import "LeftPanelViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "MySidePanelController.h"

@interface LeftPanelViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UISwitch *swtStatus;
@property (strong, nonatomic) IBOutlet UISwitch *swtWalk;
@property (strong, nonatomic) IBOutlet UISwitch *swtRun;
@property (strong, nonatomic) IBOutlet UISwitch *swtBike;

@property (strong, nonatomic) IBOutlet UITextField *txtStatus;
@property (strong, nonatomic) IBOutlet UILabel *lblStatus;

@end

@implementation LeftPanelViewController{
    int nStatusSwt;
    int nVehicle;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    self.sidePanelController.slideDelegate = self;
    
    [self initView];
    
    _swtStatus.backgroundColor = [UIColor whiteColor];
    _swtStatus.layer.cornerRadius = 16.0;
    
    _swtWalk.backgroundColor = [UIColor whiteColor];
    _swtWalk.layer.cornerRadius = 16.0;
    
    _swtRun.backgroundColor = [UIColor whiteColor];
    _swtRun.layer.cornerRadius = 16.0;
    
    _swtBike.backgroundColor = [UIColor whiteColor];
    _swtBike.layer.cornerRadius = 16.0;
    
    nStatusSwt = 0;
    nVehicle= 0;
    
    _lblStatus.hidden = true;
    _txtStatus.hidden = false;
    
    [_swtWalk setOn:YES];
    [_swtRun setOn:NO];
    [_swtBike setOn:NO];
    
    _txtStatus.delegate = self;
}

- (void)initView {

    //[commonUtils setWFUserPhoto:self.userPhotoImageView byPhotoUrl:[appController.currentUser objectForKey:@"user_photo_url"]];
    
    //[self.userNameLabel setText:[appController.currentUser objectForKey:@"user_name"]];
}

//- (void)viewDidLayoutSubviews {
//    
//    CGRect containerFrame = self.containerView.frame;
//    containerFrame.size.width = self.sidePanelController.leftVisibleWidth;
//    [self.containerView setFrame:containerFrame];
//    
//    CGRect topFrame = self.topView.frame;
//    [self.topView setFrame:CGRectMake(0, 0, containerFrame.size.width, topFrame.size.height)];
//    
//    [self.menuTableView setFrame: CGRectMake(0, self.topView.frame.size.height, containerFrame.size.width, self.menuTableView.rowHeight * [menuPages count])];
//}
- (IBAction)onStateSwt:(id)sender {
    
    if (nStatusSwt == 1) {
        _txtStatus.hidden = false;
        _lblStatus.hidden = true;
    } else {
        _txtStatus.hidden = true;
        _lblStatus.hidden = false;

    }
    nStatusSwt = 1 - nStatusSwt;
    [_txtStatus resignFirstResponder];
}

- (IBAction)onWalkSwt:(id)sender {
    
    nVehicle = 0;
    [_swtWalk setOn:YES];
    [_swtRun setOn:NO];
    [_swtBike setOn:NO];
}
- (IBAction)onRunSwt:(id)sender {
    nVehicle = 1;
    [_swtWalk setOn:NO];
    [_swtRun setOn:YES];
    [_swtBike setOn:NO];
}

- (IBAction)onBikeSwt:(id)sender {
    nVehicle = 2;
    [_swtWalk setOn:NO];
    [_swtRun setOn:NO];
    [_swtBike setOn:YES];
}

#pragma mark -  Left Side Menu Show

- (void)onMenuShow {

}
- (void)onMenuHide {

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


@end

