//
//  CreateEmployeeVC.swift
//  CDRelationship
//
//  Created by RUPALI VERMA on 04/07/24.
//

import UIKit

class CreateEmployeeVC: UIViewController, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var nameTxtFld: UITextField!
    @IBOutlet weak var placeOfIssueTxtFld: UITextField!
    @IBOutlet weak var passportNumberTxtFld: UITextField!
    @IBOutlet weak var emailTxtFld: UITextField!
    private let manager = EmployeeManager()
  
    private var placeOfIssuePicker: UIPickerView!
    let places = ["Bangalore", "Delhi","Indore", "Jaipur","Mumbai", "Pune"]
    override func viewDidLoad() {
        super.viewDidLoad()
       viewWillSetup()
        let documentDirectoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint(documentDirectoryPath[0])
    }
    
    @IBAction func saveBtnClicked(_ sender: Any) {
        
        let passport = Passport(id: UUID(), passportId: self.passportNumberTxtFld.text, placeOfIssue: self.placeOfIssueTxtFld.text, name: self.nameTxtFld.text)
        
        let employee = Employee(id: UUID(), name: self.nameTxtFld.text, email: self.emailTxtFld.text, profilePicture: (self.imgProfilePic.image?.pngData())!, passport: passport)
        manager.create(employee: employee)
        displayAlert(alertMessage: "Record Saved")
    }
    
    @IBAction func clearAllBtnClicked(_ sender: Any) {
        self.placeOfIssueTxtFld.text = ""
        self.emailTxtFld.text = ""
        self.nameTxtFld.text = ""
    }
    
    @IBAction func clickedOnImage(){
      let picker = UIImagePickerController()
        picker.sourceType = .savedPhotosAlbum
        picker.delegate = self
        present(picker, animated: true)
        
    }
    func viewWillSetup(){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action:#selector(self.dismissPicker))
        let spaceBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action:nil)
        toolBar.setItems([doneBtn,spaceBtn], animated: true)
        
        placeOfIssuePicker = UIPickerView()
        placeOfIssuePicker.delegate = self
        placeOfIssuePicker.dataSource = self
    }
    
   @objc func dismissPicker(){
       self.view.endEditing(true)
    }
    
    private func displayAlert(alertMessage: String)
    {
        let alert = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
        
    }
}
