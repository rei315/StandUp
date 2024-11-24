//
// NotificationTimeCycle.swift
// StandUp
//
// Created by rei315 on 2024/11/24.
// Copyright © 2024 rei315. All rights reserved.
//

import Foundation

struct NotificationTimeCycle {
  var value: Int
  var type: NotificationTimeCycleType
  
  init(value: Int = 0, type: NotificationTimeCycleType = .hour) {
    self.value = value
    self.type = type
  }
  
  enum NotificationTimeCycleType {
    case hour
    case minute
    
    // todo: localization
    var description: String {
      switch self {
      case .hour:
        return "hours"
      case .minute:
        return "minutes"
      }
    }
  }
}
