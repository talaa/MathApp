//
//  FlipsideViewController.m
//  MathApp
//
//  Created by Tamer Alaa on 8/10/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import "FlipsideViewController.h"

@interface FlipsideViewController ()

@end

@implementation FlipsideViewController

- (void)awakeFromNib
{
    self.preferredContentSize = CGSizeMake(320.0, 480.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:KDademail] isEqualToString:@""]&&[[defaults objectForKey:KMumemail] isEqualToString:@""]) {
        UIAlertView *noemailview=[[UIAlertView alloc]initWithTitle:@"Emails are empty" message:@"OOOPS you have fogotten to put any emails to inform the parents" delegate:self cancelButtonTitle:nil otherButtonTitles:@"GO TO Settings -->", nil];
        [noemailview show];
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}
- (IBAction)unwindToA:(UIStoryboardSegue *)segue
{
    //returning to A
    //[self performSegueWithIdentifier:@"back" sender:self];
}


@end
