//
//  Addoperations.m
//  MathApp
//
//  Created by Tamer Alaa on 8/14/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import "Addoperations.h"
static NSString *newstring=nil;
static int a=0;
static int b=0;
static int c=0;
static int d=0;
//static int newscore=0;
@implementation Addoperations
+(NSString*)generatestringfromindex:(NSUInteger)index{

    
    
    switch (index) {
        case 0:
            a=arc4random()%9;
            b=arc4random()%9;
            c=0;
            d=0;
            newstring=[[NSString alloc]initWithFormat:@"%i + %i =",a,b];
            break;
        case 1:
            
            a= [self getRandomNumberBetween:10 to:99];
            b= [self getRandomNumberBetween:10 to:99];
            c=0;
            d=0;
            newstring=[[NSString alloc]initWithFormat:@"%i + %i =",a,b];
            break;
        case 2:
            a= [self getRandomNumberBetween:100 to:999];
            b= [self getRandomNumberBetween:100 to:999];
            c=0;
            d=0;
            newstring=[[NSString alloc]initWithFormat:@"%i + %i =",a,b];

            break;
        case 3:
            a= [self getRandomNumberBetween:0 to:9];
            b= [self getRandomNumberBetween:0 to:9];
            c=[self getRandomNumberBetween:0 to:9];
            d=0;
            newstring=[[NSString alloc]initWithFormat:@"%i + %i + %i =",a,b,c];

            break;
        case 4:
            a= [self getRandomNumberBetween:10 to:99];
            b= [self getRandomNumberBetween:10 to:99];
            c=[self getRandomNumberBetween:10 to:99];
            d=0;
            newstring=[[NSString alloc]initWithFormat:@"%i + %i + %i =",a,b,c];
            
            break;
        case 5:
            a= [self getRandomNumberBetween:0 to:9];
            b= [self getRandomNumberBetween:0 to:9];
            c=[self getRandomNumberBetween:0 to:9];
            d=[self getRandomNumberBetween:0 to:9];
            newstring=[[NSString alloc]initWithFormat:@"%i + %i + %i + %i =",a,b,c,d];
            

            break;
        case 6:
            a= [self getRandomNumberBetween:10 to:99];
            b= [self getRandomNumberBetween:10 to:99];
            c=[self getRandomNumberBetween:10 to:99];
            d=[self getRandomNumberBetween:10 to:99];
            newstring=[[NSString alloc]initWithFormat:@"%i + %i + %i + %i =",a,b,c,d];
            
            break;
        default:
            break;
    }
    return newstring;
}
+(int)getRandomNumberBetween:(int)from to:(int)to {
    
    return from + arc4random() % (to-from+1);
    
}
+(NSUInteger)score{
    return a+b+c+d;
}


@end
