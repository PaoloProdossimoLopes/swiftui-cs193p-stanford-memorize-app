//
//  CardView.swift
//  Memorize
//
//  Created by Paolo Prodossimo Lopes on 21/02/22.
//

import SwiftUI

struct CardView: View {
    let icon: String
    
    @State private var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let recShape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                recShape.fill().foregroundColor(.white)
                recShape.strokeBorder(lineWidth: 3)
                Text(icon).font(.largeTitle)
            } else {
                recShape.fill()
            }
        }.onTapGesture { isFaceUp.toggle() }
    }
}
