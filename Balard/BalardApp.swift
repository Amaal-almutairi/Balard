//
//  BalardApp.swift
//  Balard
//
//  Created by Amaal Almutairi on 13/06/1444 AH.
//

import SwiftUI

@main
struct BalardApp: App {
    @StateObject var goalCardVM = GoalCardViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, goalCardVM.container.viewContext)

            
        }
    }
}
