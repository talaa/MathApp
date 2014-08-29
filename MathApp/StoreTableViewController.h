//
//  StoreTableViewController.h
//  MathApp
//
//  Created by Tamer Alaa on 8/27/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <StoreKit/StoreKit.h>
#import "Flurry.h"
#define KPROUprade @"isProversionpurchased"
#define K3usersupgrade @"3usersupgarde"
#define KNoads @"Noadsupgarde"
#define Kshowttf @"ShowTTF"

@interface StoreTableViewController : UITableViewController<SKProductsRequestDelegate,SKPaymentTransactionObserver>
@property (nonatomic,strong)IBOutlet UIButton *backbutton;
@property (nonatomic,strong)IBOutlet UIButton *upgrade3usersbtn;
@property (nonatomic,strong)IBOutlet UIButton *upgradenoadsbtn;
@property (nonatomic,strong)IBOutlet UIButton *upgradeshowTTFbtn;
@property (nonatomic,strong)IBOutlet UIButton *restorebutton;
@property (nonatomic,strong)IBOutlet UIActivityIndicatorView *spinner;
@property (strong, nonatomic) SKProduct *product1;
@property (strong, nonatomic) SKProduct *product2;
@property (strong, nonatomic) SKProduct *product3;

-(IBAction)buyproduct1:(id)sender;
-(IBAction)buyproduct2:(id)sender;
-(IBAction)buyproduct3:(id)sender;
- (IBAction)restoreaction:(id)sender;
-(void)requestProductData;
//-(void)requestProductData3users;
//-(void)requestProductDatanoads;
//-(void)requestProductDatashowttf;

@end
