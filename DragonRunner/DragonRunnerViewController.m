//
//  DragonRunnerViewController.m
//  DragonRunner
//
//  Created by Leon on 6/4/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//

#import "DragonRunnerViewController.h"
#import "GameViewController.h"
#import "InfoViewController.h"
#import "SettingsViewController.h"

@implementation DragonRunnerViewController
@synthesize play, info, settings;

//Buttons to change menus
-(IBAction) play1{
    GameViewController *Go = [[GameViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:Go animated:YES];
}
-(IBAction) info1{
    InfoViewController *Information = [[InfoViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:Information animated:YES];
}
-(IBAction) settings1{
    SettingsViewController *Set = [[SettingsViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:Set animated:YES];
}

-(void) popView: (UIView*) view {
	[view setHidden: NO];
	[[view layer] addAnimation: buttonAction
						forKey: @"trasnform.scale"]; 
}

-(void) viewWillAppear:(BOOL)animated {
	[buttonAction setDuration:0.3];
	[play setHidden:YES];
	[info setHidden:YES];
	[settings setHidden:YES];
	
	[self performSelector:@selector(popView:)
			   withObject: play afterDelay: 0.30];
	[self performSelector:@selector(popView:)
			   withObject: info afterDelay: 0.35];
	[self performSelector: @selector(popView:)
			   withObject: settings afterDelay: 0.40];
    
}


- (void)dealloc
{
    [super dealloc];
    [play release];
    [info release];
    [settings release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

    buttonAction = [CAKeyframeAnimation 
					animationWithKeyPath:@"transform.scale"];
    
	buttonAction.keyTimes =[NSArray arrayWithObjects:
							[NSNumber numberWithFloat:0.0],
							[NSNumber numberWithFloat:0.7], [NSNumber numberWithFloat:1.0], nil];
    
	buttonAction.values = [NSArray arrayWithObjects:
                           [NSNumber numberWithFloat:0.01],
                           [NSNumber numberWithFloat:1.1], [NSNumber numberWithFloat:1.0], nil];
	[buttonAction retain];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.play = nil;
    self.info = nil;
    self.settings = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
