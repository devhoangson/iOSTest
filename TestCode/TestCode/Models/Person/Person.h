//
//  Person.h
//  TestCode
//
//  Created by HOANGSON on 1/6/18.
//  Copyright © 2018 HoangSon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *avatar_url;
@property (nonatomic, copy, readonly) NSString *location;

- (id)initWithJSONData:(NSDictionary *)json;

@end
