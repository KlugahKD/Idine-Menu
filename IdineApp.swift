//
//  IdineApp.swift
//  Idine
//
//  Created by Macbook Pro on 22/12/2022.
//

import SwiftUI

@main
struct IdineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MenuView()
                .environmentObject(order)
        }
    }
}
