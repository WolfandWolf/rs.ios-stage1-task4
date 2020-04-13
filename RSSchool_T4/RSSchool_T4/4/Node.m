//
//  Node.m
//  RSSchool_T4
//
//  Created by Anton Rasoha on 4/12/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import "Node.h"

@implementation Node

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.left = nil;
        self.right = nil;
        self.val = @0;
    }
    return self;
}

@end
