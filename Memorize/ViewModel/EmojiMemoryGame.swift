//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 02.06.2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    // Модель должна подхватывать изменения в выбранной теме и создавать игру с выбранной темой
    @Published private(set) var model: MemoryGame<String>?

    
    private func createMemoryGame(for theme: Theme?) -> MemoryGame<String>? {
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
//        if model != nil {
//            self.model = EmojiMemoryGame.createMemoryGame(for: chosenTheme)
//        } else {
//            return
//        }
    }
}


