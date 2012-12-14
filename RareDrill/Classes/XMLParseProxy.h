//
//  XMLParseProxy.h
//  BrainQuiz
//
//  Created by zhou Yangbo on 11-8-15.
//  Copyright 2011 GODPAPER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubjectVO.h"

@class SubjectVO;

@interface XMLParseProxy : NSObject <NSXMLParserDelegate> {
	// an ad hoc string to hold element value
	NSMutableString *currentElementValue;
	
	NSMutableArray *titles;
	NSMutableArray *images;
	NSMutableArray *results;
	NSMutableArray *selections;
	
//	
	//subject object;
	SubjectVO *subject;
	//array of subject objects.
	NSMutableArray *subjects;
	
}

@property(nonatomic,retain) SubjectVO *subject;
@property(nonatomic,retain) NSMutableArray *subjects;

-(void)parseXMLFile:(NSString *)path;

@end
