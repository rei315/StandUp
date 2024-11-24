//
// NotificationTimeCycle.swift
// StandUp
//
// Created by rei315 on 2024/11/24.
// Copyright © 2024 rei315. All rights reserved.
//

import Foundation

enum NotificationTimeCycle {
  case day(Int)
  case hour(Int)
  case minute(Int)
  
  // todo: localization
  var description: String {
    switch self {
    case .day:
      return "days"
    case .hour:
      return "hours"
    case .minute:
      return "minutes"
    }
  }
  
  var value: Int {
    switch self {
    case let .day(value):
      return value
    case let .hour(value):
      return value
    case let .minute(value):
      return value
    }
  }
}
