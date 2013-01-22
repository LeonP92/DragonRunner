//
//  GameViewController.m
//  DragonRunner
//
//  Created by Leon on 6/5/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//


#import "DragonRunnerViewController.h"
#import "GameViewController.h"
#import "InfoViewController.h"
#import "SettingsViewController.h"


@implementation GameViewController
@synthesize dragon, back, pause, start, resume, missile, missile1, missile2, highScore, cScore, hiScore, restart, missile3, missile4, missile5, egg, b1, b2, stageValue, bonusL;
@synthesize bannerIsVisible;
//buttons
-(IBAction) back1
{
    DragonRunnerViewController *Main = [[DragonRunnerViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:Main animated: YES];
}
-(IBAction) pause1{
    [start setHidden:YES];
    [back setHidden: NO];
    [resume setHidden: NO];
    [pause setHidden: YES];
    [restart setHidden:YES];
    dragonVelocity = CGPointMake(0, 0);
    fVelocity = CGPointMake(0, 0);
    f2Velocity = CGPointMake(0, 0);
    f3Velocity = CGPointMake(0, 0);
    f4Velocity = CGPointMake(0, 0);
    f5Velocity = CGPointMake(0, 0);
    f6Velocity = CGPointMake(0, 0);
    eggM = CGPointMake(0, 0);
    [dragon stopAnimating];

}
-(IBAction) resume1{
    [pause setHidden:NO];
    [back setHidden: YES];
    [restart setHidden:YES];
    [resume setHidden:YES];
    [start setHidden: YES];
    dragonVelocity = CGPointMake(5, 4);
    fVelocity = CGPointMake(-9, 0);
    f2Velocity = CGPointMake(-10, 0);
    f3Velocity = CGPointMake(-11, 0);
    f4Velocity = CGPointMake(-13, 0);
    f5Velocity = CGPointMake(-14, 0);
    f6Velocity = CGPointMake(-15, 0);
    eggM = CGPointMake(-7, 0);
    
    [dragon startAnimating];
    
}
-(IBAction) restart1{
    dragonVelocity = CGPointMake(5, 4);
    fVelocity = CGPointMake(-9, 0);
    f2Velocity = CGPointMake(-10, 0);
    f3Velocity = CGPointMake(-11, 0);
    f4Velocity = CGPointMake(-13, 0);
    f5Velocity = CGPointMake(-14, 0);
    f6Velocity = CGPointMake(-15, 0);
    eggM = CGPointMake(-7, 0);
    //locations
    dragon.center = CGPointMake(50, 143);
    missile.center = CGPointMake(550, random() % 100 + 50);
    missile1.center = CGPointMake(550 ,random() % 150 +50);
    missile2.center = CGPointMake(550, random() % 250 + 50);
    missile3.center = CGPointMake(550, random() % 300 + 10);
    missile4.center = CGPointMake(550, random() % 305 + 10);
    missile5.center = CGPointMake(550, random() % 310 + 10);
    egg.center = CGPointMake((random() % 200 + 550), random()% 250 + 50);
    //score
    score = 0;
    NSString *nssScore = [NSString stringWithFormat:@"Score: " @"%i", score];
    cScore.text = nssScore;
    //resets backgrounds
    b1.center = CGPointMake(240, 160);
    b2.center = CGPointMake(720, 480);
    
    [dragon startAnimating];
    
    [resume setHidden:YES];
    [pause setHidden: NO];
    [start setHidden: YES];
    [restart setHidden:YES];
    [back setHidden:YES];
}
//methods
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (dragonVelocity.x == 0) {
        dragonVelocity = CGPointMake(0, 0);
    }
    if (dragonVelocity.x != 0) {
        dragonVelocity = CGPointMake(5, -4);
    }
}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (dragonVelocity.x == 0) {
        dragonVelocity = CGPointMake(0, 0);
    }
    if (dragonVelocity.x != 0) {
        dragonVelocity = CGPointMake(5, 4);
    }
}
-(void) fly{
    dragon.center = CGPointMake(dragon.center.x + dragonVelocity.x, dragon.center.y + dragonVelocity.y);
    
    //missiles start coming
    missile.center = CGPointMake(missile.center.x +fVelocity.x, missile.center.y);
    missile1.center = CGPointMake(missile1.center.x +f2Velocity.x, missile1.center.y);
    missile2.center = CGPointMake(missile2.center.x+f3Velocity.x, missile2.center.y );
    egg.center = CGPointMake(egg.center.x + eggM.x, egg.center.y );
    
    //additional missiles
    if (score >= 1500) {
        missile3.center = CGPointMake(missile3.center.x+f4Velocity.x, missile3.center.y);
    }
    if (score >= 3000) {
        missile4.center = CGPointMake(missile4.center.x + f5Velocity.x, missile4.center.y );
    }
    if (score >= 5000) {
        missile5.center = CGPointMake(missile5.center.x +f6Velocity.x, missile5.center.y);
    }
    
    //resets missiles
    if (missile.center.x < -20) {
        missile.center = CGPointMake(550, random() % 100 + 50);
        [bonusL setHidden:YES];
    }
    if(missile1.center.x < -20){
        missile1.center = CGPointMake(550, random() % 150 + 50);
    }
    if (missile2.center.x < -20) {
        missile2.center = CGPointMake(550, random() % 200 + 50);
    }
    if (missile3.center.x < -20) {
        missile3.center = CGPointMake(550, random() % 250 + 50);
    }
    if (missile4.center.x < -20) {
        missile4.center = CGPointMake(550, random() % 270 + 50);
    }
    if (missile5.center.x < -20) {
        missile5.center = CGPointMake(550, random() % 300 + 50);
    }
    //reset egg
    if (egg.center.x < -20) {
        egg.center = CGPointMake((random() % 200 + 550), random()% 250 + 50);

    }
    //collision detection
    if (CGRectIntersectsRect(dragon.frame, missile.frame)) {
      
        if (dragon.center.x + 18 >= missile.center.x - 15  && dragon.center.y + 18 <= missile.center.y + 24 && dragon.center.y - 18 >= missile.center.y -24 ) {
            [restart setHidden:NO];
            [pause setHidden:YES];
            [dragon stopAnimating];
            
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setInteger:highScore forKey: @"highscores"];
            [prefs synchronize];
            hiScore.text = [NSString stringWithFormat:@"Best: " @"%i", highScore];
            
            
            dragonVelocity = CGPointMake(0, 0);
            fVelocity = CGPointMake(0, 0);
            f2Velocity = CGPointMake(0, 0);
            f3Velocity = CGPointMake(0, 0);
            f4Velocity = CGPointMake(0, 0);
            f5Velocity = CGPointMake(0, 0);
            f6Velocity = CGPointMake(0, 0);
            eggM = CGPointMake(0, 0);
        }
    }
    
    if (CGRectIntersectsRect(dragon.frame, missile1.frame) ) {
      
        if (dragon.center.x + 18 >= missile1.center.x - 15  && dragon.center.y + 18 <= missile1.center.y + 24 && dragon.center.y - 18 >= missile1.center.y -24 )  {
            [restart setHidden:NO];
            [pause setHidden:YES];
            [dragon stopAnimating];
            
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setInteger:highScore forKey: @"highscores"];
            [prefs synchronize];
            hiScore.text = [NSString stringWithFormat:@"Best: " @"%i", highScore];
            
            
            dragonVelocity = CGPointMake(0, 0);
            fVelocity = CGPointMake(0, 0);
            f2Velocity = CGPointMake(0, 0);
            f3Velocity = CGPointMake(0, 0);
            f4Velocity = CGPointMake(0, 0);
            f5Velocity = CGPointMake(0, 0);
            f6Velocity = CGPointMake(0, 0);
            eggM = CGPointMake(0, 0);
        }
    }
    
    if (CGRectIntersectsRect(dragon.frame, missile2.frame)) {

        if (dragon.center.x + 18 >= missile2.center.x - 15  && dragon.center.y + 18 <= missile2.center.y + 24 && dragon.center.y - 18 >= missile2.center.y -24 ){
            [restart setHidden:NO];
            [pause setHidden:YES];
            [dragon stopAnimating];
            
            
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setInteger:highScore forKey: @"highscores"];
            [prefs synchronize];
            hiScore.text = [NSString stringWithFormat:@"Best: " @"%i", highScore];
            
            
            dragonVelocity = CGPointMake(0, 0);
            fVelocity = CGPointMake(0, 0);
            f2Velocity = CGPointMake(0, 0);
            f3Velocity = CGPointMake(0, 0);
            f4Velocity = CGPointMake(0, 0);
            f5Velocity = CGPointMake(0, 0);
            f6Velocity = CGPointMake(0, 0);
            eggM = CGPointMake(0, 0);
        }
    }
    if (CGRectIntersectsRect(dragon.frame, missile3.frame)) {
        
        if (dragon.center.x + 18 >= missile3.center.x - 15  && dragon.center.y + 18 <= missile3.center.y + 24 && dragon.center.y - 18 >= missile3.center.y -24 ) {
            [restart setHidden:NO];
            [pause setHidden:YES];
            [dragon stopAnimating];
            
            
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setInteger:highScore forKey: @"highscores"];
            [prefs synchronize];
            hiScore.text = [NSString stringWithFormat:@"Best: " @"%i", highScore];
            
            
            dragonVelocity = CGPointMake(0, 0);
            fVelocity = CGPointMake(0, 0);
            f2Velocity = CGPointMake(0, 0);
            f3Velocity = CGPointMake(0, 0);
            f4Velocity = CGPointMake(0, 0);
            f5Velocity = CGPointMake(0, 0);
            f6Velocity = CGPointMake(0, 0);
            eggM = CGPointMake(0, 0);
        }
    }
    if (CGRectIntersectsRect(dragon.frame, missile4.frame)) {
        
        if (dragon.center.x + 18 >= missile4.center.x - 15  && dragon.center.y + 18 <= missile4.center.y + 24 && dragon.center.y - 18 >= missile4.center.y -24 ){
            [restart setHidden:NO];
            [pause setHidden:YES];
            [dragon stopAnimating];
            
            
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setInteger:highScore forKey: @"highscores"];
            [prefs synchronize];
            hiScore.text = [NSString stringWithFormat:@"Best: " @"%i", highScore];
            
            
            dragonVelocity = CGPointMake(0, 0);
            fVelocity = CGPointMake(0, 0);
            f2Velocity = CGPointMake(0, 0);
            f3Velocity = CGPointMake(0, 0);
            f4Velocity = CGPointMake(0, 0);
            f5Velocity = CGPointMake(0, 0);
            f6Velocity = CGPointMake(0, 0);
            eggM = CGPointMake(0, 0);
        }
    }
    if (CGRectIntersectsRect(dragon.frame, missile5.frame)) {
        
        if (dragon.center.x + 18 >= missile5.center.x - 15  && dragon.center.y + 18 <= missile5.center.y + 24 && dragon.center.y - 18 >= missile5.center.y -24 ){
            [restart setHidden:NO];
            [pause setHidden:YES];
            [dragon stopAnimating];
            
            
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setInteger:highScore forKey: @"highscores"];
            [prefs synchronize];
            hiScore.text = [NSString stringWithFormat:@"Best: " @"%i", highScore];
            
            
            dragonVelocity = CGPointMake(0, 0);
            fVelocity = CGPointMake(0, 0);
            f2Velocity = CGPointMake(0, 0);
            f3Velocity = CGPointMake(0, 0);
            f4Velocity = CGPointMake(0, 0);
            f5Velocity = CGPointMake(0, 0);
            f6Velocity = CGPointMake(0, 0);
            eggM = CGPointMake(0, 0);
        }
    }
    //Collision detection for the egg
    if (CGRectIntersectsRect(dragon.frame, egg.frame)) {
        if (dragon.center.x  <= egg.center.x && dragon.center.x +18 >= egg.center.x +5 && dragon.center.y - 25 <= egg.center.y) {
            bonus = (random() % 500 + 1);
            score = score + bonus ;
            NSString *nssScore = [NSString stringWithFormat:@"Score: " @"%i", score];
            cScore.text = nssScore;
            
            [bonusL setHidden:NO];
            bonusL.text = [NSString stringWithFormat:@"+" @"%i", bonus];
            
            //randomize egg location
            egg.center = CGPointMake((random() % 200 + 550), random()% 250 + 50);

        }
    }
    //prevents dragon from flying off screens
    if (dragon.center.y <= 40) {
        dragonVelocity.y = 4; 
    }
    if (dragon.center.y >= 310 ) {
        dragonVelocity.y = -4;
    }
}

//Adjust the screen
- (void) adjust{
    
    if (dragon.center.x > (self.view.bounds.size.width/ 5)) {
        float difference = (self.view.bounds.size.width/ 5) -  dragon.center.x;
        dragon.center = CGPointMake(dragon.center.x + difference, dragon.center.y );
        score -= (int)difference;
        NSString *nssScore = [NSString stringWithFormat:@"Score: " @"%i", score];
        cScore.text = nssScore;
       
        //background 
        b1.center = CGPointMake(b1.center.x + (difference/2), b1.center.y );
        b2.center = CGPointMake(b2.center.x + (difference/2), b1.center.y);
        if (b1.center.x > self.view.bounds.size.width + (b1.bounds.size.width/2)) {
            b1.center = CGPointMake(b1.center.x + 480, b2.center.y);
        }
        if (b2.center.x > self.view.bounds.size.width + (b1.bounds.size.width/2)) {
            b2.center = CGPointMake(b2.center.x + 480, b1.center.y );
        }
        if(b1.center.x <= -240){
            b1.center = CGPointMake(b2.center.x + 480, b2.center.y);
        }
        if(b2.center.x <= -240){
            b2.center = CGPointMake(b1.center.x + 480, b1.center.y );
        }
    
    }
     
    //score
    if (score > highScore) {
        highScore = score;
    }
     
}

//start button
-(IBAction) start1{
    [start setHidden:YES];

    //animate dragon
    dragon.animationImages = [NSArray arrayWithObjects:
                              [UIImage imageNamed: @"dragonrunner2.png"],
                              [UIImage imageNamed:@"dragonrunner3.png"],
                              [UIImage imageNamed:@"dragonrunner4.png"],
                              [UIImage imageNamed:@"dragonrunner5.png"],
                              [UIImage imageNamed:@"dragonrunner4.png"],
                              [UIImage imageNamed: @"dragonrunner3.png"],
                              [UIImage imageNamed: @"dragonrunner2.png"],
                              [UIImage imageNamed:@"dragonrunner(1).png"], nil];
    dragon.animationDuration = 1.00;
    [dragon startAnimating];
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(fly) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(adjust) userInfo:nil repeats:YES];

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
    adView.delegate=nil;
    [adView release];
    [super dealloc];
    [pause release];
    [dragon release];
    [back release];
    [start release];
    [resume release];
    [missile release];
    [missile1 release];
    [missile2 release];
    [missile3 release];
    [missile4 release];
    [missile5 release];
    [egg release];
    [hiScore release];
    [cScore release];
    [restart release];
    [b1 release];
    [b2 release];
    [bonusL release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

//iAd

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        // banner is invisible now and moved out of the screen on 50 px
        banner.frame = CGRectOffset(banner.frame, 0, 50);
        [UIView commitAnimations];
        self.bannerIsVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        // banner is visible and we move it out of the screen, due to connection issue
        banner.frame = CGRectOffset(banner.frame, 0, -50);
        [UIView commitAnimations];
        self.bannerIsVisible = NO;
    }
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
	NSLog(@"Banner view is beginning an ad action");
	BOOL shouldExecuteAction = YES;
	if (!willLeave && shouldExecuteAction)
    {
		
    }
	return shouldExecuteAction;
}
- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
	
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    [super viewDidLoad];
   //iAD
    adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    adView.frame = CGRectOffset(adView.frame, 0, -50);
    adView.requiredContentSizeIdentifiers = [NSSet setWithObjects:ADBannerContentSizeIdentifierPortrait,ADBannerContentSizeIdentifierLandscape,nil];
    adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
    [self.view addSubview:adView];
    adView.delegate=self;
    self.bannerIsVisible=NO;
   
    
    //Game related
    [back setHidden:YES];
    [resume setHidden: YES];
    [restart setHidden:YES];
    [bonusL setHidden: YES];

    // Do any additional setup after loading the view from its nib.
    b1.center = CGPointMake(240, 160);
    b2.center = CGPointMake(720, 480);
    
    dragon.center = CGPointMake(50, 127);
    missile.center = CGPointMake(550, random() % 100 + 50);
    missile1.center = CGPointMake(550 ,random() % 150 +50);
    missile2.center = CGPointMake(550, random() % 250 + 50);
    missile3.center = CGPointMake(550, random() % 300 + 10);
    missile4.center = CGPointMake(550, random() % 305 + 10);
    missile5.center = CGPointMake(550, random() % 310 + 10);
    egg.center = CGPointMake((random() % 200 + 550), random()% 250 + 50);

    
    score = 0;
    //points
    dragonVelocity = CGPointMake(5, 4);
    fVelocity = CGPointMake(-9, 0);
    f2Velocity = CGPointMake(-10, 0);
    f3Velocity = CGPointMake(-11, 0);
    f4Velocity = CGPointMake(-13, 0);
    f5Velocity = CGPointMake(-14, 0);
    f6Velocity = CGPointMake(-15, 0);
    eggM = CGPointMake(-7, 0);
    
    
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	highScore = [prefs integerForKey:@"highscores"];
	hiScore.text = [NSString stringWithFormat:@"Best: " @"%i", highScore]; 
    score = 0;
    cScore.text = [NSString stringWithFormat:@"Score: " @"%i", score];
    //stage
    stageValue = [prefs integerForKey:@"stageV"];
    if (stageValue == 0) {
        UIImage *background = [UIImage imageNamed:@"desert1.png"];
        [b1 setImage: background];
        [b2 setImage: background];
        
        missile.animationImages = [NSArray arrayWithObjects:
                                   [UIImage imageNamed:@"f5.png"],
                                   [UIImage imageNamed:@"f4.png"],
                                   [UIImage imageNamed:@"f3.png"],
                                   [UIImage imageNamed:@"f2.png"],
                                   [UIImage imageNamed:@"f1.png"], nil];
        missile.animationDuration = 1.0;
        [missile startAnimating];
        missile1.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"f5.png"],
                                    [UIImage imageNamed:@"f4.png"],
                                    [UIImage imageNamed:@"f3.png"],
                                    [UIImage imageNamed:@"f2.png"],
                                    [UIImage imageNamed:@"f1.png"], nil];
        missile1.animationDuration = 1.0;
        [missile1 startAnimating];
        missile2.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"f5.png"],
                                    [UIImage imageNamed:@"f4.png"],
                                    [UIImage imageNamed:@"f3.png"],
                                    [UIImage imageNamed:@"f2.png"],
                                    [UIImage imageNamed:@"f1.png"], nil];
        missile2.animationDuration = 1.0;
        [missile2 startAnimating]; 
        missile3.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"f5.png"],
                                    [UIImage imageNamed:@"f4.png"],
                                    [UIImage imageNamed:@"f3.png"],
                                    [UIImage imageNamed:@"f2.png"],
                                    [UIImage imageNamed:@"f1.png"], nil];
        missile3.animationDuration = 1.0;
        [missile3 startAnimating];
        missile4.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"f5.png"],
                                    [UIImage imageNamed:@"f4.png"],
                                    [UIImage imageNamed:@"f3.png"],
                                    [UIImage imageNamed:@"f2.png"],
                                    [UIImage imageNamed:@"f1.png"], nil];
        missile4.animationDuration = 1.0;
        [missile4 startAnimating];
        missile5.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"f5.png"],
                                    [UIImage imageNamed:@"f4.png"],
                                    [UIImage imageNamed:@"f3.png"],
                                    [UIImage imageNamed:@"f2.png"],
                                    [UIImage imageNamed:@"f1.png"], nil];
        missile5.animationDuration = 1.0;
        [missile5 startAnimating];

    }
    if (stageValue == 1) {
        UIImage *background1 = [UIImage imageNamed:@"forest.png"];
        [b1 setImage:background1];
        [b2 setImage: background1];
        
        missile.animationImages = [NSArray arrayWithObjects:
                                   [UIImage imageNamed:@"green_ball5.png"],
                                   [UIImage imageNamed: @"green_ball3.png"],
                                   [UIImage imageNamed:@"green_ball2.png"],
                                   [UIImage imageNamed:@"green_ball1"], nil];
        missile.animationDuration = 1.0;
        [missile startAnimating];
        missile1.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"green_ball5.png"],
                                    [UIImage imageNamed: @"green_ball3.png"],
                                    [UIImage imageNamed:@"green_ball2.png"],
                                    [UIImage imageNamed:@"green_ball1"], nil];
        missile1.animationDuration = 1.0;
        [missile1 startAnimating];
        missile2.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"green_ball5.png"],
                                    [UIImage imageNamed: @"green_ball3.png"],
                                    [UIImage imageNamed:@"green_ball2.png"],
                                    [UIImage imageNamed:@"green_ball1"], nil];
        missile2.animationDuration = 1.0;
        [missile2 startAnimating];
        missile3.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"green_ball5.png"],
                                    [UIImage imageNamed: @"green_ball3.png"],
                                    [UIImage imageNamed:@"green_ball2.png"],
                                    [UIImage imageNamed:@"green_ball1"], nil];
        missile3.animationDuration = 1.0;
        [missile3 startAnimating];
        missile4.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"green_ball5.png"],
                                    [UIImage imageNamed: @"green_ball3.png"],
                                    [UIImage imageNamed:@"green_ball2.png"],
                                    [UIImage imageNamed:@"green_ball1"], nil];
        missile4.animationDuration = 1.0;
        [missile4 startAnimating];
        missile5.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"green_ball5.png"],
                                    [UIImage imageNamed: @"green_ball3.png"],
                                    [UIImage imageNamed:@"green_ball2.png"],
                                    [UIImage imageNamed:@"green_ball1"], nil];
        missile5.animationDuration = 1.0;
        [missile5 startAnimating];
    }
    if (stageValue == 2) {
        UIImage *background2 = [UIImage imageNamed:@"underwater copy.png"];
        UIImage *background22 = [UIImage imageNamed:@"underwater2.png"];
        [b1 setImage:background2];
        [b2 setImage:background22];
        
        missile.animationImages = [NSArray arrayWithObjects:
                                   [UIImage imageNamed:@"bubble5.png"],
                                   [UIImage imageNamed:@"bubble4.png"],
                                   [UIImage imageNamed:@"bubble3.png"],
                                   [UIImage imageNamed:@"bubble2.png"],
                                   [UIImage imageNamed:@"bubble.png"], nil];
        missile.animationDuration = 1.0;
        [missile startAnimating];
        missile1.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"bubble5.png"],
                                    [UIImage imageNamed:@"bubble4.png"],
                                    [UIImage imageNamed:@"bubble3.png"],
                                    [UIImage imageNamed:@"bubble2.png"],
                                    [UIImage imageNamed:@"bubble.png"], nil];
        missile1.animationDuration = 1.0;
        [missile1 startAnimating];
        missile2.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"bubble5.png"],
                                    [UIImage imageNamed:@"bubble4.png"],
                                    [UIImage imageNamed:@"bubble3.png"],
                                    [UIImage imageNamed:@"bubble2.png"],
                                    [UIImage imageNamed:@"bubble.png"], nil];
        missile2.animationDuration = 1.0;
        [missile2 startAnimating];
        missile3.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"bubble5.png"],
                                    [UIImage imageNamed:@"bubble4.png"],
                                    [UIImage imageNamed:@"bubble3.png"],
                                    [UIImage imageNamed:@"bubble2.png"],
                                    [UIImage imageNamed:@"bubble.png"], nil];
        missile3.animationDuration = 1.0;
        [missile3 startAnimating];
        missile4.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"bubble5.png"],
                                    [UIImage imageNamed:@"bubble4.png"],
                                    [UIImage imageNamed:@"bubble3.png"],
                                    [UIImage imageNamed:@"bubble2.png"],
                                    [UIImage imageNamed:@"bubble.png"], nil];
        missile4.animationDuration = 1.0;
        [missile4 startAnimating];
        missile5.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"bubble5.png"],
                                    [UIImage imageNamed:@"bubble4.png"],
                                    [UIImage imageNamed:@"bubble3.png"],
                                    [UIImage imageNamed:@"bubble2.png"],
                                    [UIImage imageNamed:@"bubble.png"], nil];
        missile5.animationDuration = 1.0;
        [missile5 startAnimating];
        
        
    }
    //egg animation
    egg.animationImages = [NSArray arrayWithObjects:
                           [UIImage imageNamed:@"dragon egg.png"],
                           [UIImage imageNamed:@"dragon egg2.png"],
                           [UIImage imageNamed:@"dragon egg3.png"],
                           [UIImage imageNamed:@"dragon egg4.png"], nil];
    egg.animationDuration = 1.0;
    [egg startAnimating];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.dragon = nil;
    self.back = nil;
    self.pause = nil;
    self.resume = nil;
    self.start = nil;
    self.missile = nil;
    self.missile1 = nil;
    self.missile2 = nil;
    self.missile3 = nil;
    self.missile4 = nil;
    self.missile5 = nil;
    self.egg = nil;
    self.cScore = nil;
    self.hiScore = nil;
    self.restart = nil;
    self.b1 = nil;
    self.b2 = nil;
    self.bonusL = nil;
    
}

// Override to allow orientations other than the default portrait orientation.

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return ((interfaceOrientation == UIInterfaceOrientationPortrait)|UIInterfaceOrientationPortrait);
}
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)){
        adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierLandscape;
    }
    else{
        adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
    }
}


@end