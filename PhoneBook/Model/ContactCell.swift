//
//  ContactCell.swift
//  PhoneBook
//
//  Created by EvilB on 08.02.2021.
//

import UIKit

class ContactCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(object: Users){
        self.textLabel?.text = "\(object.name) "
        self.detailTextLabel?.text = "\(object.surname)"
    }
}
