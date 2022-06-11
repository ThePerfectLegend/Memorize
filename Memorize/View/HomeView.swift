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
                            .onAppear {
                                game.chosenTheme = theme
                                /// - Warning: This is not the best decicion, creating a model should be under the hood
                                game.model = EmojiMemoryGame.createMemoryGame(for: theme)
                            }
                            .onDisappear {
                                game.chosenTheme = nil
                                game.model = nil
                            }
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

