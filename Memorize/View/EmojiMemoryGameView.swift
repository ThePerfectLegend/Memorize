//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 28.05.2022.
//

import SwiftUI

struct EmojiMemoryGameView: View {
        
    @EnvironmentObject var game: EmojiMemoryGame
    @State private var dealt = Set<String>()
    @Namespace private var dealingNamespace
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                gameBody
                HStack {
                    shuffleButton
                    Spacer()
                    restart
                }
                .padding(.horizontal)
            }
            deckBody
        }
        .padding()
    }
}


extension EmojiMemoryGameView {
    
    private var gameBody: some View {
        AspectVGrid(items: game.cards, aspecrRatio: LocalConstants.aspectRatio) { card in
            if isUndealt(card) || card.isMatched && !card.isFaceUp {
                Color.clear
            } else {
                CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .padding(4)
                    .transition(AnyTransition.asymmetric(insertion: .identity, removal: .scale))
                    .zIndex(zIndex(of: card))
                    .onTapGesture {
                        withAnimation {
                            game.choose(card)
                        }
                    }
            }
        }
        .foregroundColor(LocalConstants.color)
    }
    
    private var deckBody: some View {
        ZStack {
            ForEach(game.cards.filter(isUndealt)) { card in
                CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
                    .zIndex(zIndex(of: card))
            }
        }
        .frame(width: LocalConstants.undealtWidht, height: LocalConstants.undealtHeight)
        .foregroundColor(LocalConstants.color)
        .onTapGesture {
            for card in game.cards {
                withAnimation(dealAnimation(for: card)) {
                    deal(card)
                }
            }
        }
    }
    
    private var shuffleButton: some View {
        Button {
            withAnimation {
                game.shuffle()
            }
        } label: {
            Text("Shuffle")
        }
    }
    
    /// Collects all card to the *deckBody* and finishes current game
    /// - Bug: Wrong animation here. Disappear instead dealing into the *deckBody*
    private var restart: some View {
        Button {
            withAnimation {
                game.restart()
                dealt = []
            }
        } label: {
            Text("Restart")
        }

    }
    
    private func deal(_ card: EmojiMemoryGame.Card) {
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card: EmojiMemoryGame.Card) -> Bool {
        !dealt.contains(card.id)
    }
    
    private func dealAnimation(for card: EmojiMemoryGame.Card) -> Animation {
        var delay = 0.0
        if let index = game.cards.firstIndex(where: { $0.id == card.id }) {
            delay = Double(index) * (LocalConstants.totalDealDuration / Double(game.cards.count))
        }
        return Animation.easeInOut(duration: LocalConstants.dealDuration).delay(delay)
    }
    
    private func zIndex(of card: EmojiMemoryGame.Card) -> Double {
        -Double(game.cards.firstIndex(where: { $0.id == card.id }) ?? 0)
    }
    
    private struct LocalConstants {
        static let color = Color.red
        static let aspectRatio: CGFloat = 2/3
        static let dealDuration: Double = 0.5
        static let totalDealDuration: Double = 2
        static let undealtHeight: CGFloat = 90
        static let undealtWidht = undealtHeight * aspectRatio
    }
}
