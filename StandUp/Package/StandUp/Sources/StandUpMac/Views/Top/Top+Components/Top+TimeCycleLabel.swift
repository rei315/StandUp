//
// Top+TimeCycleLabel.swift
// StandUp
//
// Created by rei315 on 2024/11/24.
// Copyright © 2024 rei315. All rights reserved.
//

import Shared
import SwiftUI

extension StandUpView.TopView {
  struct TimeCycleLabel: View {
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
    let timeCycle: NotificationTimeCycle
    let timeCycleType: TimeCycleType
    
    var body: some View {
      Label {
        HStack(spacing: 4) {
          Text(timeCycle.value.description)
          Text(timeCycle.description)
          Text(timeCycleType.label)
        }
      } icon: {
        timeCycleType.image
      }
      .labelStyle(ContentTimeCycleLabelStyle())
    }
  }
}

private struct ContentTimeCycleLabelStyle: LabelStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      configuration.icon
        .frame(width: 20, height: 20)
      
      configuration.title
        .textStyle(.semantics.bodyMedium)
        .foregroundStyle(Color.labelColor)
      
      Spacer()
    }
  }
}
