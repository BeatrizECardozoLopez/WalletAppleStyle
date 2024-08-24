//
//  CardView.swift
//  Day18-AppleWallet
//
//  Created by Beatriz Cardozo on 23/8/24.
//

import SwiftUI

struct CardView: View {
    
    var card: Card
    
    var body: some View {
        
        Image(card.image)
            .resizable()
            .scaledToFit()
            .overlay(
                VStack (alignment: .leading){
                    Text(card.number)
                        .bold()
                    
                    HStack{
                        Text(card.name)
                            .font(.system(.callout))
                        
                        Text(card.expirationDate)
                            .font(.system(.caption))
                    }
                }
                .foregroundStyle(.white)
                .padding(.leading, 24)
                .padding(.bottom, 24)
                , alignment: .bottomLeading
            )
            .shadow(color: .gray, radius: 2, x:0, y:0)
        
    }
}

#Preview {
    CardView(card: cardsData[0])
}
