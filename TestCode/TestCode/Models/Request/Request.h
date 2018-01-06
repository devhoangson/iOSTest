//
//  Request.h
//  TestCode
//
//  Created by HOANGSON on 1/6/18.
//  Copyright © 2018 HoangSon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;
@interface Request : NSObject

+ (id)shareInstance;

- (void)informationFromName:(NSString *)name completion:(void (^)(Person *person))complete;

@end
