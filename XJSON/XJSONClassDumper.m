//
//  XJSONClassDumper.m
//  XJSON
//
//  Created by Gabriel Lumbi on 2014-08-05.
//  Copyright (c) 2014 Wherecloud Inc. All rights reserved.
//

#import "XJSONClassDumper.h"
#import <objc/runtime.h>


@implementation XJSONClassDumper

+(NSString*)methodDumpForClass:(Class)c{
    
    NSString* dump = @"";
    
    Method * methods = nil;
    unsigned int methodCount = 0;
    
    methods = class_copyMethodList(c, &methodCount);
    
    for(int i = 0; i < methodCount; ++i){
        NSString* methodName = [NSString stringWithUTF8String:sel_getName(method_getName(methods[i]))];
        dump = [dump stringByAppendingString:[NSString stringWithFormat:@"- %@ \n",methodName]];
    }
    
    return dump;
}

+(NSString*)propertyDumpForClass:(Class)c{
    
    NSString* dump = @"";
    
    objc_property_t * properties = nil;
    unsigned int propCount = 0;
    
    properties = class_copyPropertyList(c, &propCount);
    
    for(int i = 0; i < propCount; ++i){
        NSString* propName = [NSString stringWithUTF8String:property_getName(properties[i])];
        dump = [dump stringByAppendingString:[NSString stringWithFormat:@"@property %@ \n", propName]];
    }
    
    return dump;
}


@end
