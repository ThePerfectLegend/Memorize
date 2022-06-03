//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 02.06.2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    static let emojis = ["✈️", "🚀", "🚆", "⛵️", "🏎", "🛸", "🚁", "🚤", "🛶", "🛺"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}




//var vechiles = ["✈️", "🚀", "🚆", "⛵️", "🏎", "🛸", "🚁", "🚤", "🛶", "🛺"]
//var animals = ["🐶", "🐸", "🦂", "🦆", "🦊", "🦎", "🐬", "🦄", "🦉"]
//var flags = ["🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇦🇿", "🇬🇷", "🇨🇺", "🇰🇵", "🇵🇰", "🇯🇵", "🇯🇲"]
