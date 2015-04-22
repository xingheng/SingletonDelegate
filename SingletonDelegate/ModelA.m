//
//  ModelA.m
//  SingletonDelegate
//
//  Created by Wei Han on 4/22/15.
//  Copyright (c) 2015 Han Wei. All rights reserved.
//

#import "ModelA.h"

@implementation ModelA


#pragma mark - GlobalManagerDelegate

- (void)onGlobalManagerCallback:(GlobalManager *)manager
{
    NSLog(@"%@, %s, manager: %@", NSStringFromClass([self class]), __func__, manager);
}

@end
