//
//  ZookSoundTestAppDelegate.h
//  ZookSoundTest
//
//  Created by Matthew Moore on 3/25/10.
//  Copyright ThriveSmart, Inc. 2010. All rights reserved.
//

@class MainViewController;

@interface ZookSoundTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController *mainViewController;

@end

