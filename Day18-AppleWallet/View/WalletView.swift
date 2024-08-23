//
//  ContentView.swift
//  Day18-AppleWallet
//
//  Created by Beatriz Cardozo on 22/8/24.
//

import SwiftUI

struct WalletView: View {
    
    private static let cardOffset: CGFloat = 40.0
    private static let cardTimingOffset: CGFloat = 0.4
    @State private var isCardPresented = false
    
    var body: some View {
        VStack {
            TopBar()
            
            Spacer()
            
            ZStack {
                ForEach(cards) { card in
                    CardView(card: card)
                        .padding(.horizontal, 16)
                        .offset(self.offset(for: card))
                        .zIndex(self.zIndex(for: card))
                        .id(self.isCardPresented)
                        .transition(AnyTransition.slide.combined(with: .move(edge: .leading)).combined(with: .opacity))
                        .animation(self.transitionAnimation(for: card), value: isCardPresented)
                }
            }
            .onAppear{
                self.isCardPresented.toggle()
            }
            
            Spacer()
        }
        .padding()
    }
    
    //returns negative value of position
    private func zIndex(for card: Card) -> Double {
        guard let index = index(for: card) else {return 0}
        return -Double(index)
    }
    
    private func offset(for card: Card) -> CGSize {
        guard let index = index(for: card) else { return CGSize() }
        return CGSize(width: 0, height: -WalletView.cardOffset * CGFloat(index))
    }
    
    //search position of the card on array, return the index number
    private func index(for card: Card) -> Int? {
        guard let index = cards.firstIndex(where: {$0.id == card.id}) else {return nil}
        return index
    }
    
    private func transitionAnimation(for card: Card) -> Animation {
        var delay = 0.0
        if let index = index(for: card) {
            delay = Double(cards.count - index) * WalletView.cardTimingOffset
        }
        
        return Animation.spring(response: 0.1, dampingFraction: 0.8, blendDuration: 0.1).delay(delay)
    }
}



struct TopBar: View {
    var body: some View {
        HStack {
            Text("Wallet")
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            
            Spacer()
            
            Image(systemName: "plus.circle.fill")
                .font(.system(.title))
            
            
        }
        .padding(.horizontal, 24)
        .padding(.top, 24)
    }
}

#Preview {
    WalletView()
}
