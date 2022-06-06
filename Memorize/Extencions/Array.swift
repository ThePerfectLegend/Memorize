//
//  Array.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 06.06.2022.
//

import Foundation

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
