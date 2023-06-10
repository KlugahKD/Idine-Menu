//
//  MenuView.swift
//  Idine
//
//  Created by Macbook Pro on 28/12/2022.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    Label("Menu", systemImage: "list.dash")
                }
            OrderView()
                .tabItem{
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(Order())
    }
}
