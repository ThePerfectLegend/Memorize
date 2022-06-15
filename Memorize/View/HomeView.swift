//
//  HomeView.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 10.06.2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var game: EmojiMemoryGame
    @EnvironmentObject var theme: ThemeMemoryGame
    
    var body: some View {
        NavigationView {
            List {
                ForEach(theme.emojiGameThemes) { gameTheme in
                    NavigationLink {
                        EmojiMemoryGameView()
                            .onAppear {
                                theme.chosenTheme = gameTheme
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
        .environmentObject(game)
    }
}

