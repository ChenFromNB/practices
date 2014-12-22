//
//  AutoDictionary.m
//  MessageForward
//
//  Created by Chen on 14/12/22.
//  Copyright (c) 2014年 Chen. All rights reserved.
//

#import "AutoDictionary.h"
#import <objc/runtime.h>

@interface  AutoDictionary()

@property (strong, nonatomic) NSMutableDictionary *backingStore;

@end

@implementation AutoDictionary

@dynamic string, number;

- (id)init
{
    if (self = [super init]) {
        _backingStore = [NSMutableDictionary new];
    }
    return self;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    NSString *selectorString = NSStringFromSelector(sel);
    if ([selectorString hasPrefix:@"set"]) {
        class_addMethod(self, sel, (IMP)autoDicSetter, "v@:@");
    } else {
        class_addMethod(self, sel, (IMP)autoDicGetter, "@@:");
    }
    return YES;
}

id autoDicGetter(id self, SEL _cmd)
{
    AutoDictionary *typedSelf = (AutoDictionary *)self;
    NSMutableDictionary *backingstore = typedSelf.backingStore;
    NSString *key = NSStringFromSelector(_cmd);
    return [backingstore objectForKey:key];
}

void autoDicSetter(id self, SEL _cmd, id value)
{
    AutoDictionary *typedSelf = (AutoDictionary *)self;
    NSMutableDictionary *backingStore = typedSelf.backingStore;
    NSString *selectorString = NSStringFromSelector(_cmd);
    NSMutableString *key = [selectorString mutableCopy];
    [key deleteCharactersInRange:NSMakeRange(key.length - 1, 1)];
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    NSString *lowercaseFirstChar = [[key substringToIndex:1] lowercaseString];
    [key replaceCharactersInRange:NSMakeRange(0, 1)
                       withString:lowercaseFirstChar];
    if (value) {
        [backingStore setObject:value forKey:key];
    } else {
        [backingStore removeObjectForKey:key];
    }
}

@end
