//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 28.05.2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    @StateObject private var emojiGame = EmojiMemoryGame()
    @StateObject private var theme = ThemeMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(emojiGame)
                .environmentObject(theme)
        }
    }
}
