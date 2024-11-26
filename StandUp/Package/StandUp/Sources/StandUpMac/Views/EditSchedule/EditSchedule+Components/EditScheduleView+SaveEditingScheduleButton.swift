//
// EditScheduleView+SaveEditingScheduleButton.swift
// StandUp
//
// Created by rei315 on 2024/11/24.
// Copyright © 2024 rei315. All rights reserved.
//

import Shared
import SwiftUI

extension StandUpView.EditScheduleView {
  struct SaveEditingScheduleButton: View {
    let tapHandler: () async -> Void
    
    var body: some View {
      Button {
        Task {
          await tapHandler()
        }
      } label: {
        Text("Save")
          .textStyle(.semantics.labelLargeRegular)
          .foregroundStyle(Color.titleColor)
          .padding(.vertical, 10)
          .frame(maxWidth: .infinity)
          .background(Color.saveButtonBackgroundColor)
          .clipShape(RoundedRectangle(cornerRadius: 8))
      }
      .buttonStyle(.plain)
    }
  }

}
