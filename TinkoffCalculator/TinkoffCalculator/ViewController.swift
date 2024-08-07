//
//  ViewController.swift
//  TinkoffCalculator
//
//  Created by pukita on 07.08.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else {return}
        print(buttonTitle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

