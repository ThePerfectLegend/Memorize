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
    @State var editingTheme: Theme?
    
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
                    }
                }
                .onMove(perform: theme.moveTheme)
                .onDelete(perform: theme.defaultDelete)
            }
            .navigationTitle("Memorize")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
        .environmentObject(game)
    }
}
