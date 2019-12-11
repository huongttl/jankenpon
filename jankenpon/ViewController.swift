//
//  ViewController.swift
//  jankenpon
//
//  Created by Huong Tran on 12/9/19.
//  Copyright © 2019 RiRiStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var cissors: UIButton!
    
    enum choice: Int {
        case cissors = 1
        case rock
        case paper
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func jankenpon(_ sender: UIButton) {
        let controller : ResultViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        controller.userChoice = ResultViewController.choice(rawValue: sender.tag)!
        present(controller, animated: true, completion: nil)
    }
    
}

