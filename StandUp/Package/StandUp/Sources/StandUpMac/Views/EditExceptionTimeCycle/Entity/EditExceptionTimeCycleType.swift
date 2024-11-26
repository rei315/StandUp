//
// EditExceptionTimeCycleType.swift
// StandUp
//
// Created by rei315 on 2024/11/25.
// Copyright © 2024 rei315. All rights reserved.
//

import Shared
import SwiftUI


enum EditExceptionTimeCycleType: Int, SegmentTypeProtocol, CaseIterable, Identifiable {
  case time
  case dateAndTime
  case syncCalendar
  
  var id: Int { self.rawValue }
  
  // todo: - localization
  var title: String {
    switch self {
    case .time:
      "Time"
    case .dateAndTime:
      "Date & Time"
    case .syncCalendar:
      "Sync Calendar"
    }
  }
  
  var screenTitle: String {
    switch self {
    case .time:
      "Register Exception Time"
    case .dateAndTime:
      "Register Exception\nDate and Time"
    case .syncCalendar:
      "Sync Calendar"
    }
  }
}
