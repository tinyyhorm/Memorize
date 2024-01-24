//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by ZhouGuohao on 17/01/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    let emojis: Array<String> = ["🤓", "🥲", "🤓", "🥲", "🤓", "🥲", "🤓", "🥲"]
    @State var cardCount: Int = 4

    var body: some View {
        VStack{
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjuster
            .imageScale(.large)
            .font(.largeTitle)
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
            .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
        }
        .foregroundColor(.purple)
    }
    
    var cardCountAdjuster: some View {
        HStack{
            cardAdd
            Spacer()
            cardRemove
        }
    }
    
    func cardCountAdjuster (by offset: Int, symble: String) -> some View {
        Button(action: {
            if cardCount < emojis.count {
                cardCount += offset
            }
        }, label: {
            Image(systemName: symble)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
        
    }
    
    var cardAdd: some View {
        cardCountAdjuster(by: +1, symble: "plus.circle")
    }
    
    var cardRemove: some View {
        cardCountAdjuster(by: -1, symble: "minus.circle")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack() {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.stroke(lineWidth: 6)
                Text(content)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    EmojiMemoryGameView()
}
