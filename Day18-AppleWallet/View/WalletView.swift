//
//  ContentView.swift
//  Day18-AppleWallet
//
//  Created by Beatriz Cardozo on 22/8/24.
//

import SwiftUI

struct WalletView: View {
    
    @State var cards: [Card] = cardsData
    
    //MARK: Card Presentation at start
    private static let cardOffset: CGFloat = 40.0
    private static let cardTimingOffset: CGFloat = 0.4
    @State private var isCardPresented = false
    
    //MARK: Card selection to show history transaction
    @State private var isCardPressed = false
    @State private var selectedCard: Card?
    
    //MARK: Change cards order
    @GestureState private var dragState = DragState.inactive
    
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
                        .gesture(
                            TapGesture()
                                .onEnded({_ in
                                    withAnimation(.easeOut(duration: 0.5).delay(0.1)){
                                        self.isCardPressed.toggle()
                                        self.selectedCard = self.isCardPressed ? card : nil
                                    }
                                })
                                .exclusively(before: LongPressGesture(minimumDuration: 0.1)
                                    .sequenced(before: DragGesture())
                                    .updating(self.$dragState, body:{ value, state, transaction in
                                        switch value {
                                        case .first(true):
                                            state = .pressing(index: self.index(for: card))
                                        case .second(true, let drag):
                                            state = .dragging(index: self.index(for: card), translation: drag?.translation ?? .zero)
                                        default:
                                            break
                                        }
                                    })
                                    .onEnded({ value in
                                            guard case .second(true, let drag?) = value else { return }
                                            
                                        withAnimation{
                                            self.reorderCards(with: card, offset: drag.translation)
                                        }
                                })
                            )
                    )
                }
            }
            .onAppear{
                self.isCardPresented.toggle()
            }
            
            Spacer()
            
            
            if isCardPressed {
                TransactionHistoryView(currentTransactions: transactions)
                    .padding(16)
                    .transition(.move(edge: .bottom))
            }
        }
        .padding()
    }
    
    //returns negative value of position
    private func zIndex(for card: Card) -> Double {
        guard let index = self.index(for: card) else {return 0}
        
        //Is important to recalculate for teh card movement
        //For default, zIndex is the oposite to the position the cardb has in the array
        let defaultIndex = -Double(index)
        
        //But if we are moving the card:
        if let dragIndex = self.dragState.index, index == dragIndex {
            return defaultIndex + Double(self.dragState.translation.height/WalletView.cardOffset)
        }
        
        //If we get here we return default value
        
        return -Double(index)
    }
    
    private func offset(for card: Card) -> CGSize {
        guard let index = self.index(for: card) else { return CGSize() }
        
        //Pressed card to see transition history
        if self.isCardPressed {
            guard let selectedCard = self.selectedCard,
                  let selectedIndex = self.index(for: selectedCard) else { return CGSize() }
            if index >= selectedIndex {
                return CGSize()
            }
            let offset = CGSize(width: 0, height: 1000)
            return offset
        }
        
        //Dragging a card to reorganize them
        var pressedOffset = CGSize.zero
        var dragOffsetY: CGFloat = 0.0
        
        if let dragIndex = self.dragState.index, index == dragIndex {
            pressedOffset.height = self.dragState.isPressing ? -25 : 0
            switch self.dragState.translation.width {
            case let width where width < -10:
                pressedOffset.width = -25
                
            case let width where width > 10:
                pressedOffset.width = 25
                
            default:
                break
            }
            dragOffsetY = self.dragState.translation.height
        }
        return CGSize(width: 0 + pressedOffset.width, height: -WalletView.cardOffset * CGFloat(index) + pressedOffset.height + dragOffsetY)
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
    
    private func reorderCards(with card: Card, offset: CGSize) {
        guard let draggedCardIndex = index(for: card) else { return }
        
        var newCardIndex = draggedCardIndex + Int(-offset.height/WalletView.cardOffset)
        newCardIndex = (newCardIndex >= cards.count) ? cards.count-1 : newCardIndex
        newCardIndex = (newCardIndex <= 0) ? 0 : newCardIndex
        
        let removeCard = cards.remove(at: draggedCardIndex)
        cards.insert(removeCard, at: newCardIndex)
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
