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
    @Binding var timeCycle: NotificationTimeCycle
    let timeCycleType: TimeCycleType
    
    var body: some View {
      Label {
        HStack(spacing: 4) {
          Text(timeCycle.value.description)
          Text(timeCycle.type.description)
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
