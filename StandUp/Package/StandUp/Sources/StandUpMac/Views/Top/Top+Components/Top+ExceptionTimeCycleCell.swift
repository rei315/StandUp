//
// Top+ExceptionTimeCycleCell.swift
// StandUp
//
// Created by rei315 on 2024/11/24.
// Copyright © 2024 rei315. All rights reserved.
//

import Shared
import SwiftUI

extension StandUpView.TopView {
  enum ExceptionTimeType: Hashable {
    case time
    case detailSchedule
    case googleCalendar
    
    var description: String {
      switch self {
      case .time:
        ""
      case .detailSchedule:
        ""
      case .googleCalendar:
        "Google Calendar에서 설정된 일정"
      }
    }
  }
  
  struct ExceptionTimeCycleCell: View {
    let exceptionTimes: [ExceptionTimeType]
    let onTapAdd: () async -> Void
    
    // todo: localization
    var body: some View {
      VStack(spacing: 16) {
        HStack(alignment: .center) {
          Text("예외 일정")
            .textStyle(.semantics.labelLargeRegular)
            .foregroundStyle(Color.titleColor)
          Spacer()
          Button {
            Task {
              await onTapAdd()
            }
          } label: {
            Text("추가")
              .textStyle(.semantics.labelMediumRegular)
              .foregroundStyle(Color.labelColor)
              .padding(.init(top: 8, leading: 12, bottom: 8, trailing: 12))
              .background(Color.buttonBackgroundColor)
              .clipShape(RoundedRectangle(cornerRadius: 8))
          }
          .buttonStyle(.plain)
        }
        if exceptionTimes.isEmpty {
          Text("설정된 예외 일정이 없습니다")
            .textStyle(.semantics.labelMediumRegular)
            .foregroundStyle(Color.smallLabelColor)
            .frame(maxWidth: .infinity, alignment: .leading)
        } else {
          ScrollView {
            VStack {
              ForEach(exceptionTimes, id: \.self) { time in
                Text(time.description)
              }
            }
          }
        }
      }
      .padding(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
      .frame(maxWidth: .infinity)
      .background(Color.cellBackgroundColor)
      .clipShape(RoundedRectangle(cornerRadius: 8))
    }
  }
}
