//
//  DateilTableViewController.swift
//  PhoneBook
//
//  Created by EvilB on 01.02.2021.
//

import UIKit

class DetailContact: UITableViewController {
    var newContact = Users(name: "", surname: "", phoneNumber: "", city: "")
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var surnameTF: UITextField!
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else { return }
        
        let name = nameTF.text ?? ""
        let surname = surnameTF.text ?? ""
        let phoneNumber = phoneNumberTF.text ?? ""
        let city = cityTF.text ?? ""
        
        self.newContact = Users(name: name, surname: surname, phoneNumber: phoneNumber, city: city)
    }
}
