//
//  homeScreenViewController.swift
//  Maths Equation
//
//  Created by Jaydip on 22/03/22.
//

import UIKit

class homeScreenViewController: UIViewController {

    @IBOutlet var rightAnswerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        RightAnswerAnimation()
        self.navigationController?.isNavigationBarHidden = true

    }
    func RightAnswerAnimation(){
        rightAnswerLabel.text = ""

        var charIndex = 0.0
        let nameText = "Right Answer"

        for letter in nameText{
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.rightAnswerLabel.text?.append(letter)
            }
            charIndex += 1
       }
    }
  
    @IBAction func playButton(_ sender: Any) {
        showAlert()
    }
    @IBAction func quitButton(_ sender: Any) {
        quitApp()
    }
    func quitApp(){
        DispatchQueue.main.asyncAfter(deadline:.now()){
            UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
        }
    }
    func showAlert(){
        let alert : UIAlertController = UIAlertController(title: "RULES", message: "\n1.There will be One Math Equation\n\n2.if Equation is 'Right',Press 'TRUE'\notherwise 'FALSE' ", preferredStyle: .alert)
        
        let playButton : UIAlertAction = UIAlertAction(title: "PLAY NOW", style: .default){_ in
            self.playNowButtonToSelectLevel()
        }
        
        alert.addAction(playButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func playNowButtonToSelectLevel(){
        
        let selectLevel = self.storyboard?.instantiateViewController(withIdentifier: "selectLevelViewController") as! selectLevelViewController
        
        navigationController?.pushViewController(selectLevel, animated: true)
        
    }
}
