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
    
    /* For [GlobalManager sharedInstance], this could be happened in many routes in app!
     *  you (the caller) shouldn't have the responsibility of maintain the delegate of the
     *  singleton object!
     *
     * THIS IS A CRAZY DESIGN!
     */
    
#if CASEA
    [GlobalManager sharedInstance].delegate = self.aModel;
    //[GlobalManager sharedInstance].delegate = self.bModel;
#else
#endif
    
    // trigger the test entry
    [[GlobalManager sharedInstance] doSomeStuff];
}

- (void)dealloc
{
#if CASEA
    [GlobalManager sharedInstance].delegate = nil;
#else
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
