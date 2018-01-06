//
//  PersonTableViewCell.h
//  TestCode
//
//  Created by HOANGSON on 1/6/18.
//  Copyright © 2018 HoangSon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;
@interface PersonTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;

- (void)updateData:(Person *)person;

@end
