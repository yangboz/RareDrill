//
//  SubjectVO.m
//  BrainQuiz
//
//  Created by zhou Yangbo on 11-8-14.
//  Copyright 2011 GODPAPER. All rights reserved.
//

#import "SubjectVO.h"


@implementation SubjectVO

@synthesize image;
@synthesize title;
@synthesize selections;
@synthesize result;

- (void) dealloc {
	
	[image release];
	[title release];
	[selections release];
	[result release];
	
	[super dealloc];
}

@end
