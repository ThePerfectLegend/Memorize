//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 28.05.2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    @StateObject private var theme = ThemeMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            HomeView(game: EmojiMemoryGame(gameTheme: theme))
                .environmentObject(theme)
        }
    }
}


/** - Note:
- Wrong animation when cards go to desc
- Add rotating animation while cards going
- Glinch when truing to move rows on main screen
- Need to create sepate Buttons for Edit and Del Row with custom ButtonRole https://developer.apple.com/documentation/swiftui/buttonrole

 */
