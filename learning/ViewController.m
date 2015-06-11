//
//  ViewController.m
//  learning
//
//  Created by gzc on 15/6/11.
//  Copyright (c) 2015年 jiaxue. All rights reserved.
//

#import "ViewController.h"
#import "KeyShare-Prefix.pch"
#import "KSCourseListCell.h"

@interface ViewController ()
@property UITableView *tableView;
@end

@implementation ViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)loadView {
    [super loadView];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    self.navigationItem.title = @"学习tableview";
}

#pragma mark - UITableViewDelegate
#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *courseCellIdentifier = @"courseCell";
    KSCourseListCell *courseCell = (KSCourseListCell *) [tableView dequeueReusableCellWithIdentifier:courseCellIdentifier];
    
    if (!courseCell) {
        courseCell = [[KSCourseListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:courseCellIdentifier];
    }
    
    [courseCell setData];
    
    return courseCell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [KSCourseListCell cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
