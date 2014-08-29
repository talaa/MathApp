//
//  MainViewController.m
//  MathApp
//
//  Created by Tamer Alaa on 8/10/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import "MainViewController.h"
#import "DetailoperationsTableViewController.h"
#import "tempObjects.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=[NSString stringWithFormat:@"Hi %@",[tempObjects currentusername]];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"square-grid-small"]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    }
    if ([[segue identifier] isEqualToString:@"plusdetailsegue"]) {
        //[[segue destinationViewController] setDelegate:self];
        DetailoperationsTableViewController *detailcontroller=(DetailoperationsTableViewController*)[segue destinationViewController];
        detailcontroller.title=@"Add";
        NSMutableDictionary *basicdic=[[NSMutableDictionary alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"list_scores" ofType:@"plist"]];
        NSArray *basicarray=[[NSArray alloc]initWithArray:[basicdic objectForKey:@"Add"]];
        NSLog(@"The array is %@",basicarray);
        [tempObjects setmainarray:basicarray];
        //[self presentViewController:detailcontroller animated:YES completion:nil];
        
    }
    if ([[segue identifier] isEqualToString:@"minusdetailsegue"]) {
        //[[segue destinationViewController] setDelegate:self];
        DetailoperationsTableViewController *detailcontroller=(DetailoperationsTableViewController*)[segue destinationViewController];
        detailcontroller.title=@"Minus";
        NSMutableDictionary *basicdic=[[NSMutableDictionary alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"list_scores" ofType:@"plist"]];
        NSArray *basicarray=[[NSArray alloc]initWithArray:[basicdic objectForKey:@"Minus"]];
        NSLog(@"The array is %@",basicarray);
        [tempObjects setmainarray:basicarray];
        //[self presentViewController:detailcontroller animated:YES completion:nil];
        
    }
    if ([[segue identifier] isEqualToString:@"multiplydetailsegue"]) {
        //[[segue destinationViewController] setDelegate:self];
        DetailoperationsTableViewController *detailcontroller=(DetailoperationsTableViewController*)[segue destinationViewController];
        detailcontroller.title=@"Multiply";
        NSMutableDictionary *basicdic=[[NSMutableDictionary alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"list_scores" ofType:@"plist"]];
        NSArray *basicarray=[[NSArray alloc]initWithArray:[basicdic objectForKey:@"Multiply"]];
        NSLog(@"The array is %@",basicarray);
        [tempObjects setmainarray:basicarray];
        //[self presentViewController:detailcontroller animated:YES completion:nil];
        
    }
    
    if ([[segue identifier] isEqualToString:@"divisiondetailsegue"]) {
        //[[segue destinationViewController] setDelegate:self];
        DetailoperationsTableViewController *detailcontroller=(DetailoperationsTableViewController*)[segue destinationViewController];
        detailcontroller.title=@"Division";
        NSMutableDictionary *basicdic=[[NSMutableDictionary alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"list_scores" ofType:@"plist"]];
        NSArray *basicarray=[[NSArray alloc]initWithArray:[basicdic objectForKey:@"Division"]];
        NSLog(@"The array is %@",basicarray);
        [tempObjects setmainarray:basicarray];
        //[self presentViewController:detailcontroller animated:YES completion:nil];
        
    }
    
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
