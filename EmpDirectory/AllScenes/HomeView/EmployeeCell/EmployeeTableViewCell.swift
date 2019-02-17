//
//  EmployeeTableViewCell.swift
//  EmpDirectory
//
//  Created by Chanchal Raj on 17/02/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBirthYear: UILabel!
    @IBOutlet weak var lblSalary: UILabel!
    
    var viewModel:EmployeeTableViewCellViewModel?{
        didSet{
            lblName.text = viewModel?.name
            lblBirthYear.text = viewModel?.yearOfBirth
            lblSalary.text = viewModel?.salary
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
