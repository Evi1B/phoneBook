//
//  TableViewController.swift
//  PhoneBook
//
//  Created by EvilB on 01.02.2021.
//

import UIKit

class MainContactsContoller: UITableViewController {
    
    var usersStorage = [Users(name: "Ivan", surname: "Ivanov", phoneNumber: "+1234", city: "Kyiv"),
                        Users(name: "Sergey", surname: "", phoneNumber: "1234", city: "Kyiv"),
                        Users(name: "Bogdan", surname: "Akopov", phoneNumber: "1234", city: "Kyiv")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        title = "Contacts"
    }
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        guard segue.identifier == "saveSegue" else { return }
        let sourceVC = segue.source as! DetailContact
        let users = sourceVC.newContact
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            usersStorage[selectedIndexPath.row] = users
            tableView.reloadRows(at: [selectedIndexPath], with: .fade)
        } else {
            let newIndexPath = IndexPath(row: usersStorage.count, section: 0)
            usersStorage.append(users)
            tableView.insertRows(at: [newIndexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "editContact" else { return }
        let indexPath = tableView.indexPathForSelectedRow!
        let contact = usersStorage[indexPath.row]
        let navigationVC = segue.destination as! UINavigationController
        let newContactVC = navigationVC.topViewController as! DetailContact
        
        newContactVC.newContact = contact
        newContactVC.title = "Edit Contact"
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersStorage.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactCell
        
        let model = usersStorage[indexPath.row]
        cell.set(object: model)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            usersStorage.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedContact = usersStorage.remove(at: sourceIndexPath.row)
        usersStorage.insert(movedContact, at: destinationIndexPath.row)
        tableView.reloadData()
    }
}
