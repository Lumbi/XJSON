//
//  XJSONDocumentValidator.m
//  XJSON
//
//  Created by Gabriel Lumbi on 2014-08-06.
//  Copyright (c) 2014 Wherecloud Inc. All rights reserved.
//

#import "XJSONNotifications.h"
#import "XJSONDocumentValidator.h"
#import "XJSONSourceCodeDocument.h"

#import <JSONKit/JSONKit.h>

@interface XJSONDocumentValidator ()

@property(weak) NSNotificationCenter* notificationCenter;

@property(strong) JSONDecoder* jSONDecoder;

@end

@implementation XJSONDocumentValidator

-(id)initWithNotificationCenter:(NSNotificationCenter*)notificationCenter{
    if(self = [super init]){
        self.notificationCenter = notificationCenter;
        
        [self.notificationCenter addObserver:self selector:@selector(jsonDocumentDidSave:) name:XJSONJSONTypeDocumentDidSaveNotification object:nil];
        
        self.jSONDecoder = [JSONDecoder decoderWithParseOptions:JKParseOptionComments];
    }
    return self;
}

-(void)dealloc{
    [self.notificationCenter removeObserver:self];
}

-(void)jsonDocumentDidSave:(NSNotification*)notif{
    BOOL successfullySaved = [[notif userInfo][XJSONEditorDocumentSaveSucceededKey] boolValue];
    if(successfullySaved){
        XJSONSourceCodeDocument* document = [notif object];
        if(document && document.fileURL){
            NSError* error;
            BOOL documentIsValid = [self validateDocument:document error:&error];
            if(!documentIsValid){
                if(self.jSONDocumentDidFailValidationBlock){
                    self.jSONDocumentDidFailValidationBlock(document, error);
                }
            }
        }
    }
}


-(BOOL)validateDocument:(XJSONSourceCodeDocument*)document error:(NSError**)error{
    
    [self.jSONDecoder objectWithData:[NSData dataWithContentsOfURL:document.fileURL] error:error];
    return !*error;
}

@end
