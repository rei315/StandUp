//
// StandUpView+EditSchedule.swift
// StandUp
//
// Created by rei315 on 2024/11/19.
// Copyright © 2024 rei315. All rights reserved.
//

import Shared
import Combine
import SwiftUI

extension StandUpView {
  struct EditScheduleView: View {
    @State private var timeCycleForEveryPopoverViewState: Bool = false
    @State private var timeCycleForDuringPopoverViewState: Bool = false
    
    @Binding var viewState: ViewStateDestinations
    
    @Binding var timeCycleForEvery: NotificationTimeCycle
    @Binding var timeCycleForDuring: NotificationTimeCycle
    
    @State private var timeCycleForEveryValueForEdit: Int
    @State private var timeCycleForEveryTypeForEdit: NotificationTimeCycle.NotificationTimeCycleType
    @State private var timeCycleForDuringValueForEdit: Int
    @State private var timeCycleForDuringTypeForEdit: NotificationTimeCycle.NotificationTimeCycleType
    
    init(
      viewState: Binding<ViewStateDestinations>,
      timeCycleForEvery: Binding<NotificationTimeCycle>,
      timeCycleForDuring: Binding<NotificationTimeCycle>
    ) {
      self._viewState = viewState
      self._timeCycleForEvery = timeCycleForEvery
      self._timeCycleForDuring = timeCycleForDuring
      
      self.timeCycleForEveryValueForEdit = timeCycleForEvery.wrappedValue.value
      self.timeCycleForEveryTypeForEdit = timeCycleForEvery.wrappedValue.type
      self.timeCycleForDuringValueForEdit = timeCycleForDuring.wrappedValue.value
      self.timeCycleForDuringTypeForEdit = timeCycleForDuring.wrappedValue.type
    }
    
    var body: some View {
      VStack(spacing: 24) {
        HStack {
          BackButton {
            viewState = .top(source: .pop)
          }
          Spacer()
        }
        
        header
        
        VStack(spacing: 16) {
          EditScheduleCell(
            timeCycleType: .every,
            value: $timeCycleForEveryValueForEdit,
            notificationTimeCycleType: $timeCycleForEveryTypeForEdit
          ) {
            timeCycleForEveryPopoverViewState.toggle()
          }
          .popover(isPresented: $timeCycleForEveryPopoverViewState) {
            EditPopoverView(
              value: $timeCycleForEveryValueForEdit,
              type: $timeCycleForEveryTypeForEdit
            )
          }
          
          EditScheduleCell(
            timeCycleType: .during,
            value: $timeCycleForDuringValueForEdit,
            notificationTimeCycleType: $timeCycleForDuringTypeForEdit
          ) {
            timeCycleForDuringPopoverViewState.toggle()
          }
          .popover(isPresented: $timeCycleForDuringPopoverViewState) {
            EditPopoverView(
              value: $timeCycleForDuringValueForEdit,
              type: $timeCycleForDuringTypeForEdit
            )
          }
          
          SaveEditingScheduleButton {
            timeCycleForEvery = .init(
              value: timeCycleForEveryValueForEdit,
              type: timeCycleForEveryTypeForEdit
            )
            timeCycleForDuring = .init(
              value: timeCycleForDuringValueForEdit,
              type: timeCycleForDuringTypeForEdit
            )
            withAnimation {
              viewState = .top(source: .pop)
            }
          }
        }
      }
      .padding(24)
    }
    
    @MainActor @ViewBuilder
    private var header: some View {
      Text("알림 주기")
        .textStyle(.semantics.screenTitle)
        .foregroundStyle(Color.titleColor)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
}
