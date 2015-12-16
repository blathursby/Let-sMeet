//
//  Register_VC.m
//  LetsMeet
//
//  Created by Polaris on 12/6/15.
//  Copyright (c) 2015 Anton. All rights reserved.
//

#import "Register_VC.h"

@interface Register_VC () <UITextFieldDelegate, UIScrollViewDelegate>


@property (strong, nonatomic) IBOutlet UIScrollView *scrollContainer;
@property (strong, nonatomic) IBOutlet UITextField *txtUserName;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtConfirmPassword;
@end

@implementation Register_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _scrollContainer.delegate = self;
    _txtUserName.delegate = self;
    _txtPassword.delegate = self;
    _txtConfirmPassword.delegate = self;
    
    [_scrollContainer setContentOffset:CGPointMake(0, 20) animated:NO];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark TextField Delegate

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    int offset;
    offset = 0;
    if ( textField == _txtConfirmPassword ) offset = 60;
    [_scrollContainer setContentOffset:CGPointMake(0, offset) animated:YES];
    
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_scrollContainer setContentOffset:CGPointMake(0, 0) animated:YES];
    [textField resignFirstResponder];
    return YES;
}

@end
