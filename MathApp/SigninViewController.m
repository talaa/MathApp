//
//  SigninViewController.m
//  MathApp
//
//  Created by Tamer Alaa on 8/16/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import "SigninViewController.h"
#import "tempObjects.h"
#import "Users.h"
#import "Scorecards.h"

@interface SigninViewController ()
@property (nonatomic)int noofusers;
@end

@implementation SigninViewController
@synthesize enternewname,entrancechoice,saveme_go,databaseofscores,noofusers;

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
    
    /*
    if (!self.databaseofusers) {
        self.databaseofusers = [Users MR_createEntity];
    }
    */
    [saveme_go.layer setCornerRadius:23.0f];
    
    [saveme_go.layer setMasksToBounds:YES];
    //saveme_go.enabled=NO;
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"signinbackground"]];
    NSMutableArray *users=[[Users MR_findAll]mutableCopy];
    NSMutableArray *vvv=[[NSMutableArray alloc]init];
    for (int ii=0; ii<users.count; ii++) {
        Users *hhh=users[ii];
        [vvv addObject:hhh.username];
    }
    
    NSLog(@"The users are %@",vvv);
    
    [tempObjects addanotherusername:vvv];
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    if ([defaults boolForKey:K3usersupgrade]) {
        noofusers=3;
    }else{
        noofusers=1;
    }
    
    if (([[tempObjects usersarray]count]==noofusers)) {
                NSLog(@"I am Already Full");
                enternewname.enabled=NO;
                saveme_go.enabled=NO;
            }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)checksegmentvalue:(id)sender{
    [self.enternewname resignFirstResponder];
    UIPickerView *picker1 = [[UIPickerView alloc] init];
    //NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    picker1.dataSource = self;
    picker1.delegate = self;
    picker1.showsSelectionIndicator=YES;
    switch (entrancechoice.selectedSegmentIndex) {
        case 0:
            enternewname.text=@"";
            NSLog(@"I am starting as new User");
            self.enternewname.inputView=UIInputViewStyleDefault;
            if ([[tempObjects usersarray]count]==noofusers) {
                NSLog(@"I am Already Full");
                enternewname.enabled=NO;
                saveme_go.enabled=NO;
            }else{
            
                enternewname.enabled=YES;
            }
            
            break;
            
        case 1:
            saveme_go.enabled=NO;
            if ([[tempObjects usersarray]count]<=noofusers ) {
                self.enternewname.text=@"";
            self.enternewname.enabled=YES;
                saveme_go.enabled=YES;
            NSLog(@"I am starting as existing User");
            self.enternewname.inputView=picker1;
                
            }
            break;
        case 2:
            enternewname.enabled=NO;
            saveme_go.enabled=YES;
            NSLog(@"I am starting as Test User");
            self.enternewname.text=@"Boogey Man";
            break;
            
        default:
            break;
    }


}

-(IBAction)Checkuser_go:(id)sender{

   
    
        switch (entrancechoice.selectedSegmentIndex) {
            {case 0:
            NSLog(@"I am Coming as new User");
                if ([enternewname.text isEqual:@""]) {
                    //saveme_go.enabled=NO;
                    
                }else{
                Users *newuser=[Users MR_createEntity];
                newuser.username=enternewname.text;
                NSMutableArray *oldusersarray=[[tempObjects usersarray]mutableCopy];
                [oldusersarray addObject:enternewname.text];
                [tempObjects addanotherusername:oldusersarray];

            //self.databaseofusers.username=enternewname.text;
            //[tempObjects addanotherusername:enternewname.text];
            [tempObjects setcurrentusername:enternewname.text];
            //[self performSegueWithIdentifier:@"signme" sender:self];
                }
                break;}
            
            {case 1:
            NSLog(@"I am Coming as existing User");
            [tempObjects setcurrentusername:enternewname.text];
            //[self performSegueWithIdentifier:@"signme" sender:self];
                break;}
            {case 2:
            NSLog(@"I am Coming as Test User");
            [tempObjects setcurrentusername:enternewname.text];
                break;}
            
        default:
            break;
    }
    NSLog(@"The users array is %@",[tempObjects usersarray]);
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
        if (success) {
            NSLog(@"You successfully saved your context.");
        } else if (error) {
            NSLog(@"Error saving context: %@", error.description);
        }
    }];
    //NSLog(@"Managedcontext working %@", suburbsArray);


}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
 
 if ([[segue identifier] isEqualToString:@"showAlternate"]) {
 [[segue destinationViewController] setDelegate:self];
 
 if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
 UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
 self.flipsidePopoverController = popoverController;
 popoverController.delegate = self;
 }
 }
 
    
    
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([identifier isEqualToString:@"signme"]&&[enternewname.text isEqual:@""]) {
        UIAlertView *nonameview=[[UIAlertView alloc]initWithTitle:@"Empty UserName" message:@"Please Enter Valid Username" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [nonameview show];
    
    
        return NO;
    }
//default transition
    return YES;

}

//Prepare th UI
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [[tempObjects usersarray]count];
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return  1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    
        return [tempObjects usersarray][row];
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if ([tempObjects usersarray].count>0) {
        self.enternewname.text = [tempObjects usersarray][row];

    }
    [self.enternewname resignFirstResponder];
    saveme_go.enabled=YES;
    
}




#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}
- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

@end
