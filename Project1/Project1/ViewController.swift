//
//  ViewController.swift
//  Project1
//
//  Created by Helton Isac Torres Galindo on 05/07/20.
//  Copyright © 2020 Helton Isac Torres Galindo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm: FileManager = FileManager.default
        let path: String = Bundle.main.resourcePath!
        let items: [String] = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        print(pictures)
    }


}

