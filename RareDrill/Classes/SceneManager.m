//
//  SceneManager.m
//  BrainQuiz
//
//  Created by zhou Yangbo on 11-8-13.
//  Copyright 2011 GODPAPER. All rights reserved.
//
#import "SceneManager.h"
#import "GameLayer.h"
#import "SettingsLayer.h"
#import "CreditLayer.h"
#import "HelpLayer.h"
#import "LevelTransitionLayer.h"
#import "GameLayer.h"
#import "SubjectsModel.h"
#import "HCUPPanelScene.h"

@interface SceneManager()

+(void) go:(CCLayer *) layer;
+(CCScene *)wrap:(CCLayer *) layer;

@end



@implementation SceneManager
	
+(void) goMainMenu{
	
	CCLayer *layer = [MainMenuLayer node];
	//CCLayer *layer = [HCUPPanelScene scene];
	[SceneManager go: layer];

}

+(void) go:(CCLayer *)layer{
	
	CCDirector *director = [CCDirector sharedDirector];
	CCScene *newScene = [SceneManager wrap:layer];
	if ([director runningScene ]) {
		//transition to main game screen
		[director replaceScene:[CCTransitionZoomFlipX transitionWithDuration:1.0f scene:newScene]];
	}else{
		[director runWithScene:newScene];
	}
}
		 
+(CCScene *) wrap: (CCLayer *)layer{

	CCScene *newScene = [CCScene node];
	[newScene addChild:layer];
	return newScene;
}

+(void) goPlay
{
	CCLayer *layer = [GameLayer node];
	[SceneManager go: layer];
}

+(void) goSettings
{
	CCLayer *layer = [SettingsLayer node];
	[SceneManager go: layer];
}

+(void) goCredit
{
	CCLayer *layer = [CreditLayer node];
	[SceneManager go: layer];
}

+(void) goHelp
{
	CCLayer *layer = [HelpLayer node];
	[SceneManager go: layer];
}

+(void) goPrevious
{
	//
	//NSLog(@"level:%i",[SubjectsModel getLevel]);
	int currentLevel = [SubjectsModel getLevel];
	if (currentLevel>1) {
		currentLevel--;
		[SubjectsModel setLevel:currentLevel];
		NSLog(@"level:%i",[SubjectsModel getLevel]);
		//
		CCLayer *Tlayer = [LevelTransitionLayer node];
		[SceneManager go: Tlayer];
		//
		CCLayer *Glayer = [GameLayer node];
		[SceneManager go: Glayer];
	}
}

+(void) goNext
{
	//
	//NSLog(@"level:%i",[SubjectsModel getLevel]);
	int currentLevel = [SubjectsModel getLevel];
	if (currentLevel < [[SubjectsModel getData] count]) {
		currentLevel++;
		[SubjectsModel setLevel:currentLevel];
		//NSLog(@"level:%i",[SubjectsModel getLevel]);
		CCLayer *Tlayer = [LevelTransitionLayer node];
		[SceneManager go: Tlayer];
		//
		CCLayer *Glayer = [GameLayer node];
		[SceneManager go: Glayer];
	}	
}

@end
