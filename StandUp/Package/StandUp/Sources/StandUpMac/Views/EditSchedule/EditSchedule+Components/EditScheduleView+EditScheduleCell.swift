//
// EditScheduleView+EditScheduleCell.swift
// StandUp
//
// Created by rei315 on 2024/11/24.
// Copyright © 2024 rei315. All rights reserved.
//

import Shared
import SwiftUI

extension StandUpView.EditScheduleView {
  struct EditScheduleCell: View {
    let timeCycleType: TimeCycleType
    @Binding var value: Int
    @Binding var notificationTimeCycleType: NotificationTimeCycle.NotificationTimeCycleType
    
    let tapHandler: () async -> Void
    
    var body: some View {
      HStack {
        ContentWithLocale(
          timeCycleType: timeCycleType,
          value: $value,
          notificationTimeCycleType: $notificationTimeCycleType,
          tapHandler: tapHandler
        )
        Spacer()
      }
    }
    
    private struct ContentWithLocale: View {
      @Environment(\.locale) var locale
      let timeCycleType: TimeCycleType
      @Binding var value: Int
      @Binding var notificationTimeCycleType: NotificationTimeCycle.NotificationTimeCycleType
      let tapHandler: () async -> Void
      
      var body: some View {
        HStack(spacing: 12) {
          Image(systemName: "clock")
            .resizable()
            .frame(width: 20, height: 20)
          
          switch locale.language.languageCode {
          case .english:
            Text(timeCycleType.label)
              .textStyle(.semantics.labelLargeRegular)
              .foregroundStyle(Color.descriptionLabelColor)
            ScheduleButton(
              value: $value,
              notificationTimeCycleType: $notificationTimeCycleType,
              tapHandler: tapHandler
            )
          default:
            ScheduleButton(
              value: $value,
              notificationTimeCycleType: $notificationTimeCycleType,
              tapHandler: tapHandler
            )
            Text(timeCycleType.label)
              .textStyle(.semantics.labelLargeRegular)
              .foregroundStyle(Color.descriptionLabelColor)
          }
          
          Spacer()
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.cellBackgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 8))
      }
    }
    
    private struct ScheduleButton: View {
      @Binding var value: Int
      @Binding var notificationTimeCycleType: NotificationTimeCycle.NotificationTimeCycleType
      let tapHandler: () async -> Void
      
      var body: some View {
        Button {
          Task {
            await tapHandler()
          }
        } label: {
          Text("\(value) \(notificationTimeCycleType.description)")
            .textStyle(.semantics.labelLargeRegular)
            .foregroundStyle(Color.titleColor)
            .padding(.init(top: 8, leading: 12, bottom: 8, trailing: 12))
            .background(Color.buttonBackgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .buttonStyle(.plain)
      }
    }
  }

}
