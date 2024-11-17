//
//  StandUpApp.swift
//  StandUp
//
//  Created by mingukkim on 2024/11/18.
//

import SwiftUI
import SwiftData

#if canImport(AppKit)
import AppKit
#endif

#if canImport(UIKit)
import UIKit
#endif

@main
struct StandUpApp {
  static func main() {
    setup()
  }
  
  private static func setup() {
#if canImport(AppKit)
    setupAppKit()
#elseif canImport(UIKit)
    setupUIKit()
#endif
  }
  
#if canImport(AppKit)
  private static func setupAppKit() {
    let app = NSApplication.shared
    let delegate = NSAppDelegate()
    app.delegate = delegate
    app.run()
  }
#endif
  
#if canImport(UIKit)
  private static func setupUIKit() {
    let app = UIApplication.shared
    let delegate = UIAppDelegate()
    app.delegate = delegate
    _ = UIApplicationMain(
      CommandLine.argc,
      CommandLine.unsafeArgv,
      nil,
      NSStringFromClass(UIAppDelegate.self)
    )
  }
#endif
}


