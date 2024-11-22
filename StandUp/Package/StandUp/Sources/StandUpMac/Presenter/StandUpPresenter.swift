//
// StandUpPresenter.swift
// StandUp
//
// Created by rei315 on 2024/11/19.
// Copyright © 2024 rei315. All rights reserved.
//

import Shared
import SwiftUI

final class StandUpViewData: ObservableObject {
  @Published var viewState: ViewStateDestinations = .top(source: .initial)
}

@MainActor
final class StandUpPresenter {
  private var viewData: StandUpViewData
  
  init(viewData: StandUpViewData) {
    self.viewData = viewData
  }
}
