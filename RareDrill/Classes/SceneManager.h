//
//  SceneManager.h
//  BrainQuiz
//
//  Created by zhou Yangbo on 11-8-13.
//  Copyright 2011 GODPAPER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainMenuLayer.h"


@interface SceneManager : NSObject {
	
}

+(void) goMainMenu;
+(void) goPlay;
+(void) goCredit;
+(void) goHelp;
+(void) goSettings;

+(void) goPrevious;
+(void) goNext;

@end
