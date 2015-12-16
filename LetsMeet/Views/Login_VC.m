//
//  ViewController.m
//  LetsMeet
//
//  Created by Polaris on 12/5/15.
//  Copyright (c) 2015 Anton. All rights reserved.
//

#import "Login_VC.h"

@interface Login_VC () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIButton *cmdRemember;
@property (strong, nonatomic) IBOutlet UITextField *txtUserName;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;

@end

@implementation Login_VC{
    int checkstate;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    checkstate = 0;
    _txtUserName.delegate = self;
    _txtPassword.delegate = self;    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onRememberChk:(id)sender {
    
    if ( checkstate == 0 ) {
        UIImage *btnImage = [UIImage imageNamed:@"check.png"];
        [_cmdRemember setBackgroundColor:[UIColor blackColor]];
        [_cmdRemember setImage:btnImage forState:UIControlStateNormal];
    } else {
        [_cmdRemember setImage:nil forState:UIControlStateNormal];
    }
    checkstate = 1 - checkstate;
}

#pragma mark -- Textfield Delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

@end
