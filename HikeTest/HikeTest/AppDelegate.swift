//
//  AppDelegate.swift
//  HikeTest
//
//  Created by sunil.kumar1 on 11/28/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let p = preToPost(pre_exp: "+ab")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    
    
    func isOperator(x:Character) -> Bool {
        switch x {
        case "+","-","/","*":
            return true
        default:
            return false
        }
    }
    
    
    func preToPost(pre_exp: String) -> String {
        var final1 = String()
        var s = [String]()
        let length = pre_exp.count
        for index in stride(from: length-1, through: 0, by: -1) {
            let p = pre_exp[pre_exp.index(pre_exp.startIndex, offsetBy: index)]
            if isOperator(x: p) {
                let op1 = s.last
                if s.count > 0 {
                    s.removeLast()
                }
                let op2 = s.last
                if s.count > 0 {
                    s.removeLast()
                }
                let lastString = pre_exp[pre_exp.index(pre_exp.startIndex, offsetBy: index)]
                let temp = "\(op1 ?? "")"+"\(op2 ?? "")"+"\(lastString)"
                s.append(temp)
                final1.insert(contentsOf: temp, at: final1.startIndex)
            } else {
                let tempString = pre_exp[pre_exp.index(pre_exp.startIndex, offsetBy: index)]
                s.append("\(tempString)")
                final1.insert(tempString, at: final1.startIndex)
            }
        }
        return final1
//        var final = String()
//        var count = s.count
//        while count>0 {
//            let tempString = s[count-1]
//            final = final+"\(tempString)"
//            count = count-1
//        }
//
//        return final
        
    }
    
    func prefixToPostfix(prefixes: [String]) -> [String] {
        // Write your code here
        var result = [String]()
        for item in prefixes {
            result.append(preToPost(pre_exp: item))
        }
        return result
    }
}

