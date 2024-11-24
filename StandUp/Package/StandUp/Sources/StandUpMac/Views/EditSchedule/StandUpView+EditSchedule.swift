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
    @State private var timeCycleForEveryPopoverViewState: Bool = false
    @State private var timeCycleForDuringPopoverViewState: Bool = false
    @State private var selectedTimeCycleForEveryType: TimeCycleSelectionType = .hour
    @State private var selectedTimeCycleForDuringType: TimeCycleSelectionType = .minute
    enum TimeCycleSelectionType: CaseIterable {
      case hour
      case minute
      
      // todo: localization
      var description: String {
        switch self {
        case .hour:
          "시간"
        case .minute:
          "분"
        }
      }
    }
    
    @Binding var viewState: ViewStateDestinations
    
    @Binding var timeCycleForEvery: NotificationTimeCycle
    @Binding var timeCycleForDuring: NotificationTimeCycle
    
    @State private var timeCycleForEveryForEdit: NotificationTimeCycle
    @State private var timeCycleForDuringForEdit: NotificationTimeCycle
    
    init(
      viewState: Binding<ViewStateDestinations>,
      timeCycleForEvery: Binding<NotificationTimeCycle>,
      timeCycleForDuring: Binding<NotificationTimeCycle>
    ) {
      self._viewState = viewState
      self._timeCycleForEvery = timeCycleForEvery
      self._timeCycleForDuring = timeCycleForDuring
      
      self.timeCycleForEveryForEdit = timeCycleForEvery.wrappedValue
      self.timeCycleForDuringForEdit = timeCycleForDuring.wrappedValue
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
            description: "\(timeCycleForEveryForEdit.value) \(timeCycleForEveryForEdit.type.description)"
          ) {
            timeCycleForEveryPopoverViewState.toggle()
          }
          .popover(isPresented: $timeCycleForEveryPopoverViewState) {
            HStack(spacing: 16) {
              TextField("", value: $timeCycleForEveryForEdit.value, formatter: NumberFormatter())
                .frame(minWidth: 50)
                .frame(maxWidth: 150)
                .fixedSize(horizontal: true, vertical: false)
              Picker("", selection: $selectedTimeCycleForEveryType) {
                ForEach(TimeCycleSelectionType.allCases, id: \.self) { type in
                  Text(type.description)
                }
              }
              .fixedSize(horizontal: true, vertical: false)
            }
            .padding(16)
          }
          
          EditScheduleCell(
            timeCycleType: .during,
            description: "\(timeCycleForDuringForEdit.value) \(timeCycleForDuringForEdit.type.description)"
          ) {
            timeCycleForDuringPopoverViewState.toggle()
          }
          
          SaveEditingScheduleButton {
            timeCycleForEvery = timeCycleForEveryForEdit
            timeCycleForDuring = timeCycleForDuringForEdit
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
