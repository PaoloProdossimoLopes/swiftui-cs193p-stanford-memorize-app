//
//  ContentView.swift
//  Memorize
//
//  Created by Paolo Prodossimo Lopes on 20/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var numberOfCards: Int = 4
    @State var emojis = [
        "🐈", "🐶", "🌲", "🌵", "🦥", "🐓", "🦦", "🦜", "🦩", "🍄",
        "🦚", "🦨", "🌾", "🐕‍🦺", "🦮", "🐚", "🦡", "🪵", "🐁"
    ].shuffled()
    
    var body: some View {
        
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    let piceOfArray = emojis[0..<numberOfCards]
                    ForEach(piceOfArray, id: \.self) { emoji in
                        CardView(icon: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            
            Spacer()
            
            HStack(spacing: 50) {
                //remove
                createButton("minus.square", size: 40, action: removeCard)
                
                //Shuffle
                createButton("rectangle.2.swap", size: 50, action: shuffleCards)
                
                //Add
                createButton("plus.square", size: 40, action: addCard)
            }
            .padding(.vertical)
        }
        .padding()
        .foregroundColor(.red)
    }
    
    private func createButton(
        _ image: String, size: CGFloat, action: @escaping (() -> Void)
    ) -> some View {
        return Button(
            action: action,
            label: {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
            }
        )
    }
    
    private func removeCard() {
        if numberOfCards > 1 {
            numberOfCards -= 1
        }
    }
    
    private func shuffleCards() {
        emojis = emojis.shuffled()
    }
    
    private func addCard() {
        if numberOfCards < emojis.count {
            numberOfCards += 1
        }
    }
}

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
.previewInterfaceOrientation(.portrait)
        
        ContentView()
            .preferredColorScheme(.dark)
    }
}
