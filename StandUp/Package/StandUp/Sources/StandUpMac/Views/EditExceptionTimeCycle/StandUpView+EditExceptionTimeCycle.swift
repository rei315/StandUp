//
// StandUpView+EditExceptionTimeCycle.swift
// StandUp
//
// Created by rei315 on 2024/11/24.
// Copyright © 2024 rei315. All rights reserved.
//

import Shared
import SwiftUI

extension StandUpView {
  struct EditExceptionTimeCycle: View {
    @Binding var viewState: ViewStateDestinations
    @State private var segmentData: EditExceptionTimeCycleSegmentData
    
    init(viewState: Binding<ViewStateDestinations>) {
      self._viewState = viewState
      let initialSegmentType: EditExceptionTimeCycleType = .time
      self.segmentData = .init(
        current: initialSegmentType,
        old: initialSegmentType
      )
    }
    
    var body: some View {
      VStack(spacing: 24) {
        HStack {
          BackButton {
            viewState = .top(source: .pop)
          }
          Spacer()
        }
        
        SegmentedControl(
          segmentData: $segmentData,
          configuration: .init(
            selectedForegroundColor: Color.white1,
            selectedBackgroundColor: Color.segmentedSelectedColor,
            foregroundColor: Color.descriptionLabelColor,
            backgroundColor: Color.segmentedBackgroundColor
          )
        )
        
        Header(currentSegment: $segmentData.current)
        
        Group {
          switch segmentData.current {
          case .time:
            Rectangle().fill(Color.red).frame(width: 100, height: 100)
          case .dateAndTime:
            Rectangle().fill(Color.green).frame(width: 100, height: 100)
          case .syncCalendar:
            Rectangle().fill(Color.blue).frame(width: 100, height: 100)
          }
        }
        .transitionBy(
          old: segmentData.old,
          current: segmentData.current
        )
      }
      .padding(24)
    }
    
    struct Header: View {
      @Binding var currentSegment: EditExceptionTimeCycleType
      
      var body: some View {
        Text(currentSegment.screenTitle)
          .textStyle(.semantics.screenTitle)
          .lineLimit(2)
          .multilineTextAlignment(.leading)
          .lineSpacing(6)
          .foregroundStyle(Color.titleColor)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
    }
    
    struct EditExceptionTimeView: View {
      var body: some View {
        VStack {
          Text("Select Time")
          
        }
      }
    }
  }
}
