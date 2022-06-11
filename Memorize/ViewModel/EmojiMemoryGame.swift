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
    
    @Published var chosenTheme: Theme?
    @Published var model: MemoryGame<String>?

    
    @Published var emojiGameThemes: [Theme] = [
        Theme(name: "Vehicles", emojis: ["✈️", "🚀", "🚗", "⛵️", "🏎", "🛸", "🚁", "🚤", "🏍", "🛺", "🛴", "🚂", "🚜"], colorTheme: .red),
        Theme(name: "Animals", emojis: ["🦜", "🐖", "🐄", "🦈", "🦔", "🐔", "🐒", "🐮", "🦑", "🐊", "🐅", "🦍"], colorTheme: .green),
        Theme(name: "Food", emojis: ["🥩", "🍔", "🥥", "🌮", "🍕", "🍰", "🍩", "🍤", "🧀", "🥑", "🍌"], colorTheme: .pink),
        Theme(name: "Flags", emojis: ["🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇦🇿", "🇬🇷", "🇨🇺", "🇰🇵", "🇵🇰", "🇯🇵", "🇯🇲", "🇩🇴", "🇪🇸", "🇪🇺", "🇺🇬", "🇺🇸", "🇮🇲", "🇮🇪"], colorTheme: .blue),
        Theme(name: "Tech", emojis: ["📱", "💻", "🖥", "🕹", "🎙", "📸", "💾", "📺", "📡", "💿", "📽", "📹", "📻"], colorTheme: .gray),
        Theme(name: "Simbols", emojis: ["🕉", "☣️", "🆘", "🅿️", "🀄️", "👁‍🗨", "🎦", "♠️", "🚼", "💹", "💮", "💝", "♦️", "🕒"], colorTheme: .purple)
    ]
    
    static func createMemoryGame(for theme: Theme?) -> MemoryGame<String>? {
        if let theme = theme {
          return MemoryGame<String>(numberOfPairsOfCards: theme.emojis.count) { pairIndex in
                theme.emojis.map{$0}[pairIndex]
            }
        } else {
            return nil
        }
    }
    
    
    var cards: Array<Card>? {
        model?.cards
    }
    
    
    // MARK: - Intents(s)
    
    func choose(_ card: Card) {
        model?.choose(card)
    }
    
    func shuffle() {
        model?.cards.shuffle()
    }
    
    func restart() {
        if model != nil {
            self.model = EmojiMemoryGame.createMemoryGame(for: chosenTheme)
        } else {
            return
        }
    }
}


