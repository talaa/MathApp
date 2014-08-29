//
//  DetailoperationTableViewCell.m
//  MathApp
//
//  Created by Tamer Alaa on 8/11/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import "DetailoperationTableViewCell.h"

@implementation DetailoperationTableViewCell
@synthesize operationtype,imagetype,userscore,colorlabel,TTFLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
       
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
     [self.layer setCornerRadius:10.0f];
    [self.layer setMasksToBounds:YES];
    //self.backgroundColor=[UIColor grayColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
