//
//  MainView.swift
//  iDine
//
//  Created by Lobna Shaheen on 18/07/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
            FavoriteView()
                .tabItem {
                    Label("Favorite", systemImage: "star")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Order())
    }
}
