//
//  HomeViewModel.swift
//  EmpDirectory
//
//  Created by Chanchal Raj on 17/02/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import Foundation
class HomeViewModel {
    //MARK:- Instance Variable
    private let employeeDirectory = EmployeeDirectory()
    private var employees:[Employee]?
    
    //MARK:- Completion Handler Type Alias
    typealias completionHandler = () -> Void
    private var completionHandlerClosure:completionHandler?
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(employeesDataDidUpdate), name: AppConstants.NotificationType.kEmployeeDirectoryDidUpdateNotification.notification, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    /**
     The method is called when employees data is updated by EmployeeDirectory class
     */
    @objc private func employeesDataDidUpdate(){
        employees = self.employeeDirectory.employees
        self.completionHandlerClosure?()
    }
}

extension HomeViewModel{
    /**
     The variable returns total number of employees
     */
    var totalEmployees:Int{
        return self.employees?.count ?? 0
    }
    
    /**
     Creates EmployeeTableViewCellModel by index parameter
     - Parameter index: The index of array to get employee from
     */
    func employeeCellModel(at index:Int) -> EmployeeTableViewCellViewModel? {
        guard let employee = employees?[index] else{return nil}
        
        return EmployeeTableViewCellViewModel.init(employee: employee)
        
    }
}
extension HomeViewModel{
    /**
     Updates employees records
     - Parameter completion: On completion the completion handler is called
     */
    func updateEmployeeRecords(completion:@escaping completionHandler){
        self.completionHandlerClosure = completion
        self.employeeDirectory.update()
    }
    /**
     Sorts the employees by 'name'
     - Parameter completion: On completion the completion handler is called
     */
    func sortByName(completion:@escaping completionHandler){
        DispatchQueue.global().async {[weak self] in
            guard let employees = self?.employees else{return}
            self?.employees = employees.sorted(by: {$0.name < $1.name})
            DispatchQueue.main.async {
                completion()
            }
            
        }
        
    }
}
