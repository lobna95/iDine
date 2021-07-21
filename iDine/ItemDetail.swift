//
//  ItemDetail.swift
//  iDine
//
//  Created by Lobna Shaheen on 18/07/2021.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
            }
            Text(item.description)
                .padding()
            Button("Order This") {
                order.add(item: item)
            }
            .font(.headline)
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
//        .toolbar(content: {
//
//        })
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: MenuItem.example).environmentObject(Order())
    }
}
