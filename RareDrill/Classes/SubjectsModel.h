//
//  SubjectsModel.h
//  BrainQuiz
//
//  Created by zhou Yangbo on 11-8-20.
//  Copyright 2011 GODPAPER. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SubjectsModel : NSObject {
	
}

+(SubjectsModel *)sharedInstance;
+(int)getLevel;
+(void)setLevel:(int)value;

+(NSMutableArray *)getData;
+(void)setData:(NSMutableArray *)value;

@end
