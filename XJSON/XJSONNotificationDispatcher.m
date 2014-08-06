//
//  XJSONNotificationDispatcher.m
//  XJSON
//
//  Created by Gabriel Lumbi on 2014-08-06.
//  Copyright (c) 2014 Wherecloud Inc. All rights reserved.
//

#import "XJSONNotificationDispatcher.h"
#import "XJSONNotifications.h"
#import "XJSONSourceCodeDocument.h"
#import "XJSONFileExtensions.h"

@interface XJSONNotificationDispatcher ()

@property(weak) NSNotificationCenter* notificationCenter;

@end

@implementation XJSONNotificationDispatcher


+(XJSONNotificationDispatcher*) sharedDispatcher{
    static XJSONNotificationDispatcher* instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[XJSONNotificationDispatcher alloc] init];
    });
    return instance;
}

-(void)dealloc{
    [self.notificationCenter removeObserver:self];
}

-(void)listenToNotificationCenter:(NSNotificationCenter*)notificationCenter{
    if(self.notificationCenter){
        [self.notificationCenter removeObserver:self];
    }

    [notificationCenter addObserver:self selector:@selector(didReceiveNotification:) name:nil object:nil];
    
    self.notificationCenter = notificationCenter;
}

-(void)didReceiveNotification:(NSNotification*)notif{
    
    if([[notif name] isEqualToString:@"IDEEditorDocumentDidSaveNotification"]){
        XJSONSourceCodeDocument* document = [[XJSONSourceCodeDocument alloc] initWithIDESourceCodeDocument:[notif object]];
        
        NSDictionary* userInfo = @{XJSONEditorDocumentSaveOperationType: [notif userInfo][@"IDEEditorDocumentSaveOperationType"],
                                   XJSONEditorDocumentSaveSucceededKey: [notif userInfo][@"IDEEditorDocumentSaveSucceededKey"]
                                   };
        [self.notificationCenter postNotificationName:XJSONEditorDocumentDidSaveNotification object:document userInfo:userInfo];
        
        if([[XJSONFileExtensions sharedFileExtensions] containsFileExtension:document.fileURL.pathExtension]){
            [self.notificationCenter postNotificationName:XJSONJSONTypeDocumentDidSaveNotification object:document userInfo:userInfo];
        }
    }
}

@end
