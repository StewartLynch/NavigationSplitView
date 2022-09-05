//
// Created for NavigationSplitView
// by Stewart Lynch on 2022-09-04
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct EmployeeView: View {
    @EnvironmentObject var store: DataStore
    var employeeId: Employee.ID?
    var body: some View {
        if let employeeId {
            if let employee = store.employee(id: employeeId) {
                VStack {
                    Text(employee.company.name)
                        .font(.largeTitle)
                    Text(employee.fullName)
                        .font(.title)
                    Text("\"" + employee.slogan + "\"")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .italic()
                        .padding()
                    Grid {
                        GridRow(alignment: .top) {
                            Text("Department:").bold()
                                .gridColumnAlignment(.trailing)
                            Text(employee.department)
                                .gridColumnAlignment(.leading)
                        }
                        GridRow(alignment: .top) {
                            Text("Title").bold()
                            Text(employee.title)
                        }
                    }
                    .padding()
                    .border(.primary)
                    .font(.title3)
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
        } else {
            VStack {
                Image("employee")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                Text("Select employee")
                    .font(.title)
            }
        }
    }
}

struct EmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeView(employeeId: "92c08f4a-d5bf-49e4-809f-7aefaa155c16")
            .environmentObject(DataStore())
    }
}
