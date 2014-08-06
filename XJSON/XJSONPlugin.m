//
//  XJSONMain.m
//  XJSON
//
//  Created by Gabriel Lumbi on 2014-08-05.
//  Copyright (c) 2014 Wherecloud Inc. All rights reserved.
//

#import "XJSONPlugin.h"
#import "XJSONClassDumper.h"
#import "XJSONNotificationDispatcher.h"
#import "XJSONSourceCodeDocument.h"
#import "XJSONDocumentValidator.h"

@interface XJSONPlugin ()

@property(strong) XJSONDocumentValidator* jSONDocumentValidator;

@end

@implementation XJSONPlugin

+ (void)pluginDidLoad:(NSBundle*)bundle
{
    static id sharedPlugin = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedPlugin = [[self alloc] init];
        NSLog(@"XJSON Plugin Loaded");
	});
}


-(id)init{
    if(self = [super init]){
        [[XJSONNotificationDispatcher sharedDispatcher] listenToNotificationCenter:[NSNotificationCenter defaultCenter]];
        
        self.jSONDocumentValidator = [[XJSONDocumentValidator alloc] initWithNotificationCenter:[NSNotificationCenter defaultCenter]];
        self.jSONDocumentValidator.jSONDocumentDidFailValidationBlock = ^(XJSONSourceCodeDocument* document, NSError* error){
            NSLog(@"XJSON Error in file %@", [document.fileURL absoluteString]);
            NSLog(@"%@",error);
            [[NSAlert alertWithError:error] runModal];
        };
    }
    return self;
}

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)applicationDidFinishLaunching:(NSNotification*)notification
{
    
}

@end
