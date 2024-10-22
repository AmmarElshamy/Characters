//
//  AppDelegate.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    static var shared: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppRouter().start()
        return true
    }
}


