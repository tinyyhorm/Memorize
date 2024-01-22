//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by ZhouGuohao on 19/01/24.
//

import SwiftUI

class EmojiMemoryGame {
    let emoji = ["🤓", "🥲", "🤓", "🥲", "🤓", "🥲", "🤓", "🥲"]

    private var model = MemoryGame(numberOfPairsOfCards: 4) {index in
        return emoji[index]
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
