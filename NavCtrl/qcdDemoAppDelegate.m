//
//  qcdDemoAppDelegate.m
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import "qcdDemoAppDelegate.h"
#import "CompaniesViewController.h"

@implementation qcdDemoAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // Override point for customization after application launch.
    UIViewController *rootController =
    [[CompaniesViewController alloc]
     initWithNibName:@"CompaniesViewController" bundle:nil];
    
    self.navigationController = [[UINavigationController alloc]
                                 initWithRootViewController:rootController];
    
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    //[self.window addSubview:self.navigationController.view];
    [self.window setRootViewController:self.navigationController];
   [self.window makeKeyAndVisible];
    return YES;
    
    
    /*
     self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
     // Override point for customization after application launch.
     self.window.backgroundColor = [UIColor whiteColor];
     [self.window makeKeyAndVisible];
     return YES;
     */
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user
    
    // Checks if app has been launched once and saves bool in defaults for persistence. This is needed for DAO to decide whether it must instantiate companies and products, or if it should just unpack them from user defaults
    
    //// Uncomment to log whether first app launch, storing in defaults
    //    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"HasLaunchedOnce"])
    //    {
    //        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
    //        [[NSUserDefaults standardUserDefaults] synchronize];
    //    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
