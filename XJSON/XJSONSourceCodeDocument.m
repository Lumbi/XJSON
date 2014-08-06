//
//  XJSONSourceCodeDocument.m
//  XJSON
//
//  Created by Gabriel Lumbi on 2014-08-05.
//  Copyright (c) 2014 Wherecloud Inc. All rights reserved.
//

#import "XJSONSourceCodeDocument.h"

@implementation XJSONSourceCodeDocument

-(id)initWithIDESourceCodeDocument:(id)document{
    if(self = [super init]){
        if([document respondsToSelector:@selector(fileURL)]){
            self.fileURL = [document fileURL];
        }
    }
    return self;
}

-(NSString *)extension{
    if(self.fileURL){
        return [self.fileURL pathExtension];
    }
    return nil;
}

@end
