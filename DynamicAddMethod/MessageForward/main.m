//
//  main.m
//  MessageForward
//
//  Created by Chen on 14/12/22.
//  Copyright (c) 2014年 Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AutoDictionary.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AutoDictionary *dic = [AutoDictionary new];
        dic.string = @"Hello World";
        NSLog(@"%@",dic.string);
    }
    return 0;
}
