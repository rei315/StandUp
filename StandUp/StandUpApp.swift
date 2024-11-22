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
import StandUpMac
#endif

#if canImport(UIKit)
import UIKit
#endif

@main
struct StandUpApp: App {
  var body: some Scene {
    
#if canImport(AppKit)
    MenuBarExtra {
      StandUpView()
    } label: {
      Image(systemName: "leaf")
    }
    .menuBarExtraStyle(.window)

#elseif canImport(UIKit)
    WindowGroup {

    }
#endif
  }
}


