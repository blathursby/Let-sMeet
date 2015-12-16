//
//  AppDelegate.h
//  LetsMeet
//
//  Created by Polaris on 12/5/15.
//  Copyright (c) 2015 Anton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CLLocationManager *locationManager;

-(void)updateLocationManager;

@end

