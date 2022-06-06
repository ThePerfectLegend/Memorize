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
        Text("Memorize!")
            .font(.largeTitle)
            .fontWeight(.semibold)
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
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
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.75
    }
}
