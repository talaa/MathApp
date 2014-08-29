//
//  StoreTableViewController.m
//  MathApp
//
//  Created by Tamer Alaa on 8/27/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import "StoreTableViewController.h"
#define kInAppPurchase3usersProductId @"com.springmoon.MathApp.InApp"
#define kInAppPurchasenoadsProductId @"com.springmoon.MathApp.removeAdsInApp"
#define kInAppPurchaseshowttfProductId @"com.springmoon.MathApp.showTTFInAPP"
@interface StoreTableViewController ()
@property (nonatomic)int boughtitem;
@end

@implementation StoreTableViewController
@synthesize backbutton,upgrade3usersbtn,upgradenoadsbtn,upgradeshowTTFbtn,restorebutton,spinner,boughtitem;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [backbutton.layer setCornerRadius:20.0f];
    [backbutton.layer setMasksToBounds:YES];
    [upgrade3usersbtn.layer setCornerRadius:30.f];
    [upgrade3usersbtn.layer setMasksToBounds:YES];
    [upgradenoadsbtn.layer setCornerRadius:30.f];
    [upgradenoadsbtn.layer setMasksToBounds:YES];
    [upgradeshowTTFbtn.layer setCornerRadius:30.f];
    [upgradeshowTTFbtn.layer setMasksToBounds:YES];
    
    NSUserDefaults *userdefaults =[NSUserDefaults standardUserDefaults];
    if (![userdefaults boolForKey:K3usersupgrade]) {
        upgrade3usersbtn.enabled=NO;
        restorebutton.enabled=NO;
        [self requestProductData];
        [spinner startAnimating];
        
    }else if (![userdefaults boolForKey:KNoads]){
        upgradenoadsbtn.enabled=NO;
        restorebutton.enabled=NO;
        [self requestProductData];
        //[self requestProductDatanoads];
        [spinner startAnimating];
    
    }else if (![userdefaults boolForKey:Kshowttf]){
        upgradeshowTTFbtn.enabled=NO;
        restorebutton.enabled=NO;
        [self requestProductData];
        //[self requestProductDatashowttf];
        [spinner startAnimating];
    
    
    }
    
    
    
    else {
        upgrade3usersbtn.hidden=YES;
        restorebutton.hidden=YES;
        spinner.hidden=YES;
        
    }
    
    //self.view.backgroundColor = [UIColor orangeColor];
    if ([SKPaymentQueue canMakePayments]) {
        NSLog(@"The Parental Control is Disabled");
    } else {
        // Warn the user that purchases are disabled.
        NSLog(@"The Parental Control is enabled");
    }
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 4;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 90)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, tableView.frame.size.width, 30)];
    [label setFont:[UIFont boldSystemFontOfSize:28]];
    [label setTextColor:[UIColor whiteColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    //[label setFont:[UIFont fontWithName:@"Gill Sans Bold" size:22.0f]];
    NSString *string =@"Current Upgrades";
    /* Section header is in 0th index... */
    [label setText:string];
    [view addSubview:label];
    //[view setBackgroundColor:[UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:1.0]]; //your background color...
    return view;
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)buyproduct1:(id)sender{
    SKPayment *payment = [SKPayment paymentWithProduct:_product1];
    //SKPayment *payment=[SKPayment paymentWithProductIdentifier:(SKProduct *)kInAppPurchaseProUpgradeProductId];
    //SKPayment *payment =[SKPayment paymentWithProductIdentifier:kInAppPurchaseProUpgradeProductId];
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
    boughtitem=0;
    NSLog(@"I made the payments");
    
}
-(IBAction)buyproduct2:(id)sender{
    SKPayment *payment = [SKPayment paymentWithProduct:_product2];
    //SKPayment *payment=[SKPayment paymentWithProductIdentifier:(SKProduct *)kInAppPurchaseProUpgradeProductId];
    //SKPayment *payment =[SKPayment paymentWithProductIdentifier:kInAppPurchaseProUpgradeProductId];
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
    boughtitem=1;
    NSLog(@"I made the payments");
    
}
-(IBAction)buyproduct3:(id)sender{
    SKPayment *payment = [SKPayment paymentWithProduct:_product3];
    //SKPayment *payment=[SKPayment paymentWithProductIdentifier:(SKProduct *)kInAppPurchaseProUpgradeProductId];
    //SKPayment *payment =[SKPayment paymentWithProductIdentifier:kInAppPurchaseProUpgradeProductId];
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
    boughtitem=2;
    NSLog(@"I made the payments");
    
}
- (IBAction)restoreaction:(id)sender{
    [[SKPaymentQueue defaultQueue]   restoreCompletedTransactions];
    
    
}

-(void)requestProductData{
       SKProductsRequest *request= [[SKProductsRequest alloc] initWithProductIdentifiers:
                                 [NSSet setWithObjects: kInAppPurchase3usersProductId,kInAppPurchasenoadsProductId,kInAppPurchaseshowttfProductId,nil]];
    request.delegate = self;
    [request start];
    
    
}

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    //NSArray *myProducts = response.products;
    // Populate your UI from the products list.
    // Save a reference to the products list.
    SKProduct *validproduct1=nil;
    SKProduct *validproduct2=nil;
    SKProduct *validproduct3=nil;
    NSUInteger count=[response.products count];
    if (count>0) {
        validproduct1 =[response.products objectAtIndex:0];
        validproduct2=[response.products objectAtIndex:1];
        validproduct3=[response.products objectAtIndex:2];
        _product1=validproduct1;
        _product2=validproduct2;
        _product3=validproduct3;
        NSLog(@"Product title: %@" , validproduct1.localizedTitle);
        //NSLog(@"Product description: %@" , validproduct1.localizedDescription);
        //NSLog(@"Product price: %@" , validproduct1.price);
        NSLog(@"Product id: %@" , validproduct1.productIdentifier);
        NSLog(@"Product title: %@" , validproduct2.localizedTitle);
        //NSLog(@"Product description: %@" , validproduct1.localizedDescription);
        //NSLog(@"Product price: %@" , validproduct1.price);
        NSLog(@"Product id: %@" , validproduct2.productIdentifier);
        NSLog(@"Product title: %@" , validproduct3.localizedTitle);
        //NSLog(@"Product description: %@" , validproduct1.localizedDescription);
        //NSLog(@"Product price: %@" , validproduct1.price);
        NSLog(@"Product id: %@" , validproduct3.productIdentifier);

        
        upgrade3usersbtn.enabled=YES;
        upgradenoadsbtn.enabled=YES;
        upgradeshowTTFbtn.enabled=YES;
        restorebutton.enabled=YES;
        [spinner stopAnimating];
        spinner.hidden=YES;
        
    } else if(!validproduct1) {
        NSLog(@"NO Products available");
    }
}

-(void)unlock3usersFeature{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey: K3usersupgrade ];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [Flurry logEvent:@"3 Users upgraded" timed:YES];
}
-(void)unlocknoadsFeature{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey: KNoads ];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [Flurry logEvent:@"No Ads upgraded" timed:YES];
}
-(void)unlockshowTTFFeature{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey: Kshowttf ];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [Flurry logEvent:@"Show TTF upgraded" timed:YES];
}
#pragma mark -
#pragma mark SKPaymentTransactionObserver

-(void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    for (SKPaymentTransaction *transaction in transactions)
    {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchased:
                switch (boughtitem) {
                    case 0:
                        [self unlock3usersFeature];
                        break;
                    case 1:
                        [self unlocknoadsFeature];
                        break;
                    case 2:
                        [self unlockshowTTFFeature];
                        break;
                        
                    default:
                        break;
                }
                
                [[SKPaymentQueue defaultQueue]
                 finishTransaction:transaction];
                NSLog(@"Transaction Done");
                [ self dismissViewControllerAnimated:YES completion:nil];
                //[Flurry logEvent:@"Upgrade Done"];
                break;
                
            case SKPaymentTransactionStateFailed:
                NSLog(@"Transaction Failed");
                [[SKPaymentQueue defaultQueue]
                 finishTransaction:transaction];
                break;
                
            default:
                break;
        }
    }
}

@end
