//
//  SettingsViewController.h
//  MathApp
//
//  Created by Tamer Alaa on 8/15/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <QuartzCore/QuartzCore.h>
#define KDademail @"Dad's Email:"
#define KMumemail @"Mum's Email:"
//#define KCarPlateNo @"Car Plate No:"

@interface SettingsViewController : UIViewController<MFMailComposeViewControllerDelegate>
@property(nonatomic,strong)IBOutlet UITextField *dademail;
@property(nonatomic,strong)IBOutlet UITextField *mumemail;
@property(nonatomic,strong)IBOutlet UIButton *Suggestions;
@property(nonatomic,strong)IBOutlet UIButton *donebutton;
@property(nonatomic,strong)IBOutlet UIButton *Storebutton;
-(IBAction)sendsuggestions:(id)sender;
-(IBAction)done:(id)sender;
@end
