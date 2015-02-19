//
//  PlayMusic.m
//  Ghosthunter2
//
//  Created by Tamer Alaa on 3/25/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import "PlayMusic.h"


@interface PlayMusic ()


@property (nonatomic, strong) AVAudioPlayer *player;
@property (nonatomic, strong) AVPlayer *player1;

@end


@implementation PlayMusic
#pragma mark Singleton stuff

static id _sharedInstance;

+ (PlayMusic *)sharedInstance //public API
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[PlayMusic alloc] init];
    });
    return _sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = nil;
        _sharedInstance = [super allocWithZone:zone];
    });
    return _sharedInstance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

+ (id)new
{
    NSException *exception = [[NSException alloc] initWithName:@"Stop"
                                                        reason:@"Doing this"
                                                      userInfo:nil];
    [exception raise];
    
    return nil;
}

#pragma mark - Public APIs

- (void)playMusicFile:(NSData *)file
{
    NSParameterAssert(file != nil);
    
    NSError *error = nil;
    self.player = [[AVAudioPlayer alloc] initWithData:file
                                                error:&error];
    NSParameterAssert(error == nil);
    
    [self.player prepareToPlay];
    [self.player play];
}

- (void)playMusicFileFromMainBundle:(NSString *)fileNameWithExtension
{
    NSParameterAssert(fileNameWithExtension != nil);
    NSParameterAssert([fileNameWithExtension length] > 0);
    NSParameterAssert(![fileNameWithExtension isEqualToString:@" "]);
    
    NSError *error = nil;
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:[fileNameWithExtension stringByDeletingPathExtension]
                                                              ofType:[fileNameWithExtension pathExtension]];
    
    
    
    
    NSURL *url = [[NSURL alloc] initFileURLWithPath:soundFilePath];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    NSParameterAssert(error == nil);
    [self.player setVolume:0.1];
    [self.player prepareToPlay];
    [self.player play];
}
-(void)playmusicfromfile:(NSString*)filename{
    NSParameterAssert(filename != nil);
    NSParameterAssert([filename length] > 0);
    NSParameterAssert(![filename isEqualToString:@" "]);


    NSError *error = nil;
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:[filename stringByDeletingPathExtension]
                                                              ofType:[filename pathExtension]];
    
    
    
    
    NSURL *url = [[NSURL alloc] initFileURLWithPath:soundFilePath];
    //self.player1 = [[AVPlayer alloc] initWithContentsOfURL:url error:&error];
    self.player1=[[AVPlayer alloc]initWithURL:url];
    NSParameterAssert(error == nil);
    self.player1.volume=1.0;
    //[self.player prepareToPlay];
    [self.player1 play];


}

- (NSTimeInterval)currentTime
{
    return self.player.currentTime;
}

- (NSTimeInterval)duration
{
    return self.player.duration;
}

- (void)pause
{
    [self.player pause];
}

- (void)play
{
    [self.player play];
}

- (void)stop
{
    [self.player stop];
    self.player.currentTime = 0.0f;
}

- (void)setupNumberOfLoops:(NSInteger)loops
{
    self.player.numberOfLoops = loops;
}
@end
