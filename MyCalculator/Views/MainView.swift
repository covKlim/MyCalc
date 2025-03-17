//
//  MainView.swift
//  MyCalculator
//
//  Created by Клим Ковалевский on 15.03.2025.
//

import SwiftUI

struct MainView: View {
    //MARK: PROPERTY
    @State private var showNumb = "0"
    @State private var showNumbTwo = "0"
    @State private var value = "0"
    @State private var number: Double = 0.0
    @State private var currentOperation: Operation?


    
    let buttonsArray: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.One, .Two, .three, .plus],
        [.zero, .decimal, .equal],
    ]
    
    var body: some View {
        
        ZStack{
            //MARK: Background
            Color.DarkGreyCalc
                .ignoresSafeArea()
            VStack(spacing: 20){
                Spacer()
                
                
                //MARK: Display
                HStack(spacing: 20) {
                    Spacer()
                    Text(showNumb)
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                        .fontWeight(.light)
                        .padding(.horizontal, 20)
                    
                }
                HStack(spacing: 20) {
                    Spacer()
                    Text(showNumbTwo)
                        .foregroundColor(.GreyCalc)
                        .font(.system(size: 60))
                        .fontWeight(.light)
                        .padding(.horizontal, 20)
                    
                }
                Spacer()
                //MARK: Buttons
                ForEach(buttonsArray, id: \.self) { row in
                    HStack(spacing: 20) {
                        ForEach(row, id:\.self) { item in
                            Button {
                                self.didTap(item: item)
                            } label: {
                                Text(item.rawValue)
                                    .font(.system(size: 36))
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight())
                                    .foregroundColor(item.buttonFondColor)
                                    .background(item.buttonColor)
                                    .cornerRadius(9)
                            }

                        }
                    }
                }
            }
        }
    }
    //MARK: tap button method
    func didTap(item: Buttons){
        switch item {
        case .plus:
            if let currentValue = Double(value) {
                if currentOperation != nil {
                    number = performOperation(currentValue: currentValue)
                    showNumbTwo = formatResult(number)
                } else {
                    number = currentValue
                }
                currentOperation = .addition
                value = "0"
                showNumb += "+"
            }
        case .minus:
            if let currentValue = Double(value) {
                if currentOperation != nil {
                    number = performOperation(currentValue: currentValue)
                    showNumbTwo = formatResult(number)
                } else {
                    number = currentValue
                }
                currentOperation = .subtract
                value = "0"
                showNumb += "-"
            }
        case .equal:
            if let currentValue = Double(value){
                value = formatResult(performOperation(currentValue: currentValue))
                number = 0
                showNumbTwo = value
                showNumb = value
                currentOperation = nil
            }
        case .decimal:
            if !value.contains("."){
                value += "."
                showNumb += "."
            }
        case .percent:
            if let currentValue = Double(value){
                value = formatResult(currentValue / 100)
            }
        case .negative:
            if let currentValue = Double(value){
                value = formatResult(-currentValue)
               
            }
        case .divide:
            if let currentValue = Double(value) {
                if currentOperation != nil {
                    number = performOperation(currentValue: currentValue)
                    showNumbTwo = formatResult(number)
                } else {
                    number = currentValue
                }
                currentOperation = .divide
                value = "0"
                showNumb += "÷"
            }
        case .clear:
            value = "0"
            showNumb = "0"
        case .multiple:
            if let currentValue = Double(value) {
                if currentOperation != nil {
                    number = performOperation(currentValue: currentValue)
                    showNumbTwo = formatResult(number)
                } else {
                    number = currentValue
                }
                currentOperation = .multiply
                value = "0"
                showNumb += "×"
            }
        default:
            if value == "0" {
                value = item.rawValue
                if showNumb == "0"{
                    showNumb = item.rawValue
                }else{
                    showNumb += item.rawValue
                }
            }else{
                value += item.rawValue
                showNumb += item.rawValue
            }
        }
        }
    //MARK: helper calc method
    func performOperation( currentValue: Double) -> Double {
        switch currentOperation {
        case .addition:
            return number + currentValue
        case .subtract:
            return number - currentValue
        case .multiply:
            return number * currentValue
        case .divide:
            return number / currentValue
        default:
            return currentValue
        }
    }
    //MARK: Beuty answer
    func formatResult(_ result: Double) -> String {
        return String(format: "%g", result)
    }





    func buttonWidth(item: Buttons) -> CGFloat {
        let spacing: CGFloat = 20
        let totalSpacing:CGFloat = 5 * spacing
        let EqualtotalSpacing:CGFloat = 4 * spacing
        let totalColums: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        if item == .equal {
            
            return (screenWidth - EqualtotalSpacing) / totalColums * 2 + 10
        }
        
        return (screenWidth - totalSpacing) / totalColums
        
        
        
    }
    func buttonHeight() -> CGFloat {
        let spacing: CGFloat = 20
        let totalSpacing:CGFloat = 5 * spacing
        let totalColums: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        return (screenWidth - totalSpacing) / totalColums
        
        
        
    }
}
#Preview {
    MainView()
}
