//
//  ThemeMemoryGame.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 14.06.2022.
//

import Foundation

class ThemeMemoryGame: ObservableObject {
    
    @Published var chosenTheme: Theme?
    
    @Published var emojiGameThemes: [Theme] = [
        Theme(name: "Vehicles", emojis: ["✈️", "🚀", "🚗", "⛵️", "🏎", "🛸", "🚁", "🚤", "🏍", "🛺", "🛴", "🚂", "🚜"], colorTheme: .red),
        Theme(name: "Animals", emojis: ["🦜", "🐖", "🐄", "🦈", "🦔", "🐔", "🐒", "🐮", "🦑", "🐊", "🐅", "🦍"], colorTheme: .green),
        Theme(name: "Food", emojis: ["🥩", "🍔", "🥥", "🌮", "🍕", "🍰", "🍩", "🍤", "🧀", "🥑", "🍌"], colorTheme: .pink),
        Theme(name: "Flags", emojis: ["🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇦🇿", "🇬🇷", "🇨🇺", "🇰🇵", "🇵🇰", "🇯🇵", "🇯🇲", "🇩🇴", "🇪🇸", "🇪🇺", "🇺🇬", "🇺🇸", "🇮🇲", "🇮🇪"], colorTheme: .blue),
        Theme(name: "Tech", emojis: ["📱", "💻", "🖥", "🕹", "🎙", "📸", "💾", "📺", "📡", "💿", "📽", "📹", "📻"], colorTheme: .gray),
        Theme(name: "Simbols", emojis: ["🕉", "☣️", "🆘", "🅿️", "🀄️", "👁‍🗨", "🎦", "♠️", "🚼", "💹", "💮", "💝", "♦️", "🕒"], colorTheme: .purple)
    ]
}
