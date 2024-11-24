//
// StandUpView+Top.swift
// StandUp
//
// Created by rei315 on 2024/11/19.
// Copyright © 2024 rei315. All rights reserved.
//

import Shared
import SwiftUI

extension StandUpView {
  struct TopView: View {
    @State private var isEnabled = true
    @Binding var viewState: ViewStateDestinations
    
    var body: some View {
      VStack(spacing: 24) {
        header
        
        if isEnabled {
          contentView
        } else {
          contentEmptyView
        }
      }
      .padding(24)
    }
    
    @MainActor @ViewBuilder
    private var header: some View {
      HStack {
        Text("StandUp")
          .textStyle(.semantics.appTitle)
          .foregroundStyle(Color.titleColor)
          .frame(maxWidth: .infinity, alignment: .leading)
        
        Spacer()
        
        Toggle(isOn: $isEnabled, label: {})
          .toggleStyle(ImageToggleStyle(onImageName: "", offImageName: "", isOn: isEnabled))
      }
    }
    
    @MainActor @ViewBuilder
    private var contentView: some View {
      ScrollView(.vertical) {
        VStack(spacing: 16) {
          TimeCycleCell(
            timeCycleForEvery: .init(),
            timeCycleForDuring: .init(),
            onTapTimeCycleView: {
              withAnimation {
                viewState = .editSchedule(source: .push)
              }
            }
          )
          
          ExceptionTimeCycleCell(exceptionTimes: []) {
            withAnimation {
              viewState = .addExceptionSchedule(source: .push)
            }
          }
        }
      }
    }
    
    @MainActor @ViewBuilder
    private var contentEmptyView: some View {
      Spacer(minLength: 24)
    }
  }
}

struct ImageToggleStyle: ToggleStyle {
  var onImageName: String
  var offImageName: String
  
  @State var isOn: Bool
  
  func makeBody(configuration: Configuration) -> some View {
    HStack(spacing: 8) {
      configuration.label
      
      Image(isOn ? onImageName : offImageName)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 56, height: 28, alignment: .center)
        .overlay(
          Circle()
            .foregroundColor(isOn ? .green : .gray)
            .padding(4)
            .offset(x: isOn ? 18 : -18, y: 0)
        )
        .clipShape(Capsule())
        .onTapGesture {
          configuration.isOn.toggle()
          withAnimation(.linear(duration: 0.1)) {
            isOn.toggle()
          }
        }
    }
  }
}
