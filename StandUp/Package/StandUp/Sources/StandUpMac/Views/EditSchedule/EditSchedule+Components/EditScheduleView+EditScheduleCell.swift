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
    let description: String
    let tapHandler: () async -> Void
    
    var body: some View {
      HStack {
        ContentWithLocale(
          timeCycleType: timeCycleType,
          description: description,
          tapHandler: tapHandler
        )
        Spacer()
      }
    }
    
    private struct ContentWithLocale: View {
      @Environment(\.locale) var locale
      let timeCycleType: TimeCycleType
      let description: String
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
            ScheduleButton(description: description, tapHandler: tapHandler)
          default:
            ScheduleButton(description: description, tapHandler: tapHandler)
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
      let description: String
      let tapHandler: () async -> Void
      
      var body: some View {
        Button {
          Task {
            await tapHandler()
          }
        } label: {
          Text(description)
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
