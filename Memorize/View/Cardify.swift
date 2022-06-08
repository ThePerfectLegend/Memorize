//
//  Cardify.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 08.06.2022.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: Constants.lineWidth)
            } else {
                shape
                    .fill()
            }
            content
                .opacity(isFaceUp ? 1 : 0)
        }
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
        
}

extension View {
    /// Modifies View into Card
    /// - Parameter isFaceUp: Bool
    ///
    /// - Returns: A view that comforms to Cardify
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
