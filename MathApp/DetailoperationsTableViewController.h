//
//  DetailoperationsTableViewController.h
//  MathApp
//
//  Created by Tamer Alaa on 8/11/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailoperationTableViewCell.h"
#define K3usersupgrade @"3usersupgarde"
#define KNoads @"Noadsupgarde"
#define Kshowttf @"ShowTTF"
@class Scorecards;
@interface DetailoperationsTableViewController : UITableViewController
@property(nonatomic)Scorecards *databaseofscore;
@end
