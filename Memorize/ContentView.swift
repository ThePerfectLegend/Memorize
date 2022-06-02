//
//  ContentView.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 28.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var emojis: [String]
    @State var colorTheam: Color = .red
    
    init() {
        self.emojis = vechiles
    }
    
    var vechiles = ["✈️", "🚀", "🚆", "⛵️", "🏎", "🛸", "🚁", "🚤", "🛶", "🛺"]
    var animals = ["🐶", "🐸", "🦂", "🦆", "🦊", "🦎", "🐬", "🦄", "🦉"]
    var flags = ["🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇦🇿", "🇬🇷", "🇨🇺", "🇰🇵", "🇵🇰", "🇯🇵", "🇯🇲"]
    
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .fontWeight(.semibold)
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(emojis[0..<emojis.count], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(colorTheam)
            Spacer()
            cardThemeSelector
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}

extension ContentView {
    
    private var cardThemeSelector: some View {
        HStack(spacing: 60) {
            Button {
                emojis = vechiles.shuffled()
                colorTheam = .red
            } label: {
                VStack(spacing: 4) {
                    Image(systemName: "car.fill")
                        .font(.title)
                    Text("Vehicles")
                        .font(.footnote)
                }
            }

            Button {
                emojis = animals.shuffled()
                colorTheam = .orange
            } label: {
                VStack {
                    Image(systemName: "pawprint.fill")
                        .font(.title)
                    Text("Animals")
                        .font(.footnote)
                }
            }

            Button {
                emojis = flags.shuffled()
                colorTheam = .green
            } label: {
                VStack {
                    Image(systemName: "flag.fill")
                        .font(.title)
                    Text("Flags")
                        .font(.footnote)
                }
            }

        }
    }
    
    
}

struct CardView: View {
    
    var content: String
    @State private var isfaceUp: Bool = true
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if isfaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }
        .onTapGesture {
            isfaceUp.toggle()
        }
    }
}
