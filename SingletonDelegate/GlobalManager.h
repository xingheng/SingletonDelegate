//
//  GlobalManager.h
//  SingletonDelegate
//
//  Created by Wei Han on 4/22/15.
//  Copyright (c) 2015 Han Wei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GlobalManager;


@protocol GlobalManagerDelegate <NSObject>

- (void)onGlobalManagerCallback:(GlobalManager *)manager;

@end


@interface GlobalManager : NSObject

#if CRAZY_DESIGN
@property (nonatomic, weak) id<GlobalManagerDelegate> delegate;
#endif

+ (GlobalManager *)sharedInstance;

- (void)doSomeStuff;

#if SOLUTION_DESIGN
- (void)addDelegate:(id<GlobalManagerDelegate>)newDelegate;
- (void)removeDelegate:(id<GlobalManagerDelegate>)deleteDelegate;
#endif

@end
