//
// TextStyle+.swift
// StandUp
//
// Created by rei315 on 2024/11/20.
// Copyright © 2024 rei315. All rights reserved.
//


import SwiftUI

@MainActor
public struct TextStyle: ViewModifier {
  let font: Font
  
  public init(font: Font) {
    self.font = font
  }
  
  public func body(content: Content) -> some View {
    content
      .font(font)
  }
}

extension TextStyle {
  public static let semantics: SemanticsTextStyle = .init()
}

@MainActor
public struct SemanticsTextStyle: Sendable {
  /// 20, bold
  public var appTitle: TextStyle = .init(font: .fontStyle.appTitle)
  /// 18, regular
  public var screenTitle: TextStyle = .init(font: .fontStyle.screenTitle)
  /// 18, bold
  public var titleLarge: TextStyle = .init(font: .fontStyle.titleLarge)
  /// 15, bold
  public var titleMedium: TextStyle = .init(font: .fontStyle.titleMedium)
  /// 13, bold
  public var titleSmall: TextStyle = .init(font: .fontStyle.titleSmall)
  
  /// 14, bold
  public var labelLargeBold: TextStyle = .init(font: .fontStyle.labelLargeBold)
  /// 12, bold
  public var labelMediumBold: TextStyle = .init(font: .fontStyle.labelMediumBold)
  /// 11, bold
  public var labelSmallBold: TextStyle = .init(font: .fontStyle.labelSmallBold)
  
  /// 14, regular
  public var labelLargeRegular: TextStyle = .init(font: .fontStyle.labelLargeRegular)
  /// 12, regular
  public var labelMediumRegular: TextStyle = .init(font: .fontStyle.labelMediumRegular)
  /// 11, regular
  public var labelSmallRegular: TextStyle = .init(font: .fontStyle.labelSmallRegular)
  
  /// 15, regular
  public var bodyLarge: TextStyle = .init(font: .fontStyle.bodyLarge)
  /// 13, regular
  public var bodyMedium: TextStyle = .init(font: .fontStyle.bodyMedium)
  /// 11, regular
  public var bodySmall: TextStyle = .init(font: .fontStyle.bodySmall)
}

@MainActor
public struct FontStyle: Sendable {
  /// 20, bold
  public var appTitle: Font = .system(size: 20, weight: .bold)
  /// 18, regular
  public var screenTitle: Font = .system(size: 18, weight: .regular)
  /// 18, bold
  public var titleLarge: Font = .system(size: 18, weight: .bold)
  /// 15, bold
  public var titleMedium: Font = .system(size: 15, weight: .bold)
  /// 13, bold
  public var titleSmall: Font = .system(size: 13, weight: .bold)
  
  /// 14, bold
  public var labelLargeBold: Font = .system(size: 14, weight: .bold)
  /// 12, bold
  public var labelMediumBold: Font = .system(size: 12, weight: .bold)
  /// 11, bold
  public var labelSmallBold: Font = .system(size: 11, weight: .bold)
  
  /// 14, regular
  public var labelLargeRegular: Font = .system(size: 14, weight: .regular)
  /// 12, regular
  public var labelMediumRegular: Font = .system(size: 12, weight: .regular)
  /// 11, regular
  public var labelSmallRegular: Font = .system(size: 11, weight: .regular)
  
  /// 15, regular
  public var bodyLarge: Font = .system(size: 15, weight: .regular)
  /// 13, regular
  public var bodyMedium: Font = .system(size: 13, weight: .regular)
  /// 11, regular
  public var bodySmall: Font = .system(size: 11, weight: .regular)
}

extension Font {
  public static let fontStyle: FontStyle = .init()
}

extension View {
  @ViewBuilder
  public func textStyle(_ style: TextStyle) -> some View {
    modifier(style)
  }
}
