//
//  AppDelegate.swift
//  SportsDB
//
//  Created by Isaac Karam on 7/3/20.
//  Copyright © 2020 Isaac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Launch App With Leagues Views
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: LeaguesViewController())
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
    
}

