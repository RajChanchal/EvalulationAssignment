//
//  EmployeesViewController.swift
//  EmpDirectory
//
//  Created by Chanchal Raj on 18/02/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import UIKit

class EmployeesViewController: UIViewController {
    
    private var tblViewEmployee: UITableView!
    //MARK:- Instance Properties
    var viewModel = HomeViewModel()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeUIComponents()
        fetchData()
    }
   
    
    //MARK:- Action Methods
    @objc func btnSortTapped(_ sender: Any) {
        viewModel.sortByName {[weak self] in
            self?.tblViewEmployee.reloadData()
        }
    }
    //MARK:- Helper Methods
    private func fetchData(){
        viewModel.updateEmployeeRecords {[weak self] in
            self?.tblViewEmployee.reloadData()
        }
    }
}
//MARK:- TableView Data Source
extension EmployeesViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.totalEmployees
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell") as! EmployeeCell
        cell.viewModel = viewModel.employeeCellModel(at: indexPath.row)
        return cell
    }
    
}

//MARK:- Initialize UI
extension EmployeesViewController{
    private func initializeUIComponents(){
        addTableView()
        addSortingButton()
    }
    private func addTableView() {
        tblViewEmployee = UITableView.init(frame: view.frame, style: .plain)
        tblViewEmployee.register(EmployeeCell.self, forCellReuseIdentifier: "employeeCell")
        tblViewEmployee.dataSource = self
        view.addSubview(tblViewEmployee)
    }
    private func addSortingButton(){
        let btnSort = UIBarButtonItem.init(title: "Sort", style: .done, target: self, action: #selector(btnSortTapped(_:)))
        self.navigationItem.rightBarButtonItem = btnSort
    }
}
