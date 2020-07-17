//
//  ViewController.swift
//  Project6a
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
    @IBOutlet var continueButton: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var correctFlagsTotalValue = 0;
    var wrongFlagsTotalValue = 0;
    var totalAttempts = 9;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia","france","germany","ireland",
                      "italy","monaco","nigeria","poland",
                      "russia","spain","uk","us"]
        
        title = "Guess the Flag"
        
        initializeGame()
        askQuestion()
    }
    
    
    fileprivate func resetScreenState() {
        continueButton.isHidden = true;
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func askQuestion() {
        resetScreenState()
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        countryToGuess.text = countries[correctAnswer].uppercased()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if continueButton.isHidden {
            if sender.tag == correctAnswer {
                correctFlagsTotalValue += 1
                correctFlagsTotal.text = "\(correctFlagsTotalValue)"
            } else {
                wrongFlagsTotalValue += 1
                wrongFlagsTotal.text = "\(wrongFlagsTotalValue)"
                sender.layer.borderWidth = 3
                sender.layer.borderColor = UIColor.red.cgColor
            }
            
            switch correctAnswer {
            case 0:
                button1.layer.borderWidth = 3
                button1.layer.borderColor = UIColor.green.cgColor
            case 1:
                button2.layer.borderWidth = 3
                button2.layer.borderColor = UIColor.green.cgColor
            case 2:
                button3.layer.borderWidth = 3
                button3.layer.borderColor = UIColor.green.cgColor
            default:
                break
            }
            
            continueButton.isHidden = false;
        }
    }
    
    fileprivate func initializeGame() {
        correctFlagsTotalValue = 0;
        wrongFlagsTotalValue = 0;
        totalAttempts = 9;
        correctFlagsTotal.text = "\(correctFlagsTotalValue)"
        wrongFlagsTotal.text = "\(wrongFlagsTotalValue)"
    }
    
    func playAgain(action: UIAlertAction!){
        initializeGame()
        askQuestion()
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        if totalAttempts == 0 {
            let ac = UIAlertController(title: "Game Over!", message: "You guessed \(correctFlagsTotalValue) of 10 flags", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Play Again", style: .default, handler: playAgain))
            
            present(ac, animated: true)
        } else {
            totalAttempts -= 1
            askQuestion()
        }
        
    }
    
    
}

