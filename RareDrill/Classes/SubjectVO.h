//
//  SubjectVO.h
//  BrainQuiz
//
//  Created by zhou Yangbo on 11-8-14.
//  Copyright 2011 GODPAPER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface SubjectVO : NSObject {
	
	NSString *image;
	NSString *title;
	NSString *selections;
	NSString *result;
	
}

@property(nonatomic,retain) NSString *image;
@property(nonatomic,retain) NSString *title;
@property(nonatomic,retain) NSString *selections;
@property(nonatomic,retain) NSString *result;

@end
