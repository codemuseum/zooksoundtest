//
//  MainViewController.m
//  ZookSoundTest
//
//  Created by Matthew Moore on 3/25/10.
//  Copyright ThriveSmart, Inc. 2010. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"


@implementation MainViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}


/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}



/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Player Actions

- (IBAction) playSetupBackgroundMusic { [self playSoundLoop:@"setupBackgroundMusicLoop"]; }
- (IBAction) stopSetupBackgroundMusic { [self stopSoundLoop]; }
- (IBAction) playButtonPress { [self playSound:@"singleButtonPress"]; }
- (IBAction) playButtonPress2 { [self playSound:@"singleButtonPress2"]; }
- (IBAction) playDiceRollingMusic { [self playSoundLoop:@"diceRolling"]; }
- (IBAction) stopDiceRollingMusic { [self stopSoundLoop]; }
- (IBAction) playDiceStopped { [self playSound:@"diceStopped"]; }
- (IBAction) playTeamGoesFirst { [self playSound:@"teamGoesFirst"]; }
- (IBAction) playNextTeamUpLoop { [self playSoundLoop:@"nextTeamUp"]; }
- (IBAction) stopNextTeamUpLoop { [self stopSoundLoop]; }
- (IBAction) playShowAnswer { [self playSound:@"showAnswer"]; }
- (IBAction) playHideAnswer { [self playSound:@"hideAnswer"]; }
- (IBAction) playTimerRunningOutLoop { [self playSoundLoop:@"timeRunningOut"]; }
- (IBAction) stopTimerRunningOutLoop { [self stopSoundLoop]; }
- (IBAction) playTimerOut { [self playSound:@"timerRanOut"]; }
- (IBAction) playWonMiniGameLoop { [self playSoundLoop:@"wonMiniGame"]; }
- (IBAction) stopWonMiniGameLoop { [self stopSoundLoop]; }
- (IBAction) playLostMiniGameLoop { [self playSoundLoop:@"lostMiniGame"]; }
- (IBAction) stopLostMiniGameLoop { [self stopSoundLoop]; }
- (IBAction) playFacebookUploadComplete { [self playSound:@"facebookUploadComplete"]; }
- (IBAction) playMoveToSpace { [self playSound:@"moveToSpace"]; }
- (IBAction) playMoveToFinalSpace { [self playSound:@"moveToFinalSpace"]; }
- (IBAction) playWonEntireGameLoop { [self playSoundLoop:@"wonEntireGame"]; }
- (IBAction) stopWonEntireGameLoop { [self stopSoundLoop]; }


- (void) playSound:(NSString *)soundFile {
	NSString *soundFilePath = [[NSBundle mainBundle] pathForResource: soundFile ofType: @"m4a"];
	NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
	
	AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: nil];
	[fileURL release];
	
	// [newPlayer prepareToPlay]; // Only do this if there's a conveninent place to initialize the sound before we're going to play it
	[newPlayer setDelegate: self];
	// [newPlayer release]; // Releases when finished playing.  Will doing so yeild a crash (ie will the sound not stop finishing sometimes)?
	[newPlayer play];
}

- (void) audioPlayerDidFinishPlaying: (AVAudioPlayer *) player
                        successfully: (BOOL) completed {
	if (completed == YES) {
		[player release];
	}
}

// Plays a sound look by the name of the sound (sans the ".m4a") -- only one song can be looped at a time.  Cancels the current loop, if any
- (void) playSoundLoop:(NSString *)soundFile {
	[self stopSoundLoop];
	
	NSString *soundFilePath = [[NSBundle mainBundle] pathForResource: soundFile ofType: @"m4a"];
	NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
	
	loopPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: nil];
	[fileURL release];
	
	// [loopPlayer prepareToPlay]; // Only do this if there's a conveninent place to initialize the sound before we're going to play it
	[loopPlayer setDelegate: self];
	loopPlayer.numberOfLoops = -1; // Infinte Loop until stopSoundLoop called
	// [loopPlayer release]; // Releases when finished playing.  Will doing so yeild a crash (ie will the sound not stop finishing sometimes)?
	[loopPlayer play];
}
// Stops the current sound loop (if any)
- (void) stopSoundLoop {
		if (loopPlayer) {
			[loopPlayer stop]; // Count on this to release the sound
			loopPlayer = nil;
		}
}

@end
