//
//  InfoViewController.h
//  DragonRunner
//
//  Created by Leon on 6/5/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <iAd/iAd.h>


@interface InfoViewController : UIViewController {
    IBOutlet UIButton *back;
}

@property(nonatomic, retain) IBOutlet UIButton *back;

-(IBAction) back1;

@end
