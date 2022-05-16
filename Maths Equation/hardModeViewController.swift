//
//  hardModeViewController.swift
//  Maths Equation
//
//  Created by Jaydip on 22/03/22.
//

import UIKit

class hardModeViewController: UIViewController {

    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var scoreLabel: UILabel!
    var highScore: Int = 0
    var timeOfProgressView : Float = 10
    var time : Timer = Timer()
    var index = 0
    var score = 0
    var arrQuestions: NSMutableArray = ["13 + 9 = 22", "-20 + 9 = -11", "12 - 8 = 9", "30 + 9 = 39", "45 + 19 = 74",
                                        "22 * 9 = 198", "19 + 18 = 37", "45 - 35 = 80", "22 + 33 = 55", "56 - 14 = 42",
                                        "78 - 90 = -14", "23 * 4 = 93", "68 % 9 = 5", "-10 + 10 = -20", "11 - 13 = 2"]
    var arrAnswer: [Bool] = [true,true,false,true,false,
                             true,true,false,true,true,
                             false,false,true,true,false]
    override func viewDidLoad() {
        super.viewDidLoad()
        setRandomQuestion()
        setTimerForProgressView()

    }
    func setRandomQuestion() {
        questionLabel.text = "\(arrQuestions[Int.random(in: 0...14)])"
        index = arrQuestions.index(of: questionLabel.text!)

    }

    func setTimerForProgressView() {
        timeOfProgressView = 10

        time = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer(){
        if timeOfProgressView < 0{
            time.invalidate()
            showAlert()
        }else{
            timeOfProgressView = timeOfProgressView - 0.01
            progressView.progress = Float(timeOfProgressView)/10
        }
    }
    func showAlert(){
        let alert : UIAlertController = UIAlertController(title: "Game Over", message: "Score : \(score)", preferredStyle: .alert)

        let home : UIAlertAction = UIAlertAction(title: "Home", style: .default){_ in
            self.homeTapped()
        }
        let replay : UIAlertAction = UIAlertAction(title: "Replay", style: .default){_ in
            self.replayTapped()
        }

        alert.addAction(home)
        alert.addAction(replay)

        present(alert, animated: true, completion: nil)
    }
    func homeTapped(){
        navigationController?.popViewController(animated: true)
    }

    func replayTapped(){
        let replayButton = navigationController?.storyboard?.instantiateViewController(withIdentifier: "easyModeViewController") as! easyModeViewController
        navigationController?.pushViewController(replayButton, animated: false)
    }
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)

    }
    @IBAction func trueOrFalseButton(_ sender: UIButton) {
    switch sender.tag {
        case 0:
            if arrAnswer[index] == true {
                score = score + 1
                scoreLabel.text = String(score)
                setRandomQuestion()
                time.invalidate()
                setTimerForProgressView()
            } else{
                showAlert()
                score = 0
            }
        case 1:
        if arrAnswer[index] == false {
                score = score + 1
                scoreLabel.text = String(score)
                setRandomQuestion()
                time.invalidate()
                setTimerForProgressView()
            }else{
                showAlert()
                score = 0
            }
        default:
            break
        }
    }
    
}
