//
// Top+TimeCycleCell.swift
// StandUp
//
// Created by rei315 on 2024/11/24.
// Copyright © 2024 rei315. All rights reserved.
//

import Shared
import SwiftUI

extension StandUpView.TopView {
  struct TimeCycleCell: View {
    @Binding var timeCycleForEvery: NotificationTimeCycle
    @Binding var timeCycleForDuring: NotificationTimeCycle
    let onTapTimeCycleView: () async -> Void
    
    var body: some View {
      VStack(spacing: 14) {
        Text("알림 주기")
          .textStyle(.semantics.labelLargeRegular)
          .foregroundStyle(Color.titleColor)
          .frame(maxWidth: .infinity, alignment: .leading)
        Button {
          Task {
            await onTapTimeCycleView()
          }
        } label: {
          HStack {
            TimeCycleLabel(timeCycle: $timeCycleForEvery, timeCycleType: .every)
            Spacer()
            TimeCycleLabel(timeCycle: $timeCycleForDuring, timeCycleType: .during)
          }
          .padding(12)
          .background(Color.buttonBackgroundColor)
          .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .buttonStyle(.plain)
      }
      .padding(.init(top: 22, leading: 16, bottom: 16, trailing: 16))
      .frame(maxWidth: .infinity)
      .background(Color.cellBackgroundColor)
      .clipShape(RoundedRectangle(cornerRadius: 8))
    }
  }
}
