//
// Created for NavigationSplitView
// by Stewart Lynch on 2022-07-22
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//
    

import SwiftUI

@main
struct AppEntry: App {
    @StateObject var store = DataStore()
    var body: some Scene {
        WindowGroup {
            StartTabView()
                .environmentObject(store)
        }
    }
}
