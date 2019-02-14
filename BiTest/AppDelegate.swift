//
//  AppDelegate.swift
//  BiTest
//
//  Created by Ivan Trofimov on 13/02/2019.
//  Copyright © 2019 Ivan Trofimov. All rights reserved.
//

import UIKit
import SciChart

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let licencing: String =
        """
        <LicenseContract>
        <Customer>richard1997dog@gmail.com</Customer>
        <OrderId>Trial</OrderId>
        <LicenseCount>1</LicenseCount>
        <IsTrialLicense>true</IsTrialLicense>
        <SupportExpires>03/14/2019 00:00:00</SupportExpires>
        <ProductCode>SC-IOS-2D-ENTERPRISE-SRC</ProductCode>
        <KeyCode>45072b023745b1ce7a5a0988df734f193deff5d29abe943a6ebcafff3c0870d25482f886637d8a25e593d42843824929d65adf8bfd1868fbbac0cc471c13b7b1dd308f39b25a02d81180e61ae43df8395af44f8e812e74293b975d41fb58896d88ae8a96a37fbc8b0d736d75f08926651839f1626980b7f045792831a99612bc6542be1d889c7ef52e5cf455c2444991e57a1341870b62d9eb2cdfd5b066e12e9fada33e41de389174970a8cd676</KeyCode>
        </LicenseContract>
        """
        
        SCIChartSurface.setRuntimeLicenseKey(licencing)

        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

