//
//  GameThemeRowView.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 10.06.2022.
//

import SwiftUI

struct GameThemeRowView: View {
        
    let theme: MemoryGame<String>.MemoryGameTheme
    
    var body: some View {
        VStack {
            HStack {
                Text(theme.emojis.randomElement() ?? "")
                    .font(.title3)
                VStack(alignment: .leading) {
                    HStack {
                        Text(theme.name)
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Circle()
                            .fill(theme.colorTheme)
                    }
                    HStack {
                        ForEach(theme.emojis.map{$0}, id: \.self) { emoji in
                            Text(emoji)
                        }
                    }
                }
            }
        }
    }
}

