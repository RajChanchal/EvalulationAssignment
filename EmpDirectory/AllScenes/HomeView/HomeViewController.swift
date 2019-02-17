//
//  ViewController.swift
//  EmpDirectory
//
//  Created by Chanchal Raj on 17/02/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK:- Outlets
    @IBOutlet weak var tblViewEmployee: UITableView!
    
    //MARK:- Instance Properties
    var viewModel = HomeViewModel()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    
    private func fetchData(){
        viewModel.updateEmployeeRecords {[weak self] in
            self?.tblViewEmployee.reloadData()
        }
    }
    @IBAction func btnSortTapped(_ sender: Any) {
        viewModel.sortByName {[weak self] in
            self?.tblViewEmployee.reloadData()
        }
    }
}
//MARK:- TableView Data Source
extension HomeViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.totalEmployees
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell") as! EmployeeTableViewCell
        cell.viewModel = viewModel.employeeCellModel(at: indexPath.row)
        return cell
    }
    
    
}
