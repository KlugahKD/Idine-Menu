//
//  ContentView.swift
//  Idine
//
//  Created by Macbook Pro on 22/12/2022.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
            
            NavigationView{
                List{
                    ForEach(menu){section in
                        Section(header: Text(section.name)) {
                            
                            ForEach(section.items){item in
                                NavigationLink(destination:
                                                ItemDetail(item:
                                                            item)){
                                    itemRow(item: item)
                                }
                            }
                        } 
                    }
                }.navigationBarTitle("Menu")
                    .listStyle(GroupedListStyle())
            }
        }
    }
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
