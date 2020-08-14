//
//  ViewController.swift
//  Challenge03
//
//  Created by Helton Isac Torres Galindo on 11/08/20.
//  Copyright © 2020 Helton Isac Torres Galindo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlet
    
    @IBOutlet var letterA: UIButton!
    @IBOutlet var letterB: UIButton!
    @IBOutlet var letterC: UIButton!
    @IBOutlet var letterD: UIButton!
    @IBOutlet var letterE: UIButton!
    @IBOutlet var letterF: UIButton!
    @IBOutlet var letterG: UIButton!
    @IBOutlet var letterH: UIButton!
    @IBOutlet var letterI: UIButton!
    @IBOutlet var letterJ: UIButton!
    @IBOutlet var letterK: UIButton!
    @IBOutlet var letterL: UIButton!
    @IBOutlet var letterM: UIButton!
    @IBOutlet var letterN: UIButton!
    @IBOutlet var letterO: UIButton!
    @IBOutlet var letterP: UIButton!
    @IBOutlet var letterQ: UIButton!
    @IBOutlet var letterR: UIButton!
    @IBOutlet var letterS: UIButton!
    @IBOutlet var letterT: UIButton!
    @IBOutlet var letterU: UIButton!
    @IBOutlet var letterV: UIButton!
    @IBOutlet var letterW: UIButton!
    @IBOutlet var letterX: UIButton!
    @IBOutlet var letterY: UIButton!
    @IBOutlet var letterZ: UIButton!
    @IBOutlet var wordToGuess: UILabel!
    @IBOutlet var mistakesLabel: UILabel!
    
    // MARK: Variables
    
    var buttons: [UIButton] = []
    var word = ""
    var mistakes = 7 {
        didSet {
            DispatchQueue.main.async {
                [weak self] in
                self?.mistakesLabel.text = "Erros Restantes: \(self?.mistakes ?? 0)"
            }
        }
    }
    var guessedLetters: [String] = []
    var missingLetters = 0
    
    // MARK: ViewController Methods
    
    override func viewWillAppear(_ animated: Bool) {
        buttons = [letterA, letterB, letterC, letterD, letterE,
                   letterF, letterG, letterH, letterI, letterJ,
                   letterK, letterL, letterM, letterN, letterO,
                   letterP, letterQ, letterR, letterS, letterT,
                   letterU, letterV, letterW, letterX, letterY,
                   letterZ]
        initializeGame(action: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: @IBActions
    
    @IBAction func tappedLetter(_ sender: Any) {
        let button = sender as! UIButton
        
        if (mistakes > 0 && button.tintColor == UIColor.systemBlue) {
            if let tappedLetter = button.titleLabel?.text {
                let wordDiacritic = word.folding(options: .diacriticInsensitive, locale: .current).lowercased()
                if (wordDiacritic.contains(tappedLetter.lowercased())) {
                    button.tintColor = UIColor.systemGreen
                    
                    guessedLetters.append(tappedLetter.lowercased())
                    var newWord = " "
                    missingLetters = 0;
                    for (i ,letter) in word.enumerated() {
                        if (guessedLetters.contains(String(wordDiacritic[i...i]))) {
                            newWord += "\(letter) "
                        } else {
                            missingLetters += 1
                            newWord += "_ "
                        }
                        
                    }
                    wordToGuess.text = newWord
                } else {
                    button.tintColor = UIColor.systemRed
                    mistakes -= 1
                }
            }
            if (mistakes == 0) {
                showGameOverAndStartANewGame()
            } else if (missingLetters == 0) {
                showYouWinAndStartANewGame()
            }
        }
    }
    
    // MARK: Game Funcs
    func initializeGame(action: UIAlertAction!){

        DispatchQueue.global(qos: .userInitiated).async {
            [weak self] in
            if let wordsURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
                if let wordsContent = try? String(contentsOf: wordsURL) {
                    var lines = wordsContent.components(separatedBy: "\n")
                    lines.shuffle()
                    if let firstWord = lines.first {
                        self?.word = firstWord
                    }
                }
            }
            self?.mistakes = 7
            self?.guessedLetters = []
            DispatchQueue.main.async {
                [weak self] in
                if let buttons = self?.buttons {
                    for button in buttons {
                        button.tintColor = UIColor.systemBlue
                    }
                }
                if let word = self?.word {
                    self?.missingLetters = word.count
                    var wordToGuess = " "
                    for _ in word {
                        wordToGuess += "_ "
                    }
                    self?.wordToGuess.text = wordToGuess
                }
            }
        }
    }
    
    func showGameOverAndStartANewGame(){
        let ac = UIAlertController.init(title: "GAME OVER", message: "Fim de Jogo! Você perdeu! A palavra era: '\(word)'", preferredStyle: .alert)
        ac.addAction(UIAlertAction.init(title: "OK", style: .default, handler: initializeGame))
        present(ac, animated: true)
    }
    
    func showYouWinAndStartANewGame(){
        let ac = UIAlertController.init(title: "Parabéns!!!", message: "Você venceu e adivinhou a palavra: '\(word)'", preferredStyle: .alert)
        ac.addAction(UIAlertAction.init(title: "OK", style: .default, handler: initializeGame))
        present(ac, animated: true)
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}
