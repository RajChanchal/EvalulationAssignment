//
//  EmployeeTableViewCell.swift
//  EmpDirectory
//
//  Created by Chanchal Raj on 18/02/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import UIKit

class EmployeeCell: UITableViewCell {

    private var lblName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium)
        lbl.numberOfLines = 0
        lbl.textColor = .black
        return lbl
    }()
    private var lblBirthYear: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        lbl.textColor = UIColor.darkGray
        return lbl
    }()
    
    private var lblSalary: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        lbl.textColor = UIColor.darkGray
        return lbl
    }()
    var viewModel:EmployeeTableViewCellViewModel?{
        didSet{
            lblName.text = viewModel?.name
            lblBirthYear.text = "Birth Year: " + (viewModel?.yearOfBirth ?? "")
            lblSalary.text = "Salary: " + (viewModel?.salary ?? "")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(lblName)
        addSubview(lblSalary)
        addSubview(lblBirthYear)
        
        lblName.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
    
        lblSalary.anchor(top: lblName.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        lblBirthYear.anchor(top: lblSalary.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
