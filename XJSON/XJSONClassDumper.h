//
//  XJSONClassDumper.h
//  XJSON
//
//  Created by Gabriel Lumbi on 2014-08-05.
//  Copyright (c) 2014 Wherecloud Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJSONClassDumper : NSObject

+(NSString*)methodDumpForClass:(Class)c;

+(NSString*)propertyDumpForClass:(Class)c;

@end
