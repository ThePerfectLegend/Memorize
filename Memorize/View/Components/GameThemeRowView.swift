//
//  GameThemeRowView.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 10.06.2022.
//

import SwiftUI

struct GameThemeRowView: View {
        
    let theme: Theme
    
    var body: some View {
        VStack {
            HStack {
                Text(theme.emojis.randomElement() ?? "")
                    .font(Font.system(size: LocalConstants.emojiFontSize))
                VStack(alignment: .leading) {
                    HStack {
                        Text(theme.name)
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Circle()
                            .fill(theme.colorTheme)
                            .frame(width: LocalConstants.colorSize, height: LocalConstants.colorSize)
                    }
                }
            }
        }
    }
}

extension GameThemeRowView {
    private struct LocalConstants {
        static let emojiFontSize: CGFloat = 28
        static let colorSize: CGFloat = 24
    }
}
