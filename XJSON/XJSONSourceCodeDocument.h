//
//  XJSONSourceCodeDocument.h
//  XJSON
//
//  Created by Gabriel Lumbi on 2014-08-05.
//  Copyright (c) 2014 Wherecloud Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJSONSourceCodeDocument : NSObject

@property(strong) NSURL* fileURL;
@property(readonly) NSString* extension;

-(id)initWithIDESourceCodeDocument:(id)document;

@end
