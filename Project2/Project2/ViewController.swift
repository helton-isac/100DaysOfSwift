//
//  ViewController.swift
//  Project2
//
//  Created by Helton Isac Torres Galindo on 08/07/20.
//  Copyright © 2020 Helton Isac Torres Galindo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var countryToGuess: UILabel!
    @IBOutlet var correctFlagsLabel: UILabel!
    @IBOutlet var wrongFlagsLabel: UILabel!
    @IBOutlet var correctFlagsTotal: UILabel!
    @IBOutlet var wrongFlagsTotal: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var correctFlagsTotalValue = 0;
    var wrongFlagsTotalValue = 0;
    var totalAttempts = 10;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia","france","germany","ireland",
                      "italy","monaco","nigeria","poland",
                      "russia","spain","uk","us"]
        
        title = "Guess the Flag"
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        countryToGuess.text = countries[correctAnswer].uppercased()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            correctFlagsTotalValue += 1
            correctFlagsTotal.text = "\(correctFlagsTotalValue)"
            score += 1
            title = "Correct"
        } else {
            wrongFlagsTotalValue += 1
            wrongFlagsTotal.text = "\(wrongFlagsTotalValue)"
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)

        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))

        present(ac, animated: true)
        
    }
    
}

