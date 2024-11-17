//
//  Item.swift
//  StandUp
//
//  Created by mingukkim on 2024/11/18.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
