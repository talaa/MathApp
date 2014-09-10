//
//  OperationsViewController.m
//  MathApp
//
//  Created by Tamer Alaa on 8/14/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import "OperationsViewController.h"
#include "AMRatingControl.h"
#import "Scorecards.h"
#import "Flurry.h"

@interface OperationsViewController ()
@property (nonatomic,strong)NSString *operationstype;
@property (nonatomic,strong)NSArray *therecord;
@property (nonatomic)int internalscore;
@property (nonatomic)int trialnumber;
@property (nonatomic)BOOL recordavailable;
@property (nonatomic)BOOL firsttime;
@property (nonatomic,strong)NSDate *starttime;
@end

@implementation OperationsViewController
@synthesize operationstype,generatedstring,results,internalscore,scorestring,trialnumber,confirmbutton,nextbutton,therecord,backbutton,recordavailable,firsttime,starttime;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    // Do any additional setup after loading the view.
    //Show the alertview
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    if (![defaults boolForKey:KNoads]) {
        [self setupads];
    }
    if (![defaults objectForKey:@"firsttime"]) {
        UIAlertView *Explainview=[[UIAlertView alloc]initWithTitle:@"How to " message:@"Once you finish answering , Press 'Confirm'.\n To move to next Question , Press 'Next'.\n To go Back , Press 'Back' " delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",@"Don't Show this Again", nil];
        [Explainview show];

    }
    
    
    //Arranging the UI
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"square-grid-small"]];
    [nextbutton.layer setCornerRadius:40.0f];
    [nextbutton.layer setMasksToBounds:YES];
    [confirmbutton.layer setCornerRadius:40.0f];
    [confirmbutton.layer setMasksToBounds:YES];
    [backbutton.layer setCornerRadius:40.0f];
    [backbutton.layer setMasksToBounds:YES];
    //Preparing Data
    NSPredicate *usernamepredicate=[NSPredicate predicateWithFormat:@"username == %@", [tempObjects currentusername]];
    NSPredicate *operationtypepredicate=[NSPredicate predicateWithFormat:@"operationtype == %@",[tempObjects operationtype]];
     NSPredicate *operationlevelpredicate=[NSPredicate predicateWithFormat:@"opeerationlevel == %i",[tempObjects indexrow]];
    NSPredicate *andPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:[NSArray arrayWithObjects:usernamepredicate,operationtypepredicate,operationlevelpredicate,nil]];
    
    
    
    NSArray *ssss = [Scorecards MR_findAllWithPredicate:andPredicate];
    
    if (ssss.count!=0) {
        recordavailable=YES;
        therecord=ssss;
    }
    //Scorecards *bghgh=ssss[0];
    NSLog(@"The filtered array is %@ ",ssss);
    starttime=[NSDate date];
    
    trialnumber++;
    NSLog(@"Trial number is %i",trialnumber);
    [self startthepage];

}
-(void)setupads{
    // Create a view of the standard size at the top of the screen.
    // Available AdSize constants are explained in GADAdSize.h.
    bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [bannerView_ setAdSize:kGADAdSizeFullBanner];
        
    }
    
    // Specify the ad unit ID.
    bannerView_.adUnitID = @"ca-app-pub-9978956748838024/5288590757";
    
    // Let the runtime know which UIViewController to restore after taking
    // the user wherever the ad goes and add it to the view hierarchy.
    bannerView_.rootViewController = self;
    [self.view addSubview:bannerView_];
    
    // Initiate a generic request to load it with an ad.
    [bannerView_ loadRequest:[GADRequest request]];



}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)Checkthecalculation:(id)sender{
    [results resignFirstResponder];
    NSInteger resultsint=[results.text integerValue];
    NSInteger realresults=0;
    if ([[tempObjects operationtype]isEqualToString:@"Add"]) {
        realresults=[Addoperations score];
    }
    if ([[tempObjects operationtype]isEqualToString:@"Minus"]) {
        realresults=[Minusoperations score];
    }
    if ([[tempObjects operationtype]isEqualToString:@"Multiply"]) {
        realresults=[Multiplyoperations score];
    }
    if ([[tempObjects operationtype]isEqualToString:@"Division"]) {
        realresults=[Divisionoperations score];
    }
    
    if (resultsint==realresults ) {
        NSLog(@"yeaaa good work");
        internalscore++;
        if (trialnumber==10) {
            NSLog(@"end of line for this game");
        }
    }else{
        NSLog(@"Try Again ");

    
    }
    confirmbutton.enabled=NO;
    [self updatemyscorelabel];

}
-(void)startthepage{

    if ([[tempObjects operationtype] isEqual:@"Add"]) {
        operationstype=[Addoperations generatestringfromindex:[tempObjects indexrow]];
        generatedstring.text=operationstype;
        
    }
    if ([[tempObjects operationtype] isEqual:@"Minus"]) {
        operationstype=[Minusoperations generatestringfromindex:[tempObjects indexrow]];
        generatedstring.text=operationstype;
        
    }
    
    if ([[tempObjects operationtype] isEqual:@"Multiply"]) {
        operationstype=[Multiplyoperations generatestringfromindex:[tempObjects indexrow]];
        generatedstring.text=operationstype;
        
    }
    if ([[tempObjects operationtype] isEqual:@"Division"]) {
        operationstype=[Divisionoperations generatestringfromindex:[tempObjects indexrow]];
        generatedstring.text=operationstype;
        
    }
    
    [self updatemyscorelabel];

}
-(void)updatemyscorelabel{

    CGPoint AMRcenter;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        AMRcenter=CGPointMake(200, 750);
    
    }else{
        AMRcenter=CGPointMake(60, 400);
        
            }
    AMRatingControl *simpleRatingControl = [[AMRatingControl alloc] initWithLocation:AMRcenter emptyImage:[UIImage imageNamed:@"star_y"] solidImage:[UIImage imageNamed:@"star"] andMaxRating:trialnumber];

    //simpleRatingControl.tag = 20;
    //simpleRatingControl.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    simpleRatingControl.userInteractionEnabled = NO;
    
    
    //float scorefloat=(float)internalscore/(float)Kmaxscore;
    self.scorestring.text=[NSString stringWithFormat:@"Score is %u out of 10",internalscore];
    [simpleRatingControl setRating:internalscore];

    [self.view addSubview:simpleRatingControl];

}
-(IBAction)next:(id)sender{
    
    //Dont forget to modify it to 10 again 
    if (trialnumber<10) {
        trialnumber++;
        results.text=@"";
        [self startthepage];
        confirmbutton.enabled=YES;
    }else{
        nextbutton.enabled=NO;
    UIAlertView *endoflinealert=[[UIAlertView alloc]initWithTitle:@"Done !" message:@"You have finished 10 tests of this level" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Send mail to parent", nil];
    [endoflinealert show];
        //NSLog(@"The type is %@ & the level is %i",[tempObjects tempoarray][[tempObjects indexrow]],[tempObjects indexrow]);
        if (recordavailable) {
            Scorecards *modifyrecord=therecord[0];
            modifyrecord.userscore=[NSNumber numberWithInt:internalscore];
            modifyrecord.scoredate=[NSDate date];
        } else {
            Scorecards *newscore=[Scorecards MR_createEntity];
            newscore.username=[tempObjects currentusername];
            newscore.scoredate=[NSDate date];
            newscore.userscore=[NSNumber numberWithInt:internalscore];
            newscore.operationtype=[tempObjects operationtype];
            newscore.opeerationlevel=[NSNumber numberWithInt:[tempObjects indexrow]];
            NSTimeInterval timediff=[[NSDate date] timeIntervalSinceDate:starttime];
            newscore.timetocomplete=[NSNumber numberWithDouble:timediff];
        }
        NSMutableDictionary *flurrydic=[[NSMutableDictionary alloc]initWithObjectsAndKeys:[tempObjects operationtype],@"Operation Type",[tempObjects indexrow],@"Operation Level",internalscore,@"Operation score", nil];
        [Flurry logEvent:@"log operation" withParameters:flurrydic timed:YES];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
            if (success) {
                NSLog(@"You successfully saved your context.");
            } else if (error) {
                NSLog(@"Error saving context: %@", error.description);
            }
        }];
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        if ([defaults objectForKey:KDademail]||[defaults objectForKey:KMumemail]) {
            [self sendmailtoparents];
        }else{
            UIAlertView *noemailview=[[UIAlertView alloc]initWithTitle:@"Emails are empty" message:@"OOOPS you have fogotten to put any emails to inform the parents" delegate:self cancelButtonTitle:nil otherButtonTitles:@"GO TO Settings -->", nil];
            [noemailview show];
        
        }
        //must insert if function to check if there is any emails in userdefaults
        

    }
}

-(void)sendmailtoparents{

     NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSTimeInterval timediff=[[NSDate date] timeIntervalSinceDate:starttime];

    //NSArray *tomail=[[NSArray alloc]initWithObjects:[self.detailItem valueForKey:@"email"], nil];
    MFMailComposeViewController *picker=[[MFMailComposeViewController alloc]init];
    picker.mailComposeDelegate=self;
    [picker setSubject:@"Query About Event" ];
    [picker setToRecipients:@[[defaults objectForKey:KDademail],[defaults objectForKey:KMumemail]]];
    NSString *messagebody=[[NSString alloc]init];
    if ([defaults boolForKey:Kshowttf]) {
        messagebody=[NSString stringWithFormat:@"The user %@ has reached score of: %i in operation type:%@ in %.2f secs",[tempObjects currentusername],internalscore,[tempObjects tempoarray][[tempObjects indexrow]],timediff];
    }else{
    messagebody=[NSString stringWithFormat:@"The user %@ has reached score of: %i in operation type:%@ in (N/A) secs",[tempObjects currentusername],internalscore,[tempObjects tempoarray][[tempObjects indexrow]]];
    
    
    }
    [picker setMessageBody:messagebody isHTML:NO];
    //[picker addAttachmentData:[self.detailItem valueForKey:@"image"] mimeType:@"image/png" fileName:@"Photos"];
    [self presentViewController:picker animated:YES completion:nil];



}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    [controller dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        //
        NSLog(@"I have pressed the Button index 0");
    }
    else if (buttonIndex == 1) {
        //
         NSLog(@"I have pressed the Button index 1");
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        //BOOL donthsow=YES;
        [defaults setBool:YES forKey:@"firsttime"];
        [defaults synchronize];
    }
    else if (buttonIndex == 2) {
        //
    }
    else if (buttonIndex == 3) {
        //
    }
}
@end
