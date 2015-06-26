//
//  ViewController.m
//  ChildVCPureLayoutTryer
//
//  Created by Chen YU on 26/6/15.
//  Copyright (c) 2015 Chen YU. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "MyTabBarViewController.h"

#import "PureLayout.h"
#import "UIViewController+Container.h"

@interface ViewController ()

@property (nonatomic, strong) FirstViewController *firstVC;
@property (nonatomic, strong) SecondViewController *secondVC;

@property (nonatomic, strong) UITabBarController *tabBarController;

@property (nonatomic, strong) UITabBar *tabBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.firstVC = [[FirstViewController alloc] init];
//    self.firstVC.view.translatesAutoresizingMaskIntoConstraints = NO;
//    self.firstVC.view.backgroundColor = [UIColor orangeColor];
//    
//    [self.firstVC willMoveToParentViewController:self];
//    [self addChildViewController:self.firstVC];
//    [self.view addSubview:self.firstVC.view];
//    [self.firstVC didMoveToParentViewController:self];
//    
//    self.secondVC = [[SecondViewController alloc] init];
//    self.secondVC.view.translatesAutoresizingMaskIntoConstraints = NO;
//    self.secondVC.view.backgroundColor = [UIColor cyanColor];
//    
//    [self.secondVC willMoveToParentViewController:self];
//    [self addChildViewController:self.secondVC];
//    [self.view addSubview:self.secondVC.view];
//    [self.secondVC didMoveToParentViewController:self];
    
    [self _setupTabBarViewController];
    [self.view setNeedsUpdateConstraints];
}

- (void)_setupTabBarViewController {
    
    self.tabBarController = [[UITabBarController alloc] init];
    FirstViewController* vc1 = [[FirstViewController alloc] init];
    SecondViewController* vc2 = [[SecondViewController alloc] init];
    
    MyTabBarViewController *tabBarVC = [[MyTabBarViewController alloc] init];
    
    NSArray* controllers = [NSArray arrayWithObjects:vc1, vc2, tabBarVC, nil];
    self.tabBarController.viewControllers = controllers;
    
    [self addAndDisplayChildViewController:self.tabBarController];
}

- (void)updateViewConstraints {
    
    NSLog(@"%@: updateViewConstraints", [self class]);
    
//    [self.firstVC.view autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view];
//    [self.firstVC.view autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withMultiplier:0.3];
//    [self.firstVC.view autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.view];
//    
//    [self.secondVC.view autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view];
//    [self.secondVC.view autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withMultiplier:0.7];
//    [self.secondVC.view autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.view];
    
    [self.tabBarController.view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    
    [super updateViewConstraints];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
