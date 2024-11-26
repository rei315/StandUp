//
// SegmentedControl.swift
// StandUp
//
// Created by rei315 on 2024/11/27.
// Copyright © 2024 rei315. All rights reserved.
//


import SwiftUI

protocol SegmentTypeProtocol: CaseIterable, Identifiable, Equatable {
  var title: String { get }
  var id: Int { get }
}

protocol SegmentDataProtocol {
  associatedtype SegmentType: SegmentTypeProtocol
  var current: SegmentType { get set }
  var old: SegmentType { get set }
  init(current: SegmentType, old: SegmentType)
}

struct SegmentedControl<SegmentDataType: SegmentDataProtocol>: View where SegmentDataType.SegmentType.AllCases == [SegmentDataType.SegmentType] {
  struct Configuration {
    var selectedForegroundColor: Color = .white
    var selectedBackgroundColor: Color = .black.opacity(0.75)
    var foregroundColor: Color = .black
    var backgroundColor: Color = .gray.opacity(0.25)
  }
  
  @Binding var segmentData: SegmentDataType
  var configuration: Configuration = .init()
  private var cachedOldSegmentData: SegmentDataType
  
  init(segmentData: Binding<SegmentDataType>, configuration: Configuration) {
    self._segmentData = segmentData
    self.configuration = configuration
    self.cachedOldSegmentData = segmentData.wrappedValue
  }
  
  var body: some View {
    HStack(spacing: 1) {
      ForEach(SegmentDataType.SegmentType.allCases) { segment in
        Button {
          withAnimation(.interactiveSpring) {
            self.segmentData = .init(current: segment, old: self.segmentData.current)
          }
        } label: {
          Text(segment.title)
            .font(.system(size: 12, weight: .bold))
            .foregroundStyle(isSelected(segment: segment) ? configuration.selectedForegroundColor : configuration.foregroundColor)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 7)
            .background {
              if isSelected(segment: segment) {
                RoundedRectangle(cornerRadius: 6)
                  .fill(configuration.selectedBackgroundColor)
                  .frame(maxHeight: .infinity)
                  .padding(.vertical, 2)
              }
            }
        }
        .buttonStyle(.plain)
      }
    }
    .padding(.horizontal, 2)
    .background(
      configuration.backgroundColor
    )
    .clipShape(RoundedRectangle(cornerRadius: 8))
  }
  
  private func isSelected(segment: SegmentDataType.SegmentType) -> Bool {
    segmentData.current == segment
  }
}

extension View {
  @ViewBuilder
  func transitionBy(
    old: any SegmentTypeProtocol,
    current: any SegmentTypeProtocol
  ) -> some View {
    if old.id < current.id {
      self.transition(.asymmetric(insertion: .push(from: .trailing), removal: .push(from: .leading)))
    } else {
      self.transition(.asymmetric(insertion: .push(from: .leading), removal: .push(from: .trailing)))
    }
  }
}
