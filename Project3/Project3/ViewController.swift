//
//  ViewController.swift
//  Project1
//
//  Created by Helton Isac Torres Galindo on 05/07/20.
//  Copyright © 2020 Helton Isac Torres Galindo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(recommendTapped))
        
        let fm: FileManager = FileManager.default
        let path: String = Bundle.main.resourcePath!
        let items: [String] = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items.sorted() {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.title = "Picture \(indexPath.row + 1) of \(pictures.count)"
            navigationController?.pushViewController(vc, animated:  true)
        }
    }
    
    @objc func recommendTapped(){
        let message = "Try this app for awesome pictures"
        let url = URL(string:"https://github.com/helton-isac/100DaysOfSwift/")!
        let vc = UIActivityViewController(activityItems: [message,url], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc,animated: true)
    }
}
