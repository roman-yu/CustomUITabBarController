//
//  BPTabBar.h
//  ChildVCPureLayoutTryer
//
//  Created by Chen YU on 26/6/15.
//  Copyright (c) 2015 Chen YU. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BPTabBarDelegate;

@interface BPTabBar : UIView

@property (nonatomic, weak) id <BPTabBarDelegate> delegate;

- (instancetype)initWithTabNames:(NSArray *)tabNames;

@end

@protocol BPTabBarDelegate  <NSObject>

//- (NSUInteger)numberOfSegments;
//- (CGFloat)sizeOfSegmentAtIndex:(NSUInteger)segmentIndex;

- (void)tabBar:(BPTabBar *)tabBar didSelectTabAtIndex:(NSInteger)index;

@end