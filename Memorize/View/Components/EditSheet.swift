//
//  EditSheet.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 17.06.2022.
//

import SwiftUI

struct EditSheet: View {
    
    @Binding var forTheme: Theme
    
    var body: some View {
        Text(forTheme.name)
        Button {
            print(forTheme.name)
        } label: {
            Text("Show theme")
        }

    }
}

