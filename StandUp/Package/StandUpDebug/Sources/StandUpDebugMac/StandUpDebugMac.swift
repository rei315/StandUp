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
import Popover

@MainActor
public final class StandUpDebugMac {
  private var statusItem: NSStatusItem?
  private var popover: NSPopover?
  
  public init() {}
  
  public func setupStatusBar() {
    statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let button = statusItem?.button
    button?.image = NSImage(systemSymbolName: "leaf", accessibilityDescription: nil)
    button?.action = #selector(showPopover)
    button?.sendAction(on: [.leftMouseUp, .rightMouseUp])
    button?.target = self
  }
  
  @objc
  private func showPopover(_ sender: NSStatusBarButton) {
    guard let event = NSApp.currentEvent else { return }
    if popover == nil {
      let popover = NSPopover()
      popover.behavior = .transient
      popover.animates = false
      self.popover = popover
    }
    popover?.contentViewController = NSHostingController(rootView: PopoverView())
    popover?.show(relativeTo: sender.bounds, of: sender, preferredEdge: NSRectEdge.maxY)
    popover?.contentViewController?.view.window?.makeKey()
  }
}
#endif
