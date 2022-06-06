//
//  MemoryGame.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 02.06.2022.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    
    var cards: Array<Card>
    
    private var indexOfFirstCardAndOnlyCard: Int? {
        get {
            cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly
        }
        set {
            cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue) }
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMathced
        {
            if let potentialMatchIndex = indexOfFirstCardAndOnlyCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMathced = true
                    cards[potentialMatchIndex].isMathced = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfFirstCardAndOnlyCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card: Identifiable {
        let id = UUID()
        var isFaceUp = false
        var isMathced = false
        let content: CardContent
    }
    
}
