//
//  Model.swift
//  MyCalculator
//
//  Created by Клим Ковалевский on 15.03.2025.
//

import SwiftUI

enum Operation {
    case addition, subtract, multiply, divide, none
}

enum Buttons: String{
    case zero = "0"
    case One = "1"
    case Two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case plus = "+"
    case minus = "-"
    case equal = "="
    case decimal = "."
    case percent = "%"
    case negative = "+/-"
    case divide = "÷"
    case clear = "C"
    case multiple = "✕"
    
    var buttonColor: Color {
        switch self {
        case .clear:
            return Color.RedCalc
        case .equal:
            return Color.GreenCalc
        default:
            return Color.GreyCalc
        
        }
    }
    var buttonFondColor: Color {
        switch self {
        case .percent, .plus, .minus, .divide, .multiple:
            return Color.GreenCalc
        case .clear, .equal:
            return Color.DarkGreyCalc
       
        default:
            return Color.white
        
        }
    }
    
}
