//
//  MyTabBarViewController.m
//  ChildVCPureLayoutTryer
//
//  Created by Chen YU on 26/6/15.
//  Copyright (c) 2015 Chen YU. All rights reserved.
//

#import "MyTabBarViewController.h"

#import "BPTabBar.h"
#import "PureLayout.h"

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface MyTabBarViewController () <BPTabBarDelegate>

@property (nonatomic, strong) BPTabBar  *tabBar;
@property (nonatomic, strong) NSArray   *viewControllers;

@end

@implementation MyTabBarViewController

- (instancetype)init
{
    if (self = [super init]) {
        //set the title for the tab
        self.title = @"TabBar Tab";
        //set the image icon for the tab
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar.png"];
    }
    return self;
}

- (instancetype)initWithViewControllers:(NSArray *)viewControllers {
    if (self = [super init]) {
        //set the title for the tab
        self.title = @"TabBar Tab";
        //set the image icon for the tab
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar.png"];
        
        self.viewControllers = viewControllers;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:self.tabBar];
    
    [self setSelectedViewController:self.viewControllers[0]];
    
    [self.view needsUpdateConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Getter

- (BPTabBar *)tabBar {
    if (!_tabBar) {
        _tabBar = [[BPTabBar alloc] initWithTabNames:@[@"Hello", @"World", @"Goodbye", @"Objective-C", @"Swift"]];
        _tabBar.delegate = self;
        _tabBar.backgroundColor = [UIColor cyanColor];
    }
    return _tabBar;
}

- (void)updateViewConstraints {
    
    NSLog(@"%@: updateViewConstraints", [self class]);
    
    [self.tabBar autoCenterInSuperview];
    [self.tabBar autoSetDimensionsToSize:CGSizeMake(650.f, 40.f)];
    
    [super updateViewConstraints];
}

#pragma mark - Private

- (void)setSelectedViewController:(UIViewController *)selectedViewController {
//    if ([self.viewControllers indexOfObject:selectedViewController] == 2) {
//        MYActionController *viewController = [[MYStoryboardManager actionStoryboard] instantiateInitialViewController];
//        [self presentViewController:viewController animated:YES completion:nil];
//    }
//    else {
//        if (self.selectedViewController == selectedViewController) {
//            [(UINavigationController *)self.selectedViewController popToRootViewControllerAnimated:animate]; // pop to root if tapped the same controller twice
//        }
//    }
}

#pragma mark - BPTabBarDelegate

- (void)tabBar:(BPTabBar *)tabBar didSelectTabAtIndex:(NSInteger)index {
    if (index < self.viewControllers.count) {
        [self setSelectedViewController:self.viewControllers[index]];
    }
}

@end
