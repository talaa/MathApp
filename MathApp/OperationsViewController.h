//
//  OperationsViewController.h
//  MathApp
//
//  Created by Tamer Alaa on 8/14/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//


#define KDademail @"Dad's Email:"
#define KMumemail @"Mum's Email:"
#define K3usersupgrade @"3usersupgarde"
#define KNoads @"Noadsupgarde"
#define Kshowttf @"ShowTTF"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
#import <QuartzCore/QuartzCore.h>
#import "Addoperations.h"
#import "Minusoperations.h"
#import "Multiplyoperations.h"
#import "Divisionoperations.h"
#import "tempObjects.h"
#import "GADBannerView.h"
@class Scorecards;
@interface OperationsViewController : UIViewController<MFMailComposeViewControllerDelegate,UIAlertViewDelegate>{
GADBannerView *bannerView_;
}
@property(nonatomic,strong) IBOutlet UILabel *generatedstring;
@property(nonatomic,strong) IBOutlet UILabel *scorestring;
@property(nonatomic,strong) IBOutlet UITextField *results;
@property(nonatomic,strong) IBOutlet UIButton *confirmbutton;
@property(nonatomic,strong) IBOutlet UIButton *nextbutton;
@property(nonatomic,strong) IBOutlet UIButton *backbutton;
@property (nonatomic,strong)Scorecards *databaseofscores;

-(IBAction)Checkthecalculation:(id)sender;
-(IBAction)next:(id)sender;
@end
