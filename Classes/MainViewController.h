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
	// The player for sound loops
	AVAudioPlayer *loopPlayer;
}

- (IBAction)showInfo;

// Play background music in a loop
- (IBAction) playSetupBackgroundMusic;
// Stop background music loop
- (IBAction) stopSetupBackgroundMusic;
// Play button press sound in a new player
- (IBAction) playButtonPress;
// Play 2nd button press sound in a new player
- (IBAction) playButtonPress2;
// Play background music in a loop
- (IBAction) playDiceRollingMusic;
// Stop background music loop
- (IBAction) stopDiceRollingMusic;
// Play dice stop sound in a new player
- (IBAction) playDiceStopped;
// Play team goes first sound in a new player
- (IBAction) playTeamGoesFirst;
// Play next team up music in a loop
- (IBAction) playNextTeamUpLoop;
// Stop next team up loop
- (IBAction) stopNextTeamUpLoop;
// Play show answer sound in a new player
- (IBAction) playShowAnswer;
// Play hide answer sound in a new player
- (IBAction) playHideAnswer;
// Play next timer running out sound in a loop
- (IBAction) playTimerRunningOutLoop;
// Stop next timer running out loop
- (IBAction) stopTimerRunningOutLoop;
// Play timer out in a new player
- (IBAction) playTimerOut;
// Play won mini game song in a loop
- (IBAction) playWonMiniGameLoop;
// Stop won mini game song loop
- (IBAction) stopWonMiniGameLoop;
// Play lost mini game song in a loop
- (IBAction) playLostMiniGameLoop;
// Stop lost mini game song loop
- (IBAction) stopLostMiniGameLoop;
// Play facebook upload complete in a new player
- (IBAction) playFacebookUploadComplete;
// Play move to a space sound in a new player
- (IBAction) playMoveToSpace;
// Play move to final space sound in a new player
- (IBAction) playMoveToFinalSpace;
// Play lost entire game song in a loop
- (IBAction) playWonEntireGameLoop;
// Stop lost entire game song loop
- (IBAction) stopWonEntireGameLoop;

// Plays an individual sound found by the name of the sound (sans the ".mp3")
- (void) playSound:(NSString *)soundFile;
// Plays a sound look by the name of the sound (sans the ".m4a") -- only one song can be looped at a time.  Cancels the current loop, if any
- (void) playSoundLoop:(NSString *)soundFile;
// Stops the current sound loop (if any)
- (void) stopSoundLoop;
// Delegete which releases the player from memory
- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)completed;

@end
