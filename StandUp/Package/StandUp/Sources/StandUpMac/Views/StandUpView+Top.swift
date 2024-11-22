//
// StandUpView+Top.swift
// StandUp
//
// Created by rei315 on 2024/11/19.
// Copyright © 2024 rei315. All rights reserved.
//


import SwiftUI

extension StandUpView {
  struct TopView: View {
    @State private var isEnabled = true
    @Binding var viewState: ViewStateDestinations
    
    var body: some View {
      VStack {
        header
        
        if isEnabled {
          contentView
        } else {
          contentEmptyView
        }
      }
      .padding(.horizontal, 24)
      .padding(.top, 24)
    }
    
    @MainActor @ViewBuilder
    private var header: some View {
      VStack {
        Text("StandUp")
          .font(.title)
          .foregroundStyle(Color.white)
          .frame(maxWidth: .infinity, alignment: .leading)
        
        HStack {
          Spacer()
          Toggle(isOn: $isEnabled) {
            Text("enabled")
              .foregroundStyle(Color.white)
          }
          .toggleStyle(ImageToggleStyle(onImageName: "", offImageName: "", isOn: isEnabled))
        }
      }
    }
    
    @MainActor @ViewBuilder
    private var contentView: some View {
      ScrollView(.vertical) {
        Section {
          ContentCell(viewState: $viewState)
        } header: {
          ContentHeader()
        }
        Spacer(minLength: 24)
      }
    }
    
    private struct ContentCell: View {
      @Binding var viewState: ViewStateDestinations
      
      var body: some View {
        HStack(spacing: 24) {
          HStack {
            Button {
              withAnimation {
                viewState = .editSchedule
              }
            } label: {
              Text("...")
                .foregroundStyle(Color.white)
                .padding(8)
            }
            Text("마다")
              .foregroundStyle(Color.white)
          }
          HStack {
            Button {
              withAnimation {
                viewState = .editSchedule
              }
            } label: {
              Text("...")
                .foregroundStyle(Color.white)
                .padding(8)
            }
            Text("동안")
              .foregroundStyle(Color.white)
          }
          Spacer()
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 8))
      }
    }
    
    private struct ContentHeader: View {
      var body: some View {
        Text("주기")
          .foregroundStyle(Color.white)
          .frame(maxWidth: .infinity, alignment: .leading)
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
        .frame(width: 51, height: 31, alignment: .center)
        .overlay(
          Circle()
            .foregroundColor(isOn ? .green : .gray)
            .padding(.all, 3)
            .offset(x: isOn ? 11 : -11, y: 0)
        ).cornerRadius(20)
        .onTapGesture {
          configuration.isOn.toggle()
          withAnimation(.linear(duration: 0.1)) {
            isOn.toggle()
          }
        }
    }
  }
}
