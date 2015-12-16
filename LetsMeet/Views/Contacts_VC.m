//
//  Contacts_VC.m
//  LetsMeet
//
//  Created by Polaris on 12/7/15.
//  Copyright © 2015 Anton. All rights reserved.
//

#import "Contacts_VC.h"
#import "ContactsTableViewCell.h"
#import "VSDropdown.h"

@interface Contacts_VC () <VSDropdownDelegate>{
    VSDropdown *dropdown;
    NSMutableArray *dropdownMenu;
    NSMutableArray *navigation;
}

@property (strong, nonatomic) IBOutlet UIButton *btnMakeGroup;
@property (strong, nonatomic) IBOutlet UIButton *btnMap;
@property (strong, nonatomic) IBOutlet UIButton *btnInviteFriend;


@end

@implementation Contacts_VC{
    
    NSArray *userphoto;
    NSArray *userName;
    NSArray *userConnectState;
    NSArray *userDistance;
    
    NSInteger ischeck;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    userphoto = [NSArray arrayWithObjects:@"boy1.png", @"girl1.png", @"boy2.png", @"girl2.png", @"boy3.png", @"girl3.png", nil];
    userName = [NSArray arrayWithObjects:@"Mateusz", @"Karolina", @"Micha", @"Natalia", @"Daniel", @"Martyna", nil];
    userConnectState = [NSArray arrayWithObjects:@"I am hungry", @"Online", @"Offline", @"How about a beer", @"Let's eat", @"Online", nil];
    userDistance = [NSArray arrayWithObjects:@"100", @"500", @"200", @"1000", @"500", @"100", nil];
    

    _tableview.delegate = self;
    _tableview.dataSource = self;
    
    ischeck = 0;
    
    _btnMakeGroup.layer.cornerRadius = 10;
    _btnMakeGroup.clipsToBounds = YES;
    
    _btnMap.layer.cornerRadius = 10;
    _btnMap.clipsToBounds = YES;
    
    _btnInviteFriend.layer.cornerRadius = 10;
    _btnInviteFriend.clipsToBounds = YES;
    
    dropdown = [[VSDropdown alloc]initWithDelegate:self];
    [dropdown setAdoptParentTheme:YES];
    [dropdown setShouldSortItems:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [userDistance count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        
}
- (void)showDropDownForButton:(UIButton *)sender adContents:(NSArray *)contents multipleSelection:(BOOL)multipleSelection {
    
    [dropdown setDrodownAnimation:rand() % 2];
    
    [dropdown setAllowMultipleSelection:multipleSelection];
    
    [dropdown setupDropdownForView:sender];
    
    [dropdown setShouldSortItems:NO];
    
    [dropdown setSeparatorColor:[UIColor clearColor]];
    
    if (dropdown.allowMultipleSelection) {
        [dropdown reloadDropdownWithContents:contents andSelectedItems:[sender.titleLabel.text componentsSeparatedByString:@";"]];
    } else {
        
        [dropdown reloadDropdownWithContents:contents andSelectedItems:@[sender.titleLabel.text]];
        //        [_dropdown reloadDropdownWithContents:contents keyPath:@"name" selectedItems:@[sender.titleLabel.text]];
    }
    
}

-(ContactsTableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ContactsTableViewCell *cell = (ContactsTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"contactsCell"];
    
//    if (cell == nil){
//        cell = [[ContactsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"contactsCell"];
//    }
    
//    NSString *imgName;
//    
//    imgName = [NSString stringWithFormat:@"%@", [userphoto objectAtIndex:indexPath.row]];
    
//    [ cell.btnCheck setTag:indexPath.row];
    
    cell.imgUserPhoto.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", [userphoto objectAtIndex:indexPath.row]]];
    cell.lblUserName.text = [userName objectAtIndex:indexPath.row];
    cell.lblConnectState.text = [userConnectState objectAtIndex:indexPath.row];
    cell.lblDistance.text = [NSString stringWithFormat:@"%dm away", [[userDistance objectAtIndex:indexPath.row] intValue]];
    
    if ( cell.ncheck == 0){
        [cell.btnCheck setImage:[UIImage imageNamed:@"uncheckbox.png"] forState:UIControlStateNormal];
    } else {
        [cell.btnCheck setImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
    }
    
    if (ischeck == 1){
        [cell.btnCheck setHidden:NO];
//        cell.ncheck = 0;
    } else {
        [cell.btnCheck setHidden:YES];
    }
    
    return cell;
}


- (IBAction)onMakeGroup:(id)sender {
    
    ischeck = 1 - ischeck;
    
    if (ischeck == 1) {
        
        [_btnMakeGroup setTitle:@"Connect" forState:UIControlStateNormal];
        [_tableview reloadData];
        
    } else {
        [_btnMakeGroup setTitle:@"Make Group" forState:UIControlStateNormal];
        [_tableview reloadData];
    }
    
    
}

#pragma mark - Button Events

- (IBAction)onCheck:(id)sender {
//    NSLog(@"%ld", [ sender tag]);
    
    ContactsTableViewCell *cell = (ContactsTableViewCell*)[[[sender superview] superview] superview];
    
    if (cell.ncheck == 0){
        [cell.btnCheck setImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
    } else {
        [cell.btnCheck setImage:[UIImage imageNamed:@"uncheckbox.png"] forState:UIControlStateNormal];
    }
    
    cell.ncheck = 1 - cell.ncheck;
    
}


@end
