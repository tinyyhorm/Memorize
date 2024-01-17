//
//  ContentView.swift
//  Memorize
//
//  Created by ZhouGuohao on 17/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUP: true)
            CardView()
            CardView()
        }
        .foregroundColor(.purple)
        .padding()
    }
}

struct CardView: View {
    var isFaceUP: Bool = false
    var body: some View {
        ZStack(content: {
            if isFaceUP {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 6)
                Text("😅")
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        })
    }
}

#Preview {
    ContentView()
}
