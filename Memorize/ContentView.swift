//
//  ContentView.swift
//  Memorize
//
//  Created by Michael Bailey on 5/26/20.
//  Copyright © 2020 DefenseAR. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
    
    var body: some View {
            return HStack {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .onTapGesture { self.viewModel.choose(card: card)}
                            .aspectRatio(2/3, contentMode: .fit)
                        
                    }
                }
                    .padding()
                    .foregroundColor(Color.orange)
        }
        
}

struct CardView: View {
    var card : MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornorRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornorRadius).stroke(lineWidth: lineWidth)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornorRadius).fill()
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    
    // MARK:  - Drawing Constants
    let cornorRadius: CGFloat = 10.0
    let lineWidth: CGFloat = 3.0
    let fontScaleRatio: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleRatio
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
