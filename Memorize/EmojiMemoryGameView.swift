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
                let shape = RoundedRectangle(cornerRadius: Constants.cornerRadius)
                if card.isFaceUp {
                    shape
                        .fill()
                        .foregroundColor(.white)
                    shape
                        .strokeBorder(lineWidth: Constants.lineWidth)
                    Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                        .opacity(Constants.circleOpaciry)
                        .padding(Constants.circlePaddind)
                    Text(card.content)
                        .font(adoptContnentFont(in: geo.size))
                } else if card.isMathced {
                    shape.opacity(0)
                } else {
                    shape
                        .fill()
                }
            }
        }
    }
    
    private func adoptContnentFont(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * Constants.fontScale)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.7
        static let circlePaddind: CGFloat = 5
        static let circleOpaciry: Double = 0.5
    }
}
