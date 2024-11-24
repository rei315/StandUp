//
// StandUpView+EditSchedule.swift
// StandUp
//
// Created by rei315 on 2024/11/19.
// Copyright © 2024 rei315. All rights reserved.
//

import Shared
import SwiftUI

extension StandUpView {
  struct EditScheduleView: View {
    @Binding var viewState: ViewStateDestinations
    
    var body: some View {
      VStack {
        HStack {
          BackButton {
            viewState = .top(source: .pop)
          }
          Spacer()
        }

        Text("hello world")
        Spacer()
      }
      .padding(.horizontal, 24)
      .padding(.top, 24)
    }
  }
}