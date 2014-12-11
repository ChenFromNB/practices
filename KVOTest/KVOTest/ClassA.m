//
//  ClassA.m
//  KVOTest
//
//  Created by Chen on 14/12/12.
//  Copyright (c) 2014年 Chen. All rights reserved.
//

#import "ClassA.h"
#import "ClassB.h"

@implementation ClassA

- (id)init
{
    if (self = [super init]) {
        ClassB *b = [[ClassB alloc] init];
        [b addObserver:self
            forKeyPath:@"stringB"
                options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                context:nil];
        b.stringB = @"test";
        NSLog(@"123");
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:@"stringB"]) {
        NSLog(@"got it!");
        [object removeObserver:self forKeyPath:@"stringB"];
    }
}



@end
