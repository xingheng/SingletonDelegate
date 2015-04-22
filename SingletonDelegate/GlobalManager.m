//
//  GlobalManager.m
//  SingletonDelegate
//
//  Created by Wei Han on 4/22/15.
//  Copyright (c) 2015 Han Wei. All rights reserved.
//

#import "GlobalManager.h"

@interface GlobalManager()

#if SOLUTION_DESIGN
@property (nonatomic, strong) NSMutableArray *delegates;
#endif

@end

@implementation GlobalManager

#pragma mark - Init

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
#if SOLUTION_DESIGN
        _delegates = [[NSMutableArray alloc] init];
#endif
    }
    return self;
}

- (void)dealloc
{
#if SOLUTION_DESIGN
    [_delegates removeAllObjects];
#endif
}

#pragma mark - Public

- (void)doSomeStuff
{
#if CRAZY_DESIGN
    if (self.delegate)
        [self.delegate onGlobalManagerCallback:self];
#elif SOLUTION_DESIGN
    for (id<GlobalManagerDelegate> delegate in self.delegates) {
        if (delegate)
            [delegate onGlobalManagerCallback:self];
    }
#endif
}


#if SOLUTION_DESIGN

- (void)addDelegate:(id<GlobalManagerDelegate>)newDelegate
{
    if (!newDelegate)
        return;
    
    if ([self.delegates containsObject:newDelegate])
        return;
    
    [self.delegates addObject:newDelegate];
}

- (void)removeDelegate:(id<GlobalManagerDelegate>)deleteDelegate
{
    if (!deleteDelegate)
        return;
    
    [self.delegates removeObject:deleteDelegate];
}

#endif

@end
