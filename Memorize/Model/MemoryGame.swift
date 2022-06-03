//
//  MemoryGame.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 02.06.2022.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    
    var cards: Array<Card>
    
    private var indexOfFirstCardAndOnlyCard: Int?
    
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
                indexOfFirstCardAndOnlyCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfFirstCardAndOnlyCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card: Identifiable {
        let id = UUID()
        var isFaceUp: Bool = false
        var isMathced: Bool = false
        var content: CardContent
    }
    
}
