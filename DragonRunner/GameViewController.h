//
//  GameViewController.h
//  DragonRunner
//
//  Created by Leon on 6/5/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <iAd/iAd.h>


@interface GameViewController : UIViewController<ADBannerViewDelegate>{
    IBOutlet UIButton *back;
    IBOutlet UIButton *pause;
    IBOutlet UIButton *start;
    IBOutlet UIButton *resume;
    IBOutlet UIButton *restart;
    
    IBOutlet UIImageView *dragon;
    
    //missiles
    IBOutlet UIImageView *missile;
    IBOutlet UIImageView *missile1;
    IBOutlet UIImageView *missile2;
    IBOutlet UIImageView *missile3;
    IBOutlet UIImageView *missile4;
    IBOutlet UIImageView *missile5;
    
    //Bonus Item
    IBOutlet UIImageView *egg;
    //Bonus label
    IBOutlet UILabel *bonusL;
    
    //Background
    IBOutlet UIImageView *b1;
    IBOutlet UIImageView *b2;
    
    NSInteger highScore;
    int score;
    NSInteger stageValue;
    int bonus;
    
    IBOutlet UILabel *cScore;
    IBOutlet UILabel *hiScore;
    
    CGPoint dragonVelocity;
    CGPoint fVelocity;
    CGPoint f2Velocity;
    CGPoint f3Velocity;
    CGPoint f4Velocity;
    CGPoint f5Velocity;
    CGPoint f6Velocity;
    CGPoint eggM;
    
    //iAd
    ADBannerView *adView;
    BOOL bannerIsVisible;

}

@property(nonatomic, retain) IBOutlet UIButton *start;
@property(nonatomic, retain) IBOutlet UIButton *back;
@property(nonatomic, retain) IBOutlet UIButton *pause;
@property(nonatomic, retain) IBOutlet UIButton *resume;
@property(nonatomic, retain) IBOutlet UIButton *restart;
@property(nonatomic, retain) IBOutlet UIImageView *dragon;
@property(nonatomic, retain) IBOutlet UIImageView *missile;
@property(nonatomic, retain) IBOutlet UIImageView *missile1;
@property(nonatomic, retain) IBOutlet UIImageView *missile2;
@property(nonatomic, retain) IBOutlet UIImageView *missile3;
@property(nonatomic, retain) IBOutlet UIImageView *missile4;
@property(nonatomic, retain) IBOutlet UIImageView *missile5;
@property(nonatomic, retain) IBOutlet UIImageView *egg;
@property(nonatomic, retain) IBOutlet UILabel *bonusL;
@property(nonatomic, retain) IBOutlet UILabel *cScore; 
@property(nonatomic, retain) IBOutlet UILabel *hiScore;

@property(nonatomic,retain) IBOutlet UIImageView *b1;
@property(nonatomic, retain) IBOutlet UIImageView *b2;

@property(nonatomic) NSInteger highScore; 
@property(nonatomic) NSInteger stageValue;

@property(nonatomic, assign) BOOL bannerIsVisible;

-(IBAction) back1;
-(IBAction) pause1;
-(IBAction) resume1;
-(IBAction) start1;
-(IBAction) restart1;
@end
