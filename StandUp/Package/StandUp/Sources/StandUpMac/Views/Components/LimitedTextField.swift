//
// LimitedTextField.swift
// StandUp
//
// Created by rei315 on 2024/11/24.
// Copyright © 2024 rei315. All rights reserved.
//

import SwiftUI

struct LimitedTextField<T: LosslessStringConvertible>: View {
  let title: String
  @Binding var value: T
  let maxLength: Int
  
  var body: some View {
    TextField(
      title,
      text: Binding<String>(
        get: { String(value) },
        set: { newValue in
          if let newTypedValue = T(String(newValue.prefix(maxLength))) {
            value = newTypedValue
          }
        }
      )
    )
  }
}
