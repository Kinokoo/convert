//
//  temperature.swift
//  convert
//
//  Created by Jani on 3/24/15.
//  Copyright (c) 2015 Janis. All rights reserved.
//

import Foundation

class Temperature
{
    var celsius: Double = 0.0
    
    var fahrenheit: Double
    {
        get {
            return (celsius * 1.8) + 32.0
        }
        set {
            celsius = (newValue - 32) / 1.8
        }
    }
    
    var kelvin: Double {
        get {
            return celsius + 273.15
        }
        set {
            celsius = newValue - 273.15
        }
    }
    
    var rankine: Double {
        get {
            return celsius * 1.8000 + 491.67
        }
        set {
            celsius = (newValue - 491.67) / 1.8000
        }
    }
    
    var newton: Double {
        get {
            return celsius * (33 / 100)
        }
        set {
            celsius = newValue * (100 / 33)
        }
    }
    
    var réaumur: Double {
        get {
            return celsius * (4 / 5)
        }
        set {
            celsius = newValue * (5 / 4)
        }
    }
    
    var rømer: Double {
        get {
            return celsius * (21 / 40) + 7.5
        }
        set {
            celsius = (newValue - 7.5) * (40 / 21)
        }
    }
    
    var delisle: Double {
        get {
            return (100 - celsius) * (3 / 2)
        }
        set {
            celsius = 100 - newValue * (2 / 3)
        }
    }
}