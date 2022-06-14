//
//  Theme.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 14.06.2022.
//

import Foundation
import SwiftUI

struct Theme: Identifiable {
    let id = UUID().uuidString
    let name: String
    let emojis: Set<String>
    let colorTheme: Color
    var numberOfPairs: Int {
        emojis.count
    }
}
