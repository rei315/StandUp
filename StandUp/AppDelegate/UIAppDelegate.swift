//
//  UIAppDelegate.swift
//  StandUp
//
//  Created by mingukkim on 2024/11/18.
//

#if canImport(UIKit)
import UIKit

final class UIAppDelegate: NSObject, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    print(#function)
    return true
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    print(#function)
  }
  
  func applicationWillResignActive(_ application: UIApplication) {
    print(#function)
  }
  
  func applicationDidEnterBackground(_ application: UIApplication) {
    print(#function)
  }
  
  func applicationWillEnterForeground(_ application: UIApplication) {
    print(#function)
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
    print(#function)
  }
}
#endif
