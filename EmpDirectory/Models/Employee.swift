//
//  Employee.swift
//  EmpDirectory
//
//  Created by Chanchal Raj on 17/02/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import Foundation
struct Employee {
    var name:String!
    var birthYear:UInt!
    var salary:Double!
    private init(){}
    
    init(name:String,birthYear:UInt) {
        self.name = name
        self.birthYear = birthYear
        self.salary = 1000
    }
    func formattedSalary() -> String? {
        let numberForammter = NumberFormatter()
        numberForammter.locale = Locale.current
        numberForammter.numberStyle = .currency
        if let formattedSalary = numberForammter.string(from: NSNumber.init(value: self.salary)){
            return formattedSalary
        }
        return nil
    }
}
