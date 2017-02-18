//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Andreas Sterner on 2017-02-17.
//  Copyright © 2017 Andreas Sterner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var currentOperation = Operation.Empty
    var runningNumber = "0"
    var leftVarStr = ""
    var rightValStr = ""
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

 
    @IBAction func numberPressed(sender: UIButton){
        //Inkluderade alla knappar
        runningNumber += "\(sender.tag)"
        outputLbl.text = runningNumber
        
    }
    
    @IBAction func onDividePressed(sender: AnyObject?){
        processOperation(operation: Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject?){
        processOperation(operation: Operation.Multiply)

    }

    @IBAction func onSubtractPressed(sender: AnyObject?){
        processOperation(operation: Operation.Subtract)

    }

    @IBAction func onAddPressed(sender: AnyObject?){
        processOperation(operation: Operation.Add)

    }
    
    @IBAction func onEqualPressed(sender: AnyObject?){
        processOperation(operation: currentOperation)
    }


    
    func processOperation(operation: Operation){
        if currentOperation != Operation.Empty {
            //A user pressed an operator, but then pressed another operator without first entering a number
            
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftVarStr)! * Double(rightValStr)!)"
                    
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftVarStr)! / Double(rightValStr)!)"

                    
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftVarStr)! - Double(rightValStr)!)"

                    
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftVarStr)! + Double(rightValStr)!)"

                }
                leftVarStr = result
                outputLbl.text = result
            }
            
            currentOperation = operation

        } else {
            //This is the first time an operator has been pressed
            leftVarStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }


}

