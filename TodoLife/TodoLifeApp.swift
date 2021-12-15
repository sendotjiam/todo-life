//
//  TodoLifeApp.swift
//  TodoLife
//
//  Created by Sendo Tjiam on 25/08/21.
//

import SwiftUI

@main
struct TodoLifeApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView() {
                ListView()
            }.navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
