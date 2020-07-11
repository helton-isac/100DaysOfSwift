//
//  ViewController.swift
//  Challenge01
//
//  Created by Helton Isac Torres Galindo on 11/07/20.
//  Copyright © 2020 Helton Isac Torres Galindo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var flags = [Flag]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flags Challenge"
        navigationController?.navigationBar.prefersLargeTitles = true
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(recommendTapped))
        
        let fm: FileManager = FileManager.default
        let path: String = Bundle.main.resourcePath!
        let items: [String] = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items.sorted() {
            if item.hasSuffix(".png") {
                let code = item.replacingOccurrences(of: ".png", with: "")
                let flag = Flag(code: code, name: getFlagNameFrom(code: code), imageName: item)
                flags.append(flag)
            }
        }
        
        print(flags)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlagItem", for: indexPath)
        let flag = flags[indexPath.row]
        cell.textLabel?.text = flag.name
        cell.imageView?.image = UIImage(named: flag.imageName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.flag = flags[indexPath.row]
            navigationController?.pushViewController(vc, animated:  true)
        }
    }

}

