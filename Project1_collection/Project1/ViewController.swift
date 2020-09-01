//
//  ViewController.swift
//  Project1
//
//  Created by Helton Isac Torres Galindo on 05/07/20.
//  Copyright © 2020 Helton Isac Torres Galindo. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    var pictures = [String]()
    
    @objc func loadPictures() {
        let fm: FileManager = FileManager.default
        let path: String = Bundle.main.resourcePath!
        let items: [String] = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items.sorted() {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        collectionView.performSelector(onMainThread: #selector(UICollectionView.reloadData), with: nil, waitUntilDone: false);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white];
        
        performSelector(inBackground: #selector(loadPictures), with: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Storm", for: indexPath) as? StormCell else {
            fatalError("Not possible render the storm.")
        }
        
        cell.stormImage.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.stormImage.layer.borderWidth = 2
        cell.stormImage.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7
        
        cell.stormName.text = pictures[indexPath.item]
        cell.stormImage.image = UIImage(named: pictures[indexPath.item])
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.item]
            vc.title = "Picture \(indexPath.item + 1) of \(pictures.count)"
            navigationController?.pushViewController(vc, animated:  true)
        }
    }
}
