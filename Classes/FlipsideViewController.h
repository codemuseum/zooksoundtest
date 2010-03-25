//
//  FlipsideViewController.h
//  ZookSoundTest
//
//  Created by Matthew Moore on 3/25/10.
//  Copyright ThriveSmart, Inc. 2010. All rights reserved.
//

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
- (IBAction)done;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

