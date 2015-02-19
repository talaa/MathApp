//
//  PlayMusic.h
//  Ghosthunter2
//
//  Created by Tamer Alaa on 3/25/14.
//  Copyright (c) 2014 SpringMoon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface PlayMusic : NSObject<AVAudioPlayerDelegate>
+ (PlayMusic *)sharedInstance;
- (void)playMusicFile:(NSData *)file;
- (void)playMusicFileFromMainBundle:(NSString *)fileNameWithExtension;
- (NSTimeInterval)currentTime;
- (NSTimeInterval)duration;
- (void)pause;
- (void)play;
- (void)stop;
- (void)setupNumberOfLoops:(NSInteger)loops;
-(void)playmusicfromfile:(NSString*)filename;
@end
