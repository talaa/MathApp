//
//  SigninViewController.h
//  MathApp
//
//  Created by Tamer Alaa on 8/16/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "FlipsideViewController.h"
//#define KPROUprade @"isProversionpurchased"
#define K3usersupgrade @"3usersupgarde"
#define KNoads @"Noadsupgarde"
#define Kshowttf @"ShowTTF"
@class Scorecards;
@class Users;
@interface SigninViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,FlipsideViewControllerDelegate,UIPopoverControllerDelegate>
@property (nonatomic,strong)IBOutlet UITextField *enternewname;
@property (nonatomic,strong)IBOutlet UIButton *saveme_go;
@property (nonatomic,strong)IBOutlet UISegmentedControl *entrancechoice;
@property (nonatomic)Users *databaseofusers;
@property (nonatomic,strong)Scorecards *databaseofscores;
@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;
//@property (nonatomic,strong)IBOutlet UITableView *userstable;
-(IBAction)Checkuser_go:(id)sender;
-(IBAction)checksegmentvalue:(id)sender;
@end
