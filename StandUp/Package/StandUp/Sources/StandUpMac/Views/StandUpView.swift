//
// StandUpView.swift
// StandUpDebug
//
// Created by rei315 on 2024/11/18.
// Copyright © 2024 rei315. All rights reserved.
//

import Shared
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
    Group {
      switch viewData.viewState {
      case let .top(source):
        TopView(viewState: $viewData.viewState)
          .transitionBy(source: source)
      case let .editSchedule(source):
        EditScheduleView(viewState: $viewData.viewState)
          .transitionBy(source: source)
      case .profiles:
        EmptyView()
      case .settings:
        EmptyView()
      }
    }
    .frame(width: 400)
    .frame(idealHeight: 400)
  }
}
