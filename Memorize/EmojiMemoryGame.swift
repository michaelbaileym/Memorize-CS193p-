//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Michael Bailey on 5/27/20.
//  Copyright © 2020 DefenseAR. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model : MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: [String] = ["👻","🎃", "🦇", "🍬", "😈"]
        //Int.random(in: 1...emojis.count)
        return MemoryGame(numberOfPairsOfCards: 5) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: -Access to the model
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK: -Intent(s)
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
