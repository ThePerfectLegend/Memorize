//
//  HomeView.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 10.06.2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var game: EmojiMemoryGame
    
    var body: some View {
        NavigationView {
            List {
                ForEach(game.emojiGameThemes) { theme in
                    NavigationLink {
                        EmojiMemoryGameView()
                    } label: {
                        GameThemeRowView(theme: theme)
                            .listRowInsets(.init(top: 12, leading: 12, bottom: 12, trailing: 12))
                    }

                }
            }
            .listStyle(.automatic)
            .navigationTitle("Memorize 🧠")
        }
    }
}

