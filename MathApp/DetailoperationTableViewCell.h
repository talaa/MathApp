//
//  DetailoperationTableViewCell.h
//  MathApp
//
//  Created by Tamer Alaa on 8/11/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface DetailoperationTableViewCell : UITableViewCell
@property (nonatomic,strong)IBOutlet UIImageView *imagetype;
@property (nonatomic,strong)IBOutlet UILabel *operationtype;
@property (nonatomic,strong)IBOutlet UILabel *userscore;
@property (nonatomic,strong)IBOutlet UILabel *TTFLabel;
@property (nonatomic,strong)IBOutlet UILabel *colorlabel;
@end
