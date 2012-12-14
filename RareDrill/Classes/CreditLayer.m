//
//  CreditLayer.m
//  BrainQuiz
//
//  Created by zhou Yangbo on 11-8-14.
//  Copyright 2011 GODPAPER. All rights reserved.
//

#import "CreditLayer.h"
#import "SceneManager.h"


@implementation CreditLayer

-(id)init
{		
	self = [super init];
	if (!self) {
		return nil;
	}
	CCMenuItemFont *back = [CCMenuItemFont itemFromString:@"back" target:self selector:@selector(goBack:)];
	CCMenu *menu = [CCMenu menuWithItems:back,nil];
	
	menu.position = ccp(160,150);
	[self addChild:menu];
	
	return self;
}

-(void)goBack:(id)sender
{
	[SceneManager goMainMenu];
}

@end
