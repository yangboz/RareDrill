//
//  SplashLayer.m
//  BrainQuiz
//
//  Created by zhou Yangbo on 11-8-13.
//  Copyright 2011 GODPAPER. All rights reserved.
//

#import "SplashLayer.h"
#import "MainMenuLayer.h"
#import "SubjectsModel.h"

@implementation SplashLayer


+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SplashLayer *layer = [SplashLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if ((self=[super init])) {
		//Device type to auto scale
		NSString *deviceType = [UIDevice currentDevice].model;
		NSLog(@"Current device type is:%@",deviceType);
		
		if([deviceType isEqualToString:@"iPad"] || [deviceType isEqualToString:@"iPad Simulator"] ){
			[[CCDirector sharedDirector] setContentScaleFactor:1];
		} else {
			if([[UIScreen mainScreen] respondsToSelector:NSSelectorFromString(@"scale")])
			{
				if ([[UIScreen mainScreen] scale] < 1.1){
					[[CCDirector sharedDirector] setContentScaleFactor:1];
				}   
				if ([[UIScreen mainScreen] scale] > 1.9){
					//retina display
					[[CCDirector sharedDirector] setContentScaleFactor:2];
				}
			}
			else {
				[[CCDirector sharedDirector] setContentScaleFactor:1];
			}   
		}
		//
		self.isTouchEnabled = YES;
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		//add a background
		CCSprite *background = [CCSprite spriteWithFile:@"Default.png"];
		background.position = ccp(winSize.width/2,winSize.height/2);
		[self addChild:background];
		
		//XML parse triggle here.
		parser = [XMLParseProxy new];
//		NSURL *url = [NSURL URLWithString:@"http://www.lookbackon.com/API/BrainQuiz/data.xml"];
		//NSURL *url = [NSURL fileURLWithPath:@"data.xml"];
		//
//		[parser parseXMLFile:url];
        [parser parseXMLFile:@"data"];
		NSMutableArray *results = [SubjectsModel getData];
		NSLog(@"No errors - subjects count : %i", [results count]);
		//Time to send to menu screen(delat is splash screeen time)
		[self runAction:[CCSequence actions:
						 [CCDelayTime actionWithDuration:1],
						 [CCCallFunc actionWithTarget:self selector:@selector(launchMenuScene)],
						 nil
						 ]];
		 }
	//
	return self;
}
		 
-(void)launchMenuScene
{
	//transition to main game screen
	[[CCDirector sharedDirector] replaceScene:[CCTransitionZoomFlipX transitionWithDuration:1.0f scene:[MainMenuLayer node]]];
}
		 
-(void)dealloc
{
	[super dealloc];		
}

@end
