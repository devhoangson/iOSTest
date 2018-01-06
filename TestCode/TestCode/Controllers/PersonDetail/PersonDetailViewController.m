//
//  PersonDetailViewController.m
//  TestCode
//
//  Created by HOANGSON on 1/6/18.
//  Copyright © 2018 HoangSon. All rights reserved.
//

#import "PersonDetailViewController.h"
#import "PersonDetailTableViewCell.h"

static NSString *const PersonDetailTableViewCellIdentifier  = @"PersonDetailTableViewCellIdentifier";


@interface PersonDetailViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong, readwrite) Person *person;

@end

@implementation PersonDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"DETAIL";
    [self.tableView registerNib:[UINib nibWithNibName:@"PersonDetailTableViewCell" bundle: nil] forCellReuseIdentifier:PersonDetailTableViewCellIdentifier];
}

- (id)initWithPerson:(Person *)person{
    if (self = [super init]) {
        self.person = person;
    }
    return self;
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonDetailTableViewCell *cell = (PersonDetailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:PersonDetailTableViewCellIdentifier];
    [cell updateData:self.person];
    return cell;
}


#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
