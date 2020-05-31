//
//  File.swift
//  Memorize
//
//  Created by Michael Bailey on 5/27/20.
//  Copyright © 2020 DefenseAR. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card){
        let chosenIndex = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in cards.indices {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 99
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex) 
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2+1))
            cards.shuffle()
        }
    }

    struct Card : Identifiable{
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
    
    func printCards(){
        for card in cards {
            print(card)
        }
    }
    
}
