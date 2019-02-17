//
//  EmployeeTableViewCellViewModel.swift
//  EmpDirectory
//
//  Created by Chanchal Raj on 17/02/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import Foundation
struct EmployeeTableViewCellViewModel {
    private var employee:Employee?
    private init(){}
    init(employee:Employee) {
        self.employee = employee
    }
}
extension EmployeeTableViewCellViewModel{
    var name:String?{
        return employee?.name
    }
    var yearOfBirth:String?{
        guard let birthYear = employee?.birthYear else{
            return nil
        }
        return "\(birthYear)"
    }
    var salary:String?{
        return employee?.formattedSalary()
    }
}
