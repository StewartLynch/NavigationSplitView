//
// Created for NavigationSplitView
// by Stewart Lynch on 2022-07-22
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//
    

import Foundation

class DataStore: ObservableObject {
    @Published var companies: [Company] = []
    @Published var employees: [Employee] = []
    @Published var employeeFilter = ""
    
    var filteredEmployees: [Employee] {
        employeeFilter.isEmpty ? employees : employees.filter {$0.fullName.lowercased().contains(employeeFilter.lowercased())}
    }

    init() {
        loadData()
    }
    
    func loadData() {
        let json = Bundle.main.decode([CompanyJSON].self, from: "MOCK_DATA.json")
        for company in json {
            var newCompany = Company(id: company.id, name: company.name)
            for employee in company.employees {
                let newEmployee = Employee(id: employee.id,
                                           firstName: employee.firstName,
                                           lastName: employee.lastName,
                                           department: employee.department,
                                           slogan: employee.slogan,
                                           title: employee.title,
                                           company: newCompany)
                employees.append(newEmployee)
                newCompany.employees.append(newEmployee)
            }
            newCompany.employees = newCompany.employees.sorted(using: KeyPathComparator(\.lastName))
            companies.append(newCompany)
            
        }
        companies = companies.sorted(using: KeyPathComparator(\.name))
        employees = employees.sorted(using: KeyPathComparator(\.lastName))
    }
    
    func employee(id: String) -> Employee? {
        employees.first(where: {$0.id == id})
    }
    
    func company(id: String) -> Company? {
        companies.first(where: {$0.id == id})
    }
}
