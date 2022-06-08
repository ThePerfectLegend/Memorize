//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 28.05.2022.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @StateObject var game: EmojiMemoryGame
    
    var body: some View {
        AspectVGrid(items: game.cards, aspecrRatio: 2/3) { card in
            if card.isMathced && !card.isFaceUp {
                Rectangle()
                    .opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}



struct CardView: View {
    
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                    .opacity(Constants.circleOpaciry)
                    .padding(Constants.circlePaddind)
                Text(card.content)
                    .rotationEffect(Angle(degrees: card.isMathced ? 360 : 0))
                    .animation(Animation.easeInOut(duration: 2), value: card.isMathced)
                    .font(Font.system(size: Constants.fontSize))
                    .scaleEffect(scale(thatFits: geo.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (Constants.fontSize / Constants.fontScale)
    }

    
    private struct Constants {
        static let fontScale: CGFloat = 0.7
        static let circlePaddind: CGFloat = 5
        static let circleOpaciry: Double = 0.5
        static let fontSize: CGFloat = 32
    }
}