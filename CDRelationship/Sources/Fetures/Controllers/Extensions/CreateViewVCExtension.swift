//
//  CreateViewVCExtension.swift
//  CDRelationship
//
//  Created by RUPALI VERMA on 06/07/24.
//

import Foundation
import UIKit


extension CreateEmployeeVC: UIPickerViewDelegate, UIPickerViewDataSource,UIImagePickerControllerDelegate{
    
    // MARK: Picker view datasource and delegate methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.places.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  self.places[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.placeOfIssueTxtFld.text = self.places[row]
    }

    // MARK: Image picker delegate method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let img = info[.originalImage] as? UIImage
        self.imgProfilePic.image = img
        dismiss(animated: true, completion: nil)
    }
}
