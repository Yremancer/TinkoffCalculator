//
//  CalculationListViewController.swift
//  TinkoffCalculator
//
//  Created by pukita on 08.08.2024.
//

import UIKit

class CalculationListViewController: UIViewController {
    
    var result: String?
    
    
    @IBOutlet weak var calculationLabel: UILabel!
    
    
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initialize()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        initialize()
    }
    
    private func initialize(){
        modalPresentationStyle = .fullScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculationLabel.text = result
    }
    
    
    @IBAction func dismissVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
