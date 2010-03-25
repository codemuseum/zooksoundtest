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

- (IBAction) playSound1 { [self playSound:@"sound1"]; }
- (IBAction) playSound2 { [self playSound:@"sound2"]; }
- (IBAction) playSound3 { [self playSound:@"sound3"]; }

- (void) playSound:(NSString *)soundFile {
	NSString *soundFilePath =
		[[NSBundle mainBundle] pathForResource: soundFile
																	ofType: @"mp3"];
	
	NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
	
	AVAudioPlayer *newPlayer =
		[[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: nil];
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


@end
