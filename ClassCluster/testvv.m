//
//  testvv.m
//  TESTVIEW
//
//  Created by Chen on 14/12/12.
//  Copyright (c) 2014年 Chen. All rights reserved.
//

#import "testvv.h"

@interface TestViewIOS6 : testvv
@end

@implementation TestViewIOS6
- (void)drawRect: (CGRect)rect
{
    /* Custom iOS6 drawing code */
}

@end


@interface TestViewIOS7 : testvv
@end

@implementation TestViewIOS7
- (void)drawRect: (CGRect)rect
{
    /* Custom iOS7 drawing code */
}

@end

@implementation testvv

+ (id)alloc
{
    if ([self class]== [testvv class])
    {
        if ([[[UIDevice currentDevice] systemVersion] integerValue] < 7.0)
        {
            return [TestViewIOS6 alloc];
        }
        else
        {
            return [TestViewIOS7 alloc];
        }
    }
    else
    {
        return [super alloc];
    }
}

@end

