//
//  TextField.swift
//  Memorize
//
//  Created by Nizami Tagiyev on 17.06.2022.
//

import SwiftUI

struct EditField: View {
    
    @Binding var forText: String

    var body: some View {
        TextField("Enter theme name...", text: $forText)
    }
}

