//
//  ZookSoundTestAppDelegate.m
//  ZookSoundTest
//
//  Created by Matthew Moore on 3/25/10.
//  Copyright ThriveSmart, Inc. 2010. All rights reserved.
//

#import "ZookSoundTestAppDelegate.h"
#import "MainViewController.h"

@implementation ZookSoundTestAppDelegate


@synthesize window;
@synthesize mainViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
	MainViewController *aController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	self.mainViewController = aController;
	[aController release];
	
    mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[mainViewController view]];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end
