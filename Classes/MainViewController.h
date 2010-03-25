//
//  MainViewController.h
//  ZookSoundTest
//
//  Created by Matthew Moore on 3/25/10.
//  Copyright ThriveSmart, Inc. 2010. All rights reserved.
//

#import "FlipsideViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, AVAudioPlayerDelegate> {
}

- (IBAction)showInfo;
// Play sound 1 in a new player
- (IBAction) playSound1;
// Play sound 2 in a new player
- (IBAction) playSound2;
// Play sound 3 in a new player
- (IBAction) playSound3;
// Plays an individual sound found by the name of the sound (sans the ".mp3")
- (void) playSound:(NSString *)soundFile;
// Delegete which releases the player from memory
- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)completed;

@end
