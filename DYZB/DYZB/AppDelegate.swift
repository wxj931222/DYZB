//
//  AppDelegate.swift
//  DYZB
//
//  Created by 王效金 on 17/8/17.
//  Copyright © 2017年 王效金. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        UITabBar.appearance().tintColor = UIColor.orangeColor()
        return true
    }

}

