//
//  FirstViewController.m
//  ChildViewControllerTryer
//
//  Created by Chen YU on 26/6/15.
//  Copyright (c) 2015 Chen YU. All rights reserved.
//

#import "FirstViewController.h"

#import "PureLayout.h"

@interface FirstViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FirstViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        //set the title for the tab
        self.title = @"First Tab";
        //set the image icon for the tab
        self.tabBarItem.image = [UIImage imageNamed:@"first.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor redColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];

    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints {
    
    NSLog(@"%@: updateViewConstraints", [self class]);
    
    [self.tableView autoCenterInSuperview];
    [self.tableView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withMultiplier:0.5];
    [self.tableView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.view];
    
    [super updateViewConstraints];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    if (! cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                     reuseIdentifier:@"cellIdentifier"];
    }
    
//    [cell setNeedsUpdateConstraints];
//    [cell updateConstraintsIfNeeded];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
