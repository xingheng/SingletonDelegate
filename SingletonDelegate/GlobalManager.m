//
//  GlobalManager.m
//  SingletonDelegate
//
//  Created by Wei Han on 4/22/15.
//  Copyright (c) 2015 Han Wei. All rights reserved.
//

#import "GlobalManager.h"

@implementation GlobalManager

+ (GlobalManager *)sharedInstance
{
    static GlobalManager *gManager;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) {
        gManager = [[GlobalManager alloc] init];
    });
    return gManager;
}

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)doSomeStuff
{
#if CASEA
    if (self.delegate)
        [self.delegate onGlobalManagerCallback:self];
#else
#endif
}

@end
