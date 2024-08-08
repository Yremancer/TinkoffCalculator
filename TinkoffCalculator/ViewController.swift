//
//  ViewController.swift
//  TinkoffCalculator
//
//  Created by pukita on 07.08.2024.
//

import UIKit

enum Operation: String  {
    
    case add = "+"
    case substract = "-"
    case multiply = "x"
    case divide = "/"
    
    
    func calculate(number1 : Double, number2 : Double) -> Double{
        
        switch self {
        case .add:
            return number1 + number2
        case .substract:
            return number1 - number2
        case .multiply:
            return number1 * number2
        case .divide:
            return number1 / number2
        }
    }
    
}

enum CalculationHistoryItem {
    case number(Double)
    case operation(Operation)
}




class ViewController: UIViewController {

    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else {return}
        
        if buttonTitle == "," && label.text?.contains(",") == true {
            return
        }
        
        if label.text == "0"{
            label.text = buttonTitle
        }else{
            label.text?.append(buttonTitle)
        }
        
        
    }
    
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        guard 
        let buttonTitle = sender.titleLabel?.text,
        let buttonOperation = Operation(rawValue: buttonTitle)
        else {return}
        
        
        guard
            let labelText = label.text,
            let labelNumber = numberFormatter.number(from: labelText)?.doubleValue
            else {return}
        calculationHistory.append(.number(labelNumber))
        calculationHistory.append(.operation(buttonOperation))
        
        resetLabelText()
    }
    
    
    @IBAction func clearButtonPressed() {
        calculationHistory.removeAll()
        resetLabelText()
    }
    
    
    @IBAction func calculateButtonPressed() {
        guard
            let labelText = label.text,
            let labelNumber = numberFormatter.number(from: labelText)?.doubleValue
            else {return}
        calculationHistory.append(.number(labelNumber))
        
        let result = calculate()
        
        label.text = numberFormatter.string(from: NSNumber(value: result))
        calculationHistory.removeAll()
    }
    
    
    
    
    @IBOutlet weak var label: UILabel!
    
    var calculationHistory: [CalculationHistoryItem] = []
    
    
    lazy var numberFormatter: NumberFormatter = {
       let numberFornatter = NumberFormatter()
        numberFornatter.usesGroupingSeparator = false
        numberFornatter.locale = Locale(identifier: "ru_RU")
        numberFornatter.numberStyle = .decimal
        
        return numberFornatter
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetLabelText()
    }
    
    func resetLabelText(){
        label.text = "0"
    }
    
    func calculate() -> Double{
        guard case .number(let firstNumber) = calculationHistory[0] else {return 0}
        
        var currentValue = firstNumber
        
        for i in stride(from: 1, through: calculationHistory.count - 1, by: 2){
            guard 
                case .operation(let operation) = calculationHistory[i],
                case .number(let number) = calculationHistory[i + 1]
            else {break}
            
            currentValue = operation.calculate(number1: currentValue, number2: number)
        }
        
        return currentValue
        
    }

}

