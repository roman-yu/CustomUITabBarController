//
//  BPTabBar.m
//  ChildVCPureLayoutTryer
//
//  Created by Chen YU on 26/6/15.
//  Copyright (c) 2015 Chen YU. All rights reserved.
//

#import "BPTabBar.h"
#import "PureLayout.h"

CGFloat const tabWidth = 130.f;
CGFloat const tabHeight = 40.f;

CGFloat const cornerRadius = 6.f;

int32_t const activeColor = 0x474747;
int32_t const normalColor = 0xFFFFFF;

@interface BPTabBar () {
    NSInteger activeIndex;
}

@property (nonatomic, strong) NSMutableArray *tabs;

@end

@implementation BPTabBar

- (instancetype)initWithTabNames:(NSArray *)tabNames {
    if (self = [super initForAutoLayout]) {
        
        activeIndex = 0;
        
        self.layer.cornerRadius = cornerRadius;
        self.layer.masksToBounds = YES;
        
        [self initTabViews:tabNames];
        
//        [self needsUpdateConstraints];
    }
    return self;
}

- (void)initTabViews:(NSArray *)tabNames {
    
    typeof(self) __weak weakSelf = self;
    
    [tabNames enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        UIButton *tab = [UIButton newAutoLayoutView];
        tab.tag = idx;
        [tab addTarget:self action:@selector(didSelectTabWithTag:) forControlEvents:UIControlEventTouchUpInside];
        [tab setTitle:obj forState:UIControlStateNormal];
        if (activeIndex == idx) {
            [tab setBackgroundColor:[UIColor lightGrayColor]];            
        } else {
            [tab setBackgroundColor:[UIColor whiteColor]];
        }
        [tab setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [tab setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];

        [weakSelf.tabs addObject:tab];
        [weakSelf addSubview:tab];
    }];
}

- (void)reloadTabs {
    [self.tabs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton *tab = obj;
        if (activeIndex == idx) {
            [tab setBackgroundColor:[UIColor lightGrayColor]];
        } else {
            [tab setBackgroundColor:[UIColor whiteColor]];
        }
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"%@: layoutSubviews", [self class]);
}

- (void)updateConstraints {
    
    NSLog(@"%@: updateConstraints", [self class]);
    
    typeof(self) __weak weakSelf = self;
    
    [self.tabs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        UIButton *tab = obj, *prevTab;
        if (idx == 0) {
            [tab autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self];
        } else {
            prevTab = [weakSelf.tabs objectAtIndex:(idx - 1)];
            [tab autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:prevTab];
        }
        
//        [tab autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self];
//        [tab autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self];
        
        [tab autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self];
        [tab autoSetDimensionsToSize:CGSizeMake(tabWidth, tabHeight)];
    }];
    
    [super updateConstraints];
}

#pragma mark - Getters

- (NSMutableArray *)tabs {
    if (!_tabs) {
        _tabs = [NSMutableArray new];
    }
    return _tabs;
}

#pragma mark - Button

- (void)didSelectTabWithTag:(id)sender {
    
    if ([sender isKindOfClass:[UIButton class]]) {
        
        [((UIButton *)[self.tabs objectAtIndex:activeIndex]) setSelected:NO];
        activeIndex = ((UIButton *)sender).tag;
        [((UIButton *)[self.tabs objectAtIndex:activeIndex]) setSelected:YES];
        [self reloadTabs];
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(tabBar:didSelectTabAtIndex:)]) {
            [self.delegate tabBar:self didSelectTabAtIndex:((UIButton *)sender).tag];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
