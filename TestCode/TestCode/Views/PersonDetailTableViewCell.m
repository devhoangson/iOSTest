//
//  PersonDetailTableViewCell.m
//  TestCode
//
//  Created by HOANGSON on 1/6/18.
//  Copyright © 2018 HoangSon. All rights reserved.
//

#import "PersonDetailTableViewCell.h"
#import "Person.h"

@implementation PersonDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateData:(Person *)person {
    [super updateData:person];
    self.locationLabel.text = person.location;
    [self imageFromURL:person.avatar_url];
}

- (void)imageFromURL:(NSString *)url {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (data) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage *image = [UIImage imageWithData:data];
                self.avatarImageView.image = image;
            });
        }
    });
}

@end
