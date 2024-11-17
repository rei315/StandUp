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

#if DEBUG
import StandUpDebugMac
#else
import StandUpDebugMac
#endif


final class NSAppDelegate: NSObject, NSApplicationDelegate {
  private var statusItem: NSStatusItem?
  private var popover: NSPopover?
  
#if DEBUG
  var app: StandUpDebugMac!
#else
  var app: StandUpDebugMac!
#endif
  
  func applicationWillFinishLaunching(_ notification: Notification) {
    
  }
  
  func applicationDidFinishLaunching(_ notification: Notification) {
    NSApp.windows.forEach { $0.close() }
    NSApp.setActivationPolicy(.accessory)
    
    app = .init()
    app.setupStatusBar()
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
