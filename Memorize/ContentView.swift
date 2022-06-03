//
//  ContentView.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 28.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Text("Memorize!")
            .font(.largeTitle)
            .fontWeight(.semibold)
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

extension ContentView {
    
    
    
}

struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if card.isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMathced {
                shape.opacity(0)
            } else {
                shape
                    .fill()
            }
        }
    }
}
