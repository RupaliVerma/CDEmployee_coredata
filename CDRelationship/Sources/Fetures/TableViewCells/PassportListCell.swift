//
//  PassportListCell.swift
//  CDRelationship
//
//  Created by RUPALI VERMA on 04/07/24.
//

import UIKit

class PassportListCell: UITableViewCell {
    @IBOutlet weak var lblPassportID: UILabel!
    
    @IBOutlet weak var lblEmployeeName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
