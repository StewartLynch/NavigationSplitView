//
// Created for NavigationSplitView
// by Stewart Lynch on 2022-08-09
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct EmployeeListView: View {
    @EnvironmentObject var store: DataStore
    @State private var employeeId: Employee.ID?
    var body: some View {
        NavigationSplitView(columnVisibility: .constant(.doubleColumn)) {
            List(store.filteredEmployees, selection: $employeeId) { employee in
                Text(employee.fullName)
                    .font(.title)
            }
            .searchable(text: $store.employeeFilter)
            .navigationTitle("Employees")
        } detail: {
            EmployeeView(employeeId: employeeId)
        }
        .navigationSplitViewStyle(.balanced)
    }
}

struct EmployeeListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView()
            .environmentObject(DataStore())
    }
}
