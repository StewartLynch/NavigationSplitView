//
// Created for NavigationSplitView
// by Stewart Lynch on 2022-08-09
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct StartTabView: View {
    @EnvironmentObject var store: DataStore
    var body: some View {
        TabView {
            EmployeeListView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Employees")
                }
            CompaniesListView()
                .tabItem {
                    Image(systemName: "briefcase")
                    Text("Companies")
                }
        }
    }
}

struct StartTabView_Previews: PreviewProvider {
    static var previews: some View {
        StartTabView()
            .environmentObject(DataStore())
    }
}
