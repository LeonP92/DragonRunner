//
//  DragonRunnerViewController.h
//  DragonRunner
//
//  Created by Leon on 6/4/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <iAd/iAd.h>

@interface DragonRunnerViewController : UIViewController {
    IBOutlet UIButton *play;
    IBOutlet UIButton *settings;
    IBOutlet UIButton *info;
    
    CAKeyframeAnimation *buttonAction;
}

@property(nonatomic, retain) IBOutlet UIButton *play;
@property(nonatomic, retain) IBOutlet UIButton *settings;
@property(nonatomic, retain) IBOutlet UIButton *info;

-(IBAction) play1;
-(IBAction) settings1;
-(IBAction) info1;
@end
