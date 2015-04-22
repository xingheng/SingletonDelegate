//
//  ViewController.m
//  SingletonDelegate
//
//  Created by Wei Han on 4/22/15.
//  Copyright (c) 2015 Han Wei. All rights reserved.
//

#import "ViewController.h"
#import "GlobalManager.h"
#import "ModelA.h"
#import "ModelB.h"


@interface ViewController ()

@property (nonatomic, strong) ModelA *aModel;
@property (nonatomic, strong) ModelB *bModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.aModel = [ModelA new];
    self.bModel = [ModelB new];
    
    
#if CRAZY_DESIGN
    /* For [GlobalManager sharedInstance], this could be happened in many routes in app!
     *  you (the caller) shouldn't have the responsibility of maintain the delegate of the
     *  singleton object!
     *
     * THIS IS A CRAZY DESIGN!
     */
    [GlobalManager sharedInstance].delegate = self.aModel;
    [GlobalManager sharedInstance].delegate = self.bModel;
#elif SOLUTION_DESIGN
    [[GlobalManager sharedInstance] addDelegate:self.aModel];
    [[GlobalManager sharedInstance] addDelegate:self.bModel];
#endif
    
    // trigger the test entry
    [[GlobalManager sharedInstance] doSomeStuff];
}

- (void)dealloc
{
#if CRAZY_DESIGN
    [GlobalManager sharedInstance].delegate = nil;
#elif SOLUTION_DESIGN
    [[GlobalManager sharedInstance] removeDelegate:self.aModel];
    [[GlobalManager sharedInstance] removeDelegate:self.bModel];
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
