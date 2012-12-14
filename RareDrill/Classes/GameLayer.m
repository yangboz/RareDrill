//
//  GameLayer.m
//  BrainQuiz
//
//  Created by zhou Yangbo on 11-8-14.
//  Copyright 2011 GODPAPER. All rights reserved.
//

#import "GameLayer.h"
#import "SceneManager.h"
#import "SubjectVO.h"
#import "LevelTransitionLayer.h"
#import "SubjectsModel.h"

@implementation GameLayer

-(id)init
{		
	self = [super init];
	if (!self) {
		return nil;
	}
	// init view
	//
	CCMenuItemFont *previous = [CCMenuItemFont itemFromString:@"<--" target:self selector:@selector(goPrevious:)];
	CCMenuItemFont *next = [CCMenuItemFont itemFromString:@"-->" target:self selector:@selector(goNext:)];
	CCMenuItemFont *back = [CCMenuItemFont itemFromString:@"back" target:self selector:@selector(goBack:)];
	CCMenu *menu = [CCMenu menuWithItems:previous,back,next,nil];
	
	menu.position = ccp(160,50);
	[menu alignItemsHorizontallyWithPadding:10.0f];
	[self addChild:menu];
	
	//
	NSMutableArray *results = [SubjectsModel getData];
	
	NSLog(@"No errors - subjects count : %i", [results count]);
	//NSMutableArray *subjectsData = [[SubjectsModel sharedInstance] data];
	//	NSLog(@"Get results from Model:%i",[subjectsData count]);
	int currentLevel = [SubjectsModel getLevel];
	currentLevel -= 1;//Array index based on 0; 
	//Add subject id:
	NSString *subjectIndex = [NSString stringWithFormat:@"%d",[SubjectsModel getLevel]];
	NSLog(@"subjectIndex is: %@",subjectIndex);
	CCLabelTTF *indexLabel = [CCLabelTTF labelWithString:subjectIndex fontName:@"Marker Felt" fontSize:16];
	indexLabel.position = ccp(160,440);
	[self addChild:indexLabel];
	
	//Add subject title:
	
	NSString *subjectTitle = [(SubjectVO *)[results objectAtIndex:currentLevel] title];
	//trim whitspace and table new line
	NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
	subjectTitle = [subjectTitle stringByTrimmingCharactersInSet:whitespace];
	NSLog(@"Title is: %@",subjectTitle);
	CCLabelTTF *titleLabel = [CCLabelTTF labelWithString:subjectTitle fontName:@"Marker Felt" fontSize:16];
	titleLabel.position = ccp(160,400);
	[self addChild:titleLabel];
	
	//Add subject image:
	NSString *imagePath = [(SubjectVO *)[results objectAtIndex:currentLevel] image];
	NSLog(@"Image is: %@",imagePath);
	CCSprite *subjectImage = [CCSprite spriteWithFile:imagePath];
	subjectImage.position = ccp(160,300);
	[self addChild:subjectImage];
	
	//Add subject selections:
	NSString *itemA = [(SubjectVO *)[results objectAtIndex:currentLevel] selections];
	//split string to array by the key ","
	NSArray *itemAs = [itemA componentsSeparatedByString:@","];
	//NSLog(@"itemAs: %@",[itemAs objectAtIndex:0]);
	CCMenuItemFont *menuItemA = [CCMenuItemFont itemFromString:[itemAs objectAtIndex:0] target:self selector:@selector(goCheckResult:)];
	CCMenuItemFont *menuItemB = [CCMenuItemFont itemFromString:[itemAs objectAtIndex:1] target:self selector:@selector(goCheckResult:)];
	CCMenuItemFont *menuItemC = [CCMenuItemFont itemFromString:[itemAs objectAtIndex:2] target:self selector:@selector(goCheckResult:)];
	CCMenuItemFont *menuItemD = [CCMenuItemFont itemFromString:[itemAs objectAtIndex:3] target:self selector:@selector(goCheckResult:)];
	CCMenu *selections = [CCMenu menuWithItems:menuItemA,menuItemB,menuItemC,menuItemD,nil];
	
	selections.position = ccp(160,100);
	[selections alignItemsHorizontallyWithPadding:10.0f];
	[self addChild:selections];
	
	
	//Add subject result check busniess:
	NSString *checkResult = [(SubjectVO *)[results objectAtIndex:currentLevel] result];
	NSLog(@"checkResult is: %@",checkResult);
	
	return self;
}

-(void)goBack:(id)sender
{
	[SceneManager goMainMenu];
}

-(void)goPrevious:(id)sender
{
	[SceneManager goPrevious];
}

-(void)goNext:(id)sender
{
	[SceneManager goNext];
}

-(void)goCheckResult:(id)sender
{
    CCMenuItem *item = (CCMenuItem *)sender;
    item.isEnabled  = NO;
}

@end
