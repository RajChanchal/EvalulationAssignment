//
//  EmployeeDirectory.swift
//  EmpDirectory
//
//  Created by Chanchal Raj on 17/02/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import Foundation
class EmployeeDirectory{
    var employees:[Employee]?
    private(set) var isUpdating = false
    
    func update() {
        if isUpdating{
            return
        }
        isUpdating = true
        DispatchQueue.main.async{[weak self] in
            self?.BA_doUpdateInBackground()
        }
        
    }
    private func BA_doUpdateInBackground(){
        Thread.sleep(forTimeInterval: 2)
        let names = ["Anne", "Lucas", "Marc", "Zeus", "Hermes", "Bart", "Paul", "John",
                      "Ringo", "Dave", "Taylor"]
        let surnames = ["Hawkins", "Simpson", "Lennon", "Grohl", "Hawkins", "Jacobs",
                         "Holmes", "Mercury", "Matthews"]
        
        let amount = names.count * surnames.count
        var newEmployees = [Employee]()
        for _ in 0...amount{
            let fullName = names[Int.random(in: 0..<names.count)] + " " + surnames[Int.random(in: 0..<surnames.count)]
            let birthYear = 1997 - UInt.random(in: 0..<50)
            let newEmployee = Employee.init(name: fullName, birthYear: birthYear)
            newEmployees.append(newEmployee)
        }
        DispatchQueue.main.async {[weak self] in
            self?.BA_updateDidFinishWithResults(results: newEmployees)
        }
    }
    private func BA_updateDidFinishWithResults(results:[Employee]){
        self.employees = results
        self.isUpdating = false
        NotificationCenter.default.post(name: AppConstants.NotificationType.kEmployeeDirectoryDidUpdateNotification.notification, object: self)
    }
}
