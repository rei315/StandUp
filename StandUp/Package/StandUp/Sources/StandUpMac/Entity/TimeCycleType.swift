//
// TimeCycleType.swift
// StandUp
//
// Created by rei315 on 2024/11/24.
// Copyright © 2024 rei315. All rights reserved.
//

import SwiftUI

enum TimeCycleType {
  case every
  case during
  
  // todo: localization
  var label: String {
    switch self {
    case .every:
      return "마다"
    case .during:
      return "동안"
    }
  }
  
  var image: Image {
    switch self {
    case .every:
      return Image(systemName: "clock.arrow.circlepath")
    case .during:
      return Image(systemName: "timer")
    }
  }
}
