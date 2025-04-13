//
//  EmployeeLIstVC.swift
//  CDRelationship
//
//  Created by RUPALI VERMA on 04/07/24.
//

import UIKit

class EmployeeLIstVC: UIViewController {
    var employees : [Employee]? = nil
   private var manager = EmployeeManager()
    @IBOutlet weak var EmployeeListTbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Employees List"
    }
    override func viewWillAppear(_ animated: Bool) {
        self.employees = manager.getAllEmployees()
        if(employees != nil && employees?.count != 0)
        {
            self.EmployeeListTbl.reloadData()
        }
    }

}
