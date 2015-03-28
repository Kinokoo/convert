//
//  ViewController.swift
//  convert
//
//  Created by Jani on 3/24/15.
//  Copyright (c) 2015 Janis. All rights reserved.
//

import Darwin
import Cocoa

class ViewController: NSViewController, NSTextFieldDelegate {

    @IBOutlet weak var inputField:  NSTextField!
    @IBOutlet weak var switchCF:    NSSegmentedControl!
    @IBOutlet weak var textNames:   NSTextField!
    @IBOutlet weak var textValues:  NSTextField!

    @IBAction func switchCFClicked(sender: AnyObject) {
        convertTemperatures()
    }

    override func controlTextDidChange(obj: NSNotification)
    {
        convertTemperatures()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        inputField.delegate = self
        convertTemperatures()
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }

    func convertTemperatures() {
        
        var temperature = Temperature()
        let sentValue   = inputField.doubleValue ?? 0
        
        struct switchStatus {
            static let Celsius      = 0
            static let Fahrenheit   = 1
            static let Kelvin       = 2
            static let Rankine      = 3
            static let Newton       = 4
            static let Réaumur      = 5
            static let Rømer        = 6
            static let Delisle      = 7
        }
        
        switch(switchCF.selectedSegment)
        {
        case switchStatus.Celsius:
            temperature.celsius = sentValue
            break
        case switchStatus.Fahrenheit:
            temperature.fahrenheit = sentValue
            break
        case switchStatus.Kelvin:
            temperature.kelvin = sentValue
            break
        case switchStatus.Rankine:
            temperature.rankine = sentValue
            break
        case switchStatus.Newton:
            temperature.newton = sentValue
            break
        case switchStatus.Réaumur:
            temperature.réaumur = sentValue
            break
        case switchStatus.Rømer:
            temperature.rømer = sentValue
            break
        case switchStatus.Delisle:
            temperature.delisle = sentValue
            break
        default:
            temperature.celsius = sentValue
        }

        printTemperatures(temperature)
    }
    
    func printTemperatures (temperature: Temperature!)
    {
        var temperatures: [String: Double] = [
            "Celsius"   : temperature.celsius,
            "Fahrenheit": temperature.fahrenheit,
            "Kelvin"    : temperature.kelvin,
            "Rankine"   : temperature.rankine,
            "Newton"    : temperature.newton,
            "Réaumur"   : temperature.réaumur,
            "Rømer"     : temperature.rømer,
            "Delisle"   : temperature.delisle
        ]
        
        textNames.stringValue  = ""
        textValues.stringValue = ""
        
        for item in temperatures {
            textNames.stringValue   = textNames.stringValue  + "\(item.0)\n"
            textValues.stringValue  = textValues.stringValue + "\(item.1)\n"
        }
    }
}

