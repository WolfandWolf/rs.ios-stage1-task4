//
//  Node.h
//  RSSchool_T4
//
//  Created by Anton Rasoha on 4/12/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property(nonatomic, strong) Node *left;
@property(nonatomic, strong) Node *right;
@property(nonatomic, strong) NSNumber *val;

@end

