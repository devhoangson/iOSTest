//
//  HomeViewController.m
//  TestCode
//
//  Created by HOANGSON on 1/6/18.
//  Copyright © 2018 HoangSon. All rights reserved.
//

#import "HomeViewController.h"
#import "PersonTableViewCell.h"
#import "PersonDetailViewController.h"

static NSString *const PersonTableViewCellIdentifier  = @"PersonTableViewCellIdentifier";

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSArray *users;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"HOME";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceivedNotification:) name:@"FinishLoadDataNotification" object:nil];
    [self.tableView registerNib:[UINib nibWithNibName:@"PersonTableViewCell" bundle: nil] forCellReuseIdentifier:PersonTableViewCellIdentifier];
}

- (id)initWithTopFiveUsers:(NSArray *)users{
    if (self = [super init]) {
        self.users = users;
    }
    return self;
}

- (void)didReceivedNotification:(NSNotification *)notification{
    self.users = notification.object;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonTableViewCell *cell = (PersonTableViewCell *)[tableView dequeueReusableCellWithIdentifier:PersonTableViewCellIdentifier];
    [cell updateData:self.users[indexPath.row]];
    return cell;
}


#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonDetailViewController *personDetailViewController = [[PersonDetailViewController alloc] initWithPerson:self.users[indexPath.row]];
    [self.navigationController pushViewController:personDetailViewController animated:true];
}

@end

