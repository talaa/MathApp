//
//  tempObjects.m
//  MathApp
//
//  Created by Tamer Alaa on 8/13/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import "tempObjects.h"
static NSArray *temparray=nil;
static NSArray *usersaray=nil;
static NSUInteger tempindex=0;
static NSString *optype=nil;
static NSString *currentuser=@"Boogey Man ";

@implementation tempObjects
+(void)setmainarray:(NSArray*)newArray{
    temparray=newArray;
}
+(void)setmainindex:(NSUInteger)newindex{
    tempindex=newindex;
    
}
+(NSArray*)tempoarray{
    return temparray;
    
}
+(NSUInteger) indexrow{
    return tempindex;
    
}
+(NSString*)operationtype{
    return optype;

}
+(void)setoperationtype:(NSString*)newoperation{

    optype=newoperation;
}
+(NSString*)currentusername{
    return currentuser;
}
+(void)setcurrentusername:(NSString*)newusername{
    currentuser=newusername;

}
+(NSArray*)usersarray{
    return usersaray;
}
+(void)addanotherusername:(NSArray*)newusername{
    
    usersaray=newusername;
}
@end
