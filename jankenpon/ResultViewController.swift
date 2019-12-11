//
//  ResultViewController.swift
//  jankenpon
//
//  Created by Huong Tran on 12/9/19.
//  Copyright © 2019 RiRiStudio. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultText: UILabel!
    
    enum choice: Int {
        case cissors = 1
        case rock
        case paper
    }
    
    enum result {
        case win
        case loose
        case draw
    }
    
    var userChoice: choice?
    var robotChoice: choice?
    
    override func viewWillAppear(_ animated: Bool) {
        if let userChoice = self.userChoice {
            robotChoice = randomRobotChoice()
            if let robotChoice = robotChoice {
                let result = didUserWin(userChoice: userChoice, robotChoice: robotChoice)
                resultText.text = "robot choose \(robotChoice) so you \(result)"
            } else {
                print("robot nill")
            }
        } else {
            print("user nill")
        }
    }
    
    override func viewDidLoad() {
//        super.viewDidLoad()
    }
    
    @IBAction func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func randomRobotChoice() -> choice {
        let random = Int.random(in: 1...3)
        return choice(rawValue: random)!
    }
    
    func didUserWin(userChoice: choice, robotChoice: choice) -> result {
        let userChoice = userChoice
        let robotChoice = robotChoice
        switch userChoice {
        case choice.cissors:
            switch robotChoice {
            case choice.cissors:
                return result.draw
            case choice.rock:
                return result.loose
            case choice.paper:
                return result.win
            }
        case choice.rock:
            switch robotChoice {
            case choice.cissors:
                return result.win
            case choice.rock:
                return result.draw
            case choice.paper:
                return result.loose
            }
        case choice.paper:
            switch robotChoice {
            case choice.cissors:
                return result.loose
            case choice.rock:
                return result.win
            case choice.paper:
                return result.draw
            }
        }
    }
}
