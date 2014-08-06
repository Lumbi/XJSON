//
//  XJSONFileExtensions.h
//  XJSON
//
//  Created by Gabriel Lumbi on 2014-08-06.
//  Copyright (c) 2014 Wherecloud Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJSONFileExtensions : NSObject

+(id) sharedFileExtensions;

-(void) addFileExtension:(NSString*)fileExtension;
-(BOOL) containsFileExtension:(NSString*)fileExtension;
-(void) removeFileExtension:(NSString*)fileExtension;

@end
