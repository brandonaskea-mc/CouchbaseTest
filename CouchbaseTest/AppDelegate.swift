//
//  AppDelegate.swift
//  CouchbaseTest
//
//  Created by Brandon Askea on 3/21/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        if !UserDefaults.standard.bool(forKey: Constants.Data.didStoreKey) {
            DatabaseManager.instance.storeData()
            UserDefaults.standard.set(true, forKey: Constants.Data.didStoreKey)
            UserDefaults.standard.synchronize()
        }
        
        return true
    }

}

