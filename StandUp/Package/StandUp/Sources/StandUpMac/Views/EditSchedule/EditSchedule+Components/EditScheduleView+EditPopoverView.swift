//
// EditScheduleView+EditPopoverView.swift
// StandUp
//
// Created by rei315 on 2024/11/24.
// Copyright © 2024 rei315. All rights reserved.
//

import Shared
import SwiftUI

extension StandUpView.EditScheduleView {
  struct EditPopoverView: View {
    private static var numberFormatter: NumberFormatter = {
      let formatter = NumberFormatter()
      formatter.maximum = .init(integerLiteral: 999)
      formatter.minimum = .init(integerLiteral: 0)
      formatter.numberStyle = .decimal
      return formatter
    }()
    
    @Binding var value: Int
    @Binding var type: NotificationTimeCycle.NotificationTimeCycleType
    
    var body: some View {
      HStack(spacing: 16) {
        TextField(
          value: $value,
          formatter: StandUpView.EditScheduleView.EditPopoverView.numberFormatter,
          label: {}
        )
        .frame(minWidth: 50)
        .frame(maxWidth: 150)
        .fixedSize(horizontal: true, vertical: false)
        
        Picker("", selection: $type) {
          ForEach(NotificationTimeCycle.NotificationTimeCycleType.allCases) { type in
            Text(type.description).tag(type)
          }
        }
        .pickerStyle(.segmented)
        .fixedSize(horizontal: true, vertical: false)
      }
      .padding(16)
    }
  }
}
