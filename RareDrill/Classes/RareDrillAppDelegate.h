//
//  RareDrillAppDelegate.h
//  RareDrill
//
//  Created by zhou Yangbo on 11-9-4.
//  Copyright GODPAPER 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface RareDrillAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
