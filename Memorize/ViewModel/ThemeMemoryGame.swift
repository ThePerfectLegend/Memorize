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
        Theme(name: "Vehicles", emojis: ["✈️", "🚀", "🚗", "⛵️", "🏎", "🛸", "🚁", "🚤", ], colorTheme: .red),
        Theme(name: "Animals", emojis: ["🦜", "🐄", "🦈", "🦔", "🐒", "🦑", "🐊", "🐅", "🦍"], colorTheme: .green),
        Theme(name: "Food", emojis: ["🥩", "🍔", "🥥", "🌮", "🍕", "🍰", "🍩", "🍤", "🧀", "🥑", "🍌"], colorTheme: .pink),
        Theme(name: "Flags", emojis: ["🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇦🇿", "🇬🇷", "🇨🇺", "🇰🇵", "🇵🇰", "🇯🇵"], colorTheme: .blue),
        Theme(name: "Tech", emojis: ["📱", "💻", "🖥", "🕹", "🎙", "📸", "💾"], colorTheme: .gray),
        Theme(name: "Simbols", emojis: ["🕉", "☣️", "🀄️", "👁‍🗨", "🎦", "♠️", "💮", "💝", "♦️"], colorTheme: .purple)
    ]
    
    func delete(theme: Theme) {
        if let deleteThemeIndex = self.emojiGameThemes.firstIndex(where: { $0.id == theme.id }) {
            self.emojiGameThemes.remove(at: deleteThemeIndex)
        }
    }
    
    func moveTheme(indices: IndexSet, newOffset: Int) {
        self.emojiGameThemes.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func defaultDelete(indexSet: IndexSet) {
        self.emojiGameThemes.remove(atOffsets: indexSet)

    }
}
