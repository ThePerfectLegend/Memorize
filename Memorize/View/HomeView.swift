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
                    }
                }
                .onDelete(perform: theme.deleteTheme)
                /// - Bug: Leaving edit mode after finish of moving gesture
                .onMove(perform: theme.moveTheme)
                //.edit
//            https://stackoverflow.com/questions/57496453/swiftui-how-do-i-make-edit-rows-in-a-list
//            https://developer.apple.com/forums/thread/699277
//            https://stackoverflow.com/questions/57112426/swiftui-custom-swipe-actions-in-list
//            https://stackoverflow.com/questions/70869333/swiftui-edit-list-row-relement-with-swipe-action-and-present-modal-sheet
//            https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-custom-swipe-action-buttons-to-a-list-row
//            https://developer.apple.com/documentation/swiftui/capsule/swipeactions(edge:allowsfullswipe:content:)/
            }
            .navigationTitle("Memorize")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    addTheme
                }
            }
        }
        .environmentObject(game)
    }
}

extension HomeView {
    
    var addTheme: some View {
        Button {
            print("Sheet should be pop-up here")
        } label: {
            Image(systemName: "plus")
        }

    }
}
