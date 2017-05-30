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
    var runningNumber = ""
    var leftVarStr = "0"
    var rightValStr = ""
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

 
    @IBAction func numberPressed(sender: UIButton){
        outputLbl.text = "0"
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
    
    @IBAction func onClearPressed(sender: UIButton){
        currentOperation = Operation.Empty
        outputLbl.text = "0"
        runningNumber = "0"
        leftVarStr = "0"
        rightValStr = ""
        result = ""
    }


    
    func processOperation(operation: Operation){
        if currentOperation != Operation.Empty {
            //A user pressed an operator, but then pressed another operator without first entering a number
            
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply && leftVarStr != "" {
                    result = "\(Double(leftVarStr)! * Double(rightValStr)!)"
                    
                } else if currentOperation == Operation.Divide && leftVarStr != "" {
                    result = "\(Double(leftVarStr)! / Double(rightValStr)!)"

                    
                } else if currentOperation == Operation.Subtract && leftVarStr != "" {
                    result = "\(Double(leftVarStr)! - Double(rightValStr)!)"

                    
                } else if currentOperation == Operation.Add && leftVarStr != "" {
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

