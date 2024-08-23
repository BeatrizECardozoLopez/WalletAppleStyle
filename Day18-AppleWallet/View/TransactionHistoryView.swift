//
//  TransactionHistoryView.swift
//  Day18-AppleWallet
//
//  Created by Beatriz Cardozo on 23/8/24.
//

import SwiftUI

struct TransactionHistoryView: View {
    
    var currentTransactions: [Transaction]
    
    var body: some View {
        VStack{
            Text("Transactions History")
                .font(.system(size: 22, design: .rounded))
                .fontWeight(.black)
                .foregroundStyle(.purple)
                .padding()
            
            
            ScrollView (.horizontal, showsIndicators: false){
                HStack (spacing: 24){
                    ForEach(self.currentTransactions) {
                        transaction in
                        TransactionView(transaction: transaction)
                    }
                }
                .padding()
            }
        }
    }
}

struct TransactionView: View {
    
    var transaction: Transaction
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .foregroundStyle(.purple)
            .overlay (
                VStack {
                    
                    Spacer()
                    
                    Image(systemName: transaction.icon)
                        .font(.system(size: 40))
                        .imageScale(.small)
                    Text(transaction.merchant)
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                    
                    Text("\(String(format:"%.2f", transaction.amount)) $")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .padding(8)
                    
                    Text(transaction.date)
                        .font(.system(.caption, design: .rounded))
                    
                    Spacer()
                }
                    .foregroundStyle(.white)
            )
            .frame(width: 200, height: 200)
    }
}

#Preview ("Transactions History"){
    TransactionHistoryView(currentTransactions: transactions)
}
