//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 02.06.2022.
//

import SwiftUI
import Combine

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    @Published private(set) var model: MemoryGame<String>?
    
    private let gameTheme: ThemeMemoryGame
    
    init(gameTheme: ThemeMemoryGame) {
        self.gameTheme = gameTheme
        addSubscribers()
    }
    
    private func addSubscribers() {
        gameTheme.$chosenTheme
            .map(createMemoryGame)
            .assign(to: &$model)
    }
        
    private func createMemoryGame(for theme: Theme?) -> MemoryGame<String>? {
        if let theme = theme {
            print("Game created")
            return MemoryGame<String>(numberOfPairsOfCards: theme.emojis.count) { pairIndex in
                theme.emojis.map{$0}[pairIndex]
            }
        } else {
            print("Game don't setted")
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
        self.model = createMemoryGame(for: gameTheme.chosenTheme)
    }
}
