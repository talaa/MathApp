//
//  Scorecards.h
//  MathApp
//
//  Created by Tamer Alaa on 8/18/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Scorecards : NSManagedObject

@property (nonatomic, retain) NSNumber * opeerationlevel;
@property (nonatomic, retain) NSString * operationtype;
@property (nonatomic, retain) NSDate * scoredate;
@property (nonatomic, retain) NSNumber * timetocomplete;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSNumber * userscore;

@end
