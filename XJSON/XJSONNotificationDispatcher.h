//
//  XJSONNotificationDispatcher.h
//  XJSON
//
//  Created by Gabriel Lumbi on 2014-08-06.
//  Copyright (c) 2014 Wherecloud Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJSONNotificationDispatcher : NSObject

+(XJSONNotificationDispatcher*) sharedDispatcher;

-(void)listenToNotificationCenter:(NSNotificationCenter*)notificationCenter;

@end