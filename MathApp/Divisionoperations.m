//
//  Divisionoperations.m
//  MathApp
//
//  Created by Tamer Alaa on 8/14/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import "Divisionoperations.h"
static NSString *newstring=nil;
static int a=1;
static int b=1;
static int c=1;
static int d=1;
static int newscore=0;
static int temp=0;
@implementation Divisionoperations
+(NSString*)generatestringfromindex:(NSUInteger)index{
    newscore=0;
    a=1;
    b=1;
    c=1;
    d=1;
    temp=0;
    
    
    switch (index) {
        case 0:
            a=[self getRandomNumberBetween:1 to:9];
            b=[self getRandomNumberBetween:1 to:9];
            
            
            temp=a*b;
            
            newscore=a;
            newstring=[[NSString alloc]initWithFormat:@"%i / %i =",temp,b];
            
            break;
        case 1:
            
            a= [self getRandomNumberBetween:10 to:99];
            b= [self getRandomNumberBetween:1 to:9];
            
            temp=a*b;
            newscore=a;
            newstring=[[NSString alloc]initWithFormat:@"%i / %i =",temp,b];
            break;
        case 2:
            a= [self getRandomNumberBetween:10 to:99];
            b= [self getRandomNumberBetween:10 to:99];
            
            temp=a*b;
            newscore=a;
            newstring=[[NSString alloc]initWithFormat:@"%i / %i =",temp,b];
            
            break;
        case 3:
            a= [self getRandomNumberBetween:100 to:999];
            b= [self getRandomNumberBetween:10 to:99];
            //c=[self getRandomNumberBetween:0 to:9];
            
            temp=a*b;
            newscore=a;
            newstring=[[NSString alloc]initWithFormat:@"%i / %i =",temp,b];
            
            break;
        case 4:
            a= [self getRandomNumberBetween:100 to:999];
            b= [self getRandomNumberBetween:100 to:999];
            //c=[self getRandomNumberBetween:10 to:99];
            temp=a*b;
            newscore=a;
            newstring=[[NSString alloc]initWithFormat:@"%i / %i =",temp,b];
            
            break;
        
        
        default:
            break;
    }
    return newstring;
}
+(int)getRandomNumberBetween:(int)from to:(int)to {
    
    return from + arc4random() % (to-from+1);
    
}
+(int)score{
    return newscore;
}

@end
