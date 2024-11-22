//
// ViewStateDestinations.swift
// StandUp
//
// Created by rei315 on 2024/11/20.
// Copyright © 2024 rei315. All rights reserved.
//


import Foundation
import SwiftUI

public enum ViewStateDestinations {
  case top(source: TransitionSource)
  case editSchedule(source: TransitionSource)
  case profiles
  case settings
}

public enum TransitionSource {
  case initial
  case push
  case pop
}

extension View {
  @ViewBuilder
  public func transitionBy(source: TransitionSource) -> some View {
    switch source {
    case .push:
      self.transition(.asymmetric(insertion: .push(from: .trailing), removal: .push(from: .leading)))
    case .pop:
      self.transition(.asymmetric(insertion: .push(from: .leading), removal: .push(from: .trailing)))
    case .initial:
      self
    }
  }
}
