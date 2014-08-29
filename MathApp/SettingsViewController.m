//
//  SettingsViewController.m
//  MathApp
//
//  Created by Tamer Alaa on 8/15/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize donebutton,Suggestions,dademail,mumemail,Storebutton;

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
    [donebutton.layer setCornerRadius:25.0f];
    [donebutton.layer setMasksToBounds:YES];
    [Suggestions.layer setCornerRadius:45.0f];
    [Suggestions.layer setMasksToBounds:YES];
    [Storebutton.layer setCornerRadius:45.0f];
    [Storebutton.layer setMasksToBounds:YES];
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [dademail setText: [defaults objectForKey:KDademail]];
    [mumemail setText:[defaults objectForKey:KMumemail]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)sendsuggestions:(id)sender{
    MFMailComposeViewController *picker=[[MFMailComposeViewController alloc]init];
    picker.mailComposeDelegate=self;
    [picker setSubject:@"Suggestions" ];
    [picker setToRecipients:@[@"springmoon.it@gmail.com"]];
    [picker setMessageBody:@"Hello \n we have couple of suggestions to improve " isHTML:NO];
    //[picker addAttachmentData:[self.detailItem valueForKey:@"image"] mimeType:@"image/png" fileName:@"Photos"];
    [self presentViewController:picker animated:YES completion:nil];


}
-(IBAction)done:(id)sender{
    
    NSUserDefaults *userdefault=[NSUserDefaults standardUserDefaults];
    [userdefault setObject:dademail.text forKey:KDademail];
    [userdefault setObject:mumemail.text forKey:KMumemail];
    
}
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    [controller dismissViewControllerAnimated:YES completion:nil];
    
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

@end
