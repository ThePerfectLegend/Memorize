//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 28.05.2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
