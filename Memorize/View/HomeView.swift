//
//  HomeView.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 10.06.2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var game: EmojiMemoryGame // ?  пока не ясно нежна ли эта модель во вью
    @EnvironmentObject var theme: ThemeMemoryGame
    
    var body: some View {
        NavigationView {
            List {
                ForEach(theme.emojiGameThemes) { gameTheme in
                    NavigationLink {
                        EmojiMemoryGameView()
                            .onAppear {
                                theme.chosenTheme = gameTheme
                                /// - Warning: This is not the best decicion, creating a model should be under the hood
//                                game.model = EmojiMemoryGame.createMemoryGame(for: theme)
                            }
                    } label: {
                        GameThemeRowView(theme: gameTheme)
                            .listRowInsets(.init(top: 12, leading: 12, bottom: 12, trailing: 12))
                    }

                }
            }
            .listStyle(.automatic)
            .navigationTitle("Memorize 🧠")
        }
    }
}

