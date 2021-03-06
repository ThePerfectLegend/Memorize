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
        Theme(name: "Vehicles", emojis: ["âď¸", "đ", "đ", "âľď¸", "đ", "đ¸", "đ", "đ¤", ], colorTheme: .red),
        Theme(name: "Animals", emojis: ["đŚ", "đ", "đŚ", "đŚ", "đ", "đŚ", "đ", "đ", "đŚ"], colorTheme: .green),
        Theme(name: "Food", emojis: ["đĽŠ", "đ", "đĽĽ", "đŽ", "đ", "đ°", "đŠ", "đ¤", "đ§", "đĽ", "đ"], colorTheme: .pink),
        Theme(name: "Flags", emojis: ["đ´ó §ó ˘ó ˇó Źó łó ż", "đŚđż", "đŹđˇ", "đ¨đş", "đ°đľ", "đľđ°", "đŻđľ"], colorTheme: .blue),
        Theme(name: "Tech", emojis: ["đą", "đť", "đĽ", "đš", "đ", "đ¸", "đž"], colorTheme: .gray),
        Theme(name: "Simbols", emojis: ["đ", "âŁď¸", "đď¸", "đâđ¨", "đŚ", "â ď¸", "đŽ", "đ", "âŚď¸"], colorTheme: .purple)
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
