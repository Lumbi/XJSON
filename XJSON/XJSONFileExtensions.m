//
//  XJSONFileExtensions.m
//  XJSON
//
//  Created by Gabriel Lumbi on 2014-08-06.
//  Copyright (c) 2014 Wherecloud Inc. All rights reserved.
//

#import "XJSONFileExtensions.h"

@interface XJSONFileExtensions ()

@property(nonatomic, strong) NSMutableArray* fileExts;

@end

@implementation XJSONFileExtensions

+(id) sharedFileExtensions{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

-(id)init{
    if(self = [super init]){
        self.fileExts = [NSMutableArray new];
        [self.fileExts addObject:@"style"];
        [self.fileExts addObject:@"json"];
        [self.fileExts addObject:@"mappings"];
    }
    return self;
}

-(void) addFileExtension:(NSString*)fileExtension{
    [self.fileExts addObject:fileExtension];
}

-(BOOL) containsFileExtension:(NSString*)fileExtension{
    return [self.fileExts containsObject:fileExtension];
}

-(void) removeFileExtension:(NSString*)fileExtension{
    [self.fileExts removeObject:fileExtension];
}

@end
