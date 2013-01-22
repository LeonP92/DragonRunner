//
//  SettingsViewController.h
//  DragonRunner
//
//  Created by Leon on 6/5/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <iAd/iAd.h>
#import <GameKit/GameKit.h>


@interface SettingsViewController : UIViewController<GKLeaderboardViewControllerDelegate> {
    IBOutlet UIButton *back;
    IBOutlet UIButton *stage;
    IBOutlet UIButton *stage1;
    IBOutlet UIButton *stage2;
    IBOutlet UIButton *submit;
    
    IBOutlet UILabel *high;
    IBOutlet UILabel *stages;
    NSInteger stageValue;
    NSInteger highS;
}
@property(nonatomic, retain) IBOutlet UIButton *back;
@property(nonatomic, retain) IBOutlet UIButton *stage;
@property(nonatomic, retain) IBOutlet UIButton *stage1;
@property(nonatomic, retain) IBOutlet UIButton *stage2;
@property(nonatomic, retain) IBOutlet UILabel *stages;
@property(nonatomic, retain) IBOutlet UILabel *high;
@property(nonatomic, retain) IBOutlet UIButton *submit;
@property(nonatomic) NSInteger stageValue;
@property(nonatomic) NSInteger highS;

-(IBAction) back1;
-(IBAction) stage11;
-(IBAction) stage12;
-(IBAction) stage13;
-(IBAction) submit1;
@end
