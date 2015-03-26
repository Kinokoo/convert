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

    @IBOutlet weak var inputField:  NSTextField!
    @IBOutlet weak var switchCF:    NSSegmentedControl!
    @IBOutlet weak var textNames:   NSTextField!
    @IBOutlet weak var textValues:  NSTextField!

    @IBAction func changed(sender: NSTextField)
    {
        if sender.stringValue == "" {
            return
        }

        var temperature = Temperature()
        let sentValue   = sender.doubleValue ?? 0
        
        switch(switchCF.objectValue!.integerValue)
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

        var results: [String: Double] = [   "Celsius"   : temperature.celsius,
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
        
        for item in results {
            textNames.stringValue   = textNames.stringValue  + item.0 + "\n"
            textValues.stringValue  = textValues.stringValue + "\(item.1)\n"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputField.delegate = self
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

