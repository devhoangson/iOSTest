//
//  Request.m
//  TestCode
//
//  Created by HOANGSON on 1/6/18.
//  Copyright © 2018 HoangSon. All rights reserved.
//

#import "Request.h"
#import "API.h"
#import "Person.h"

static NSString * const GET = @"GET";

@implementation Request

+ (id)shareInstance {
    static dispatch_once_t onceToken;
    static Request *share = nil;
    dispatch_once(&onceToken, ^{
        share = [[Request alloc] init];
    });
    return share;
}

- (void)informationFromName:(NSString *)name completion:(void (^)(Person *person))complete{
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"%@%@/%@", SERVER_URL, USER, name]];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:GET];
    
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:NSJSONReadingMutableContainers
                                                               error:&jsonError];
        if (json) {
            complete([[Person alloc] initWithJSONData:json]);
        }
        NSLog(@"%@", json);
    }];
    [dataTask resume];
}


@end
