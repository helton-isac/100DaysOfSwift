//
//  ViewController.swift
//  Challenge02
//
//  Created by Helton Isac Torres Galindo on 21/07/20.
//  Copyright © 2020 Helton Isac Torres Galindo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var shoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(clearList))
        
    }
    
    @objc func addItem() {
        let ac = UIAlertController(title: "Inserir um item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let insertAction = UIAlertAction(title: "Inserir", style: .default) {
            [weak self, weak ac] _ in
            guard let item = ac?.textFields?[0].text else { return }
            self?.insertItem(item)
        }
        ac.addAction(insertAction)
        present(ac, animated: true)
    }
    
    func insertItem(_ item: String){
        shoppingList.insert(item, at: shoppingList.count)
        let indexPath = IndexPath(row: shoppingList.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }

    @objc func clearList() {
        shoppingList = []
        self.tableView.reloadData()
    }

}

