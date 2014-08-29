//
//  tempObjects.h
//  MathApp
//
//  Created by Tamer Alaa on 8/13/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface tempObjects : NSObject
+(void)setmainarray:(NSArray*)newArray;
+(void)setmainindex:(NSUInteger)newindex;
+(NSArray*)tempoarray;
+(NSUInteger) indexrow;
+(NSString*)operationtype;
+(void)setoperationtype:(NSString*)newoperation;
+(NSString*)currentusername;
+(void)setcurrentusername:(NSString*)newusername;
+(NSArray*)usersarray;
+(void)addanotherusername:(NSArray*)newusername;

@end
