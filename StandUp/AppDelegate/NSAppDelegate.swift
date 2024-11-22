//
//  NSAppDelegate.swift
//  StandUp
//
//  Created by mingukkim on 2024/11/18.
//

#if canImport(AppKit)
import AppKit
import Foundation
import SwiftUI

final class NSAppDelegate: NSObject, NSApplicationDelegate {
  func applicationWillFinishLaunching(_ notification: Notification) {
    
  }
  
  func applicationDidFinishLaunching(_ notification: Notification) {
    
  }
  
  func applicationWillHide(_ notification: Notification) {
    print(#function)
  }
  
  func applicationDidHide(_ notification: Notification) {
    print(#function)
  }
  
  func applicationDidBecomeActive(_ notification: Notification) {
    print(#function)
  }
  
  func applicationWillResignActive(_ notification: Notification) {
    print(#function)
  }
  
  func applicationDidResignActive(_ notification: Notification) {
    print(#function)
  }
  
  func applicationWillTerminate(_ notification: Notification) {
    print(#function)
  }
}
#endif
