//
//  CardView.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 09.06.2022.
//

import SwiftUI


struct CardView: View {
    
    let card: EmojiMemoryGame.Card
    
    @State private var animatedBonusRemaining: Double = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1 - animatedBonusRemaining) * 360  - 90))
                            .onAppear {
                                animatedBonusRemaining = card.bonusRemaining
                                withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                                    animatedBonusRemaining = 0
                                }
                            }
                    } else {
                        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1 - card.bonusRemaining) * 360  - 90))
                    }
                }
                .opacity(LocalConstants.circleOpaciry)
                .padding(LocalConstants.circlePaddind)
                Text(card.content)
                    .rotationEffect(Angle(degrees: card.isMatched ? 360 : 0))
                    .animation(Animation.easeInOut(duration: 2), value: card.isMatched)
                    .font(Font.system(size: LocalConstants.fontSize))
                    .scaleEffect(scale(thatFits: geo.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
}

extension CardView {
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (LocalConstants.fontSize / LocalConstants.fontScale)
    }
    
    private struct LocalConstants {
        static let fontScale: CGFloat = 0.7
        static let circlePaddind: CGFloat = 5
        static let circleOpaciry: Double = 0.5
        static let fontSize: CGFloat = 32
    }
}

