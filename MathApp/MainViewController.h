//
//  MainViewController.h
//  MathApp
//
//  Created by Tamer Alaa on 8/10/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end
