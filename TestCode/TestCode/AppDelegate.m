//
//  AppDelegate.m
//  TestCode
//
//  Created by HOANGSON on 1/6/18.
//  Copyright © 2018 HoangSon. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "Request.h"
#import "Person.h"

@interface AppDelegate ()
@property (nonatomic, copy) NSArray *topFiveUsers;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self topFiveUsersFromBackground];
    [self setupHomeView];
    return YES;
}

- (void)setupHomeView{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
}

- (void)topFiveUsersFromBackground{
    NSMutableArray *results = [NSMutableArray array];
    self.topFiveUsers = @[@"GrahamCampbell", @"fabpot", @"weierophinney", @"rkh", @"josh"];
    
    dispatch_group_t group = dispatch_group_create();
    for (int i = 0; i < self.topFiveUsers.count; i++) {
        dispatch_group_enter(group);
        dispatch_group_async(group,dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^ {
            [[Request shareInstance] informationFromName:self.topFiveUsers[i] completion:^(Person *person) {
                dispatch_group_leave(group);
                if (person) {
                    [results addObject:person];
                }
            }];
        });
    }
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^ {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"FinishLoadDataNotification" object:results];
    });
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
