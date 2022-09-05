//
// Created for NavigationSplitView
// by Stewart Lynch on 2022-06-15
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import Foundation

    struct CompanyJSON: Codable, Identifiable {
        var name: String
        let id: String
        var employees: [Employee]
        
        struct Employee: Codable, Identifiable, Hashable {
            let id: String
            var firstName: String
            var lastName: String
            var title: String
            var department: String
            var slogan: String
            
            var fullName: String {
                firstName + " " + lastName
            }
        }
    }
    
