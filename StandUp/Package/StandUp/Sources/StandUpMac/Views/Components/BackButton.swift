//
// BackButton.swift
// StandUp
//
// Created by rei315 on 2024/11/20.
// Copyright © 2024 rei315. All rights reserved.
//


import SwiftUI
import Shared

struct BackButton: View {
  let action: () -> Void
  
  var body: some View {
    Button {
      withAnimation {
        action()
      }
    } label: {
      Label {
        Text("戻る")
          .textStyle(.semantics.bodyLarge)
          .foregroundStyle(Color.gray)
      } icon: {
        Image(systemName: "chevron.left")
          .foregroundStyle(Color.gray)
      }
    }
    .buttonStyle(.borderless)
  }
}
