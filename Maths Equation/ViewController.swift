//
//  ViewController.swift
//  Maths Equation
//
//  Created by Jaydip on 22/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mathsEquationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mathsEquationAnimation()
        setTime()
    }
    func mathsEquationAnimation(){
        mathsEquationLabel.text = ""

        var charIndex = 0.0
        let nameText = "Maths  Equation"

        for letter in nameText{
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.mathsEquationLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
    
    @IBOutlet var timeProgress: UIProgressView!
    var count: Float = 1
    var timer: Timer = Timer()
    
    func setTime() {
        count = 5
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if count>10{
            timer.invalidate()
            
            navigationToHomeScreen()
        }else{
            count = count + 10
            timeProgress.progress = Float(count/10)
        }
    }
    func navigationToHomeScreen () {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "homeScreenViewController") as! homeScreenViewController
        
        navigationController?.pushViewController(home, animated: true)
        
    }
}

