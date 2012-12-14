//
//  MainMenuLayer.m
//  BrainQuiz
//
//  Created by zhou Yangbo on 11-8-13.
//  Copyright 2011 GODPAPER. All rights reserved.
//

#import "MainMenuLayer.h"
#import "SceneManager.h"


@implementation MainMenuLayer

-(id)init
{
	self = [super init];
	//Main menu title
	CCLabelTTF *title = [CCLabelTTF labelWithString:@"Welcome to Brain Quiz" fontName:@"Marker Felt" fontSize:24];
	
	title.position = ccp(160,400);
	[self addChild:title];
	
	//Main menu list
	CCMenuItemFont *startNew = [CCMenuItemFont itemFromString:@"New Game" target:self selector:@selector(onNewGame:)];
	CCMenuItemFont *settings = [CCMenuItemFont itemFromString:@"Settings" target:self selector:@selector(onSettings:)];
	CCMenuItemFont *credits = [CCMenuItemFont itemFromString:@"Credit" target:self selector:@selector(onCredits:)];
	CCMenuItemFont *help = [CCMenuItemFont itemFromString:@"Help" target:self selector:@selector(onHelp:)];
	CCMenu *mainMenu = [CCMenu menuWithItems:startNew,settings,credits,help,nil];
	
	mainMenu.position = ccp(160,200);
	[mainMenu alignItemsVerticallyWithPadding:40.0f];
	[self addChild:mainMenu z:2];
	
	
	return self;
}

-(void)onNewGame:(id)sender
{
	[SceneManager goPlay];
}
-(void)onSettings:(id)sender
{
	[SceneManager goSettings];
}
-(void)onCredits:(id)sender
{
	[SceneManager goCredit];
}
-(void)onHelp:(id)sender
{
	[SceneManager goHelp];
}




@end
