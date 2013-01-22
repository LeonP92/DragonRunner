//
//  DragonRunnerAppDelegate.h
//  DragonRunner
//
//  Created by Leon on 6/4/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <iAd/iAd.h>

@class DragonRunnerViewController;

@interface DragonRunnerAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet DragonRunnerViewController *viewController;

@end
