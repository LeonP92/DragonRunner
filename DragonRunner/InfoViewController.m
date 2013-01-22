//
//  InfoViewController.m
//  DragonRunner
//
//  Created by Leon on 6/5/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//


#import "DragonRunnerViewController.h"
#import "GameViewController.h"
#import "InfoViewController.h"
#import "SettingsViewController.h"


@implementation InfoViewController
@synthesize back;

-(IBAction) back1{
    DragonRunnerViewController *Main = [[DragonRunnerViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:Main animated:YES];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    [back release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.back = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
