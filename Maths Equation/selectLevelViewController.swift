//
//  selectLevelViewController.swift
//  Maths Equation
//
//  Created by Jaydip on 22/03/22.
//

import UIKit

class selectLevelViewController: UIViewController {

    @IBOutlet var selectModeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        selectModeAnimation()

    }
    func selectModeAnimation(){
        selectModeLabel.text = ""

        var charIndex = 0.0
        let nameText = "Select Mode"

        for letter in nameText{
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.selectModeLabel.text?.append(letter)
            }
            charIndex += 1
        }
       }
    @IBAction func easyButton(_ sender: Any) {
        let easy = self.storyboard?.instantiateViewController(withIdentifier: "easyModeViewController") as!
        easyModeViewController
        navigationController?.pushViewController(easy, animated: true)
    }
    @IBAction func mediumButton(_ sender: Any) {
        let medium = self.storyboard?.instantiateViewController(withIdentifier: "mediumModeViewController") as! mediumModeViewController
        navigationController?.pushViewController(medium, animated: true)
    }
    @IBAction func hardButton(_ sender: Any) {
        let hard = self.storyboard?.instantiateViewController(withIdentifier: "hardModeViewController") as! hardModeViewController
        navigationController?.pushViewController(hard, animated: true)
    }
    @IBAction func homeButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
