//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 02.06.2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    typealias Theme = MemoryGame<String>.MemoryGameTheme
    
    private static var emojis = ["✈️", "🚀", "🚆", "⛵️", "🏎", "🛸", "🚁", "🚤", "🛶", "🛺"]
    
    @Published var emojiGameThemes: [Theme] = [
        Theme(name: "Vehicles", emojis: ["✈️", "🚀", "🚗", "⛵️", "🏎", "🛸", "🚁", "🚤", "🏍", "🛺", "🛴", "🚂", "🚜"], colorTheme: .red),
        Theme(name: "Animals", emojis: ["🦜", "🐖", "🐄", "🦈", "🦔", "🐔", "🐒", "🐮", "🦑", "🐊", "🐅", "🦍"], colorTheme: .green),
        Theme(name: "Food", emojis: ["🥩", "🍔", "🥥", "🌮", "🍕", "🍰", "🍩", "🍤", "🧀", "🥑", "🍌"], colorTheme: .pink),
        Theme(name: "Flags", emojis: ["🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇦🇿", "🇬🇷", "🇨🇺", "🇰🇵", "🇵🇰", "🇯🇵", "🇯🇲", "🇩🇴", "🇪🇸", "🇪🇺", "🇺🇬", "🇺🇸", "🇮🇲", "🇮🇪"], colorTheme: .blue),
        Theme(name: "Tech", emojis: ["📱", "💻", "🖥", "🕹", "🎙", "📸", "💾", "📺", "📡", "💿", "📽", "📹", "📻"], colorTheme: .gray),
        Theme(name: "Simbols", emojis: ["🕉", "☣️", "🆘", "🅿️", "🀄️", "👁‍🗨", "🎦", "♠️", "🚼", "💹", "💮", "💝", "♦️", "🕒"], colorTheme: .purple)
    ]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    
    // MARK: - Intents(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.cards.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}


