//
// StandUpView.swift
// StandUpDebug
//
// Created by rei315 on 2024/11/18.
// Copyright © 2024 rei315. All rights reserved.
//

import SwiftUI

public struct StandUpView: View {
  @ObservedObject var viewData: StandUpViewData
  private let presenter: StandUpPresenter
  
  public init() {
    let viewData = StandUpViewData()
    self.viewData = viewData
    presenter = .init(viewData: viewData)
  }
  
  public var body: some View {
    VStack {
      switch viewData.viewState {
      case .top:
        TopView(viewState: $viewData.viewState)
          .transition(.opacity)
      case .editSchedule:
        EditScheduleView(viewState: $viewData.viewState)
          .transition(.opacity)
      case .profiles:
        EmptyView()
      case .settings:
        EmptyView()
      }
    }
    .frame(width: 400)
    .frame(maxHeight: 400)
  }
}
