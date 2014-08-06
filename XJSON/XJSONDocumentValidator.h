//
//  XJSONDocumentValidator.h
//  XJSON
//
//  Created by Gabriel Lumbi on 2014-08-06.
//  Copyright (c) 2014 Wherecloud Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XJSONSourceCodeDocument.h"

@interface XJSONDocumentValidator : NSObject

@property(nonatomic, copy) void(^jSONDocumentDidFailValidationBlock) (XJSONSourceCodeDocument*, NSError*);

-(id)initWithNotificationCenter:(NSNotificationCenter*)notificationCenter;

@end
