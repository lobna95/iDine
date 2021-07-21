//
//  iDineApp.swift
//  iDine
//
//  Created by Lobna Shaheen on 18/07/2021.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
