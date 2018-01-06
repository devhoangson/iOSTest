//
//  Person.m
//  TestCode
//
//  Created by HOANGSON on 1/6/18.
//  Copyright © 2018 HoangSon. All rights reserved.
//

#import "Person.h"

NSString * const kName = @"name";
NSString * const kAvatarURL = @"avatar_url";
NSString * const kLocation = @"location";


@interface Person()

@property (nonatomic, strong, readwrite) NSDictionary *jsonData;
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) NSString *avatar_url;
@property (nonatomic, copy, readwrite) NSString *location;
@end

@implementation Person

- (id)initWithJSONData:(NSDictionary *)json{
    if (self = [super init]) {
        self.jsonData = json;
        [self parseData];
    }
    return self;
}

- (void)parseData{
    self.name = self.jsonData[kName];
    self.avatar_url = self.jsonData[kAvatarURL];
    self.location = self.jsonData[kLocation];
}

@end
