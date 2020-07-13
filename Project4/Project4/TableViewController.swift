//
//  TableTableViewController.swift
//  Project4
//
//  Created by Helton Isac Torres Galindo on 13/07/20.
//  Copyright © 2020 Helton Isac Torres Galindo. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var websites = ["apple.com",
                    "hackingwithswift.com",
                    "mail.google.com",
                    "github.com/helton-isac",
                    "linkedin.com",
                    "fiap.com.br/",
                    "google.com",
                    "alura.com.br",
                    "caster.io/courses",
                    "youtube.com",
                    "hackerrank.com",
                    "facebook.com",
                    "leetcode.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return websites.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "link", for: indexPath)
        
        cell.textLabel?.text = websites[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WebView") as? ViewController {
            vc.selectedWebSite = websites[indexPath.row]
            navigationController?.pushViewController(vc, animated:  true)
        }
    }
    
    
}
