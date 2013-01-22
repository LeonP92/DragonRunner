//
//  SettingsViewController.m
//  DragonRunner
//
//  Created by Leon on 6/5/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//


#import "DragonRunnerViewController.h"
#import "GameViewController.h"
#import "InfoViewController.h"
#import "SettingsViewController.h"


@implementation SettingsViewController
@synthesize stage, stage1, stage2, stages, back, stageValue, submit, high, highS;

//changes stage
-(IBAction) stage11{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    stageValue = 1;
    [prefs setInteger:stageValue forKey:@"stageV"];
    stages.text = [NSString stringWithFormat:@"Forest Stage"];
    [stage setHidden: YES];
    [stage1 setHidden:NO];
    [stage2 setHidden:YES];
}
-(IBAction) stage12{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    stageValue = 2;
    [prefs setInteger:stageValue forKey:@"stageV"];
    stages.text= [NSString stringWithFormat:@"Underwater Stage"];
    [stage setHidden:YES];
    [stage1 setHidden:YES];
    [stage2 setHidden:NO];
    
}
-(IBAction) stage13{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    stageValue = 0;
    [prefs setInteger:stageValue forKey:@"stageV"];
    stages.text = [NSString stringWithFormat:@"Desert Stage"];
    [stage setHidden:NO];
    [stage1 setHidden: YES];
    [stage2 setHidden:YES];
    
}
//back to main menu
-(IBAction) back1{
    DragonRunnerViewController *Main = [[DragonRunnerViewController alloc] initWithNibName:nil bundle: nil];
    [self presentModalViewController:Main animated:YES];
}
//submit highscore
-(IBAction) submit1{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSInteger hS = [prefs integerForKey:@"highscores"]; 
    
    GKScore *scoreSubmit = [[[GKScore alloc] initWithCategory:@"19921118"] autorelease];
    scoreSubmit.value = hS;
    
    [scoreSubmit reportScoreWithCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"Failed! Try Again!");
            
            UIAlertView *alert1 = [[UIAlertView alloc]
                                   initWithTitle:@"High Score" message:@"There was an error! Try again!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
            [alert1 release];
        }
        else{
            
            GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init];
            if (leaderboardController != nil)
            {
                leaderboardController.leaderboardDelegate = self;
                [self presentModalViewController: leaderboardController animated: YES];
            }
        }
    }];
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
    [stage release];
    [stage1 release];
    [stage2 release];
    [stages release];
    [high release];
    [submit release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
//Game Center
BOOL isGameCenterAPIAvailable()
{
    // Check for presence of GKLocalPlayer class.
    BOOL localPlayerClassAvailable = (NSClassFromString(@"GKLocalPlayer")) != nil;
    
    // The device must be running iOS 4.1 or later.
    NSString *reqSysVer = @"4.1";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending);
    
    return (localPlayerClassAvailable && osVersionSupported);
}
-(void) leaderboardViewControllerDidFinish: (GKLeaderboardViewController *) viewController{
    [self dismissModalViewControllerAnimated:YES];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults]; 
    stageValue = [prefs integerForKey:@"stageV"];
    //highscore
    highS = [prefs integerForKey:@"highscores"];
    [prefs synchronize];
    
    //label
    high.transform = CGAffineTransformMakeRotation(4.712);
    stages.transform = CGAffineTransformMakeRotation(4.712);
    
    high.text = [NSString stringWithFormat:@"High Score: " @"%i", highS];
    
    if (stageValue == 0) {
        stages.text = [NSString stringWithFormat:@"Desert Stage"]; 
        [stage setHidden:NO];
        [stage1 setHidden: YES];
        [stage2 setHidden:YES];
    }
    if (stageValue == 1) {
        stages.text = [NSString stringWithFormat:@"Forest Stage"];
        [stage setHidden: YES];
        [stage1 setHidden:NO];
        [stage2 setHidden:YES];
    }
    if (stageValue == 2) {
        stages.text = [NSString stringWithFormat:@"Underwater Stage"];
        [stage setHidden:YES];
        [stage1 setHidden:YES];
        [stage2 setHidden:NO];
    }
    
    //game center login
    [[GKLocalPlayer localPlayer] authenticateWithCompletionHandler:^(NSError *error) {
        if (error == nil) {
            NSLog(@"Authentication Successful!");
        }
        else{
            NSLog(@"Authentication Failed!");
        }
    }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.back = nil;
    self.stage = nil;
    self.stage1 = nil;
    self.stage2 = nil;
    self.stages = nil;
    self.submit = nil;
    self.high = nil;
        
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
