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
    var visualizations = [String:Int]()
    
    @objc func loadPictures() {
        let fm: FileManager = FileManager.default
        let path: String = Bundle.main.resourcePath!
        let items: [String] = try! fm.contentsOfDirectory(atPath: path)
        
        let defaults = UserDefaults.standard
        visualizations = defaults.object(forKey: "VisualizationsDictionary") as? [String:Int] ?? [String:Int]()
        
        for item in items.sorted() {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        print(pictures)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        performSelector(inBackground: #selector(loadPictures), with: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        if let visualizationCount = visualizations[pictures[indexPath.row]] {
            cell.detailTextLabel?.text = String(visualizationCount)
        } else {
            cell.detailTextLabel?.text = "0"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            if let currentCount = visualizations[pictures[indexPath.row]] {
                visualizations[pictures[indexPath.row]] = currentCount + 1
            } else {
                visualizations[pictures[indexPath.row]] = 1
            }
            let defaults = UserDefaults.standard
            defaults.set(visualizations, forKey: "VisualizationsDictionary")
            tableView.reloadData()
            vc.title = "Picture \(indexPath.row + 1) of \(pictures.count)"
            navigationController?.pushViewController(vc, animated:  true)
        }
    }
}
