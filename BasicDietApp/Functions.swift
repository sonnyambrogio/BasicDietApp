//
//  Functions.swift
//  BasicDietApp
//
//  Created by Sonny Ambrogio on 2015-06-24.
//  Copyright © 2015 Viking Panda. All rights reserved.
//

import Foundation

class Functions {
    
    
    func performBmrCalulation(height: Double, weight: Double , age: Double) -> Double {
       
                
    }
    
    func calculateInches(NumberOfFeet: Float, NumberOfInches: Float) -> Float {
        
        let totalInches = (NumberOfFeet * 12) + NumberOfInches
        return totalInches
    }
    
    func addPercentage(fatPercent: Float, protienPercent: Float, carbPercent: Float) -> Float {
        
        let total =  fatPercent + protienPercent + carbPercent
        return total
    }
    
    
    func calculateCarbGramAmount(dailyCalories: Float, carbSliderValue: Float) -> Float {
        
        let caloriesPerGramOfCarbs: Float = 4
        return (dailyCalories / ((carbSliderValue / 100) + 1)) / caloriesPerGramOfCarbs
    }
    
    func calculateFatGramAmount(dailyCalories: Float, fatSliderValue: Float) -> Float {
        
        let caloriesPerGramOfFat: Float = 9
        return (dailyCalories / ((fatSliderValue / 100) + 1)) / caloriesPerGramOfFat
    }
    
    func calculateProtienGramAmount(dailyCalories: Float, protienSliderValue: Float) -> Float {
        let caloriesPerGramOfProtien: Float = 4
        return (dailyCalories / ((protienSliderValue / 100) + 1)) / caloriesPerGramOfProtien
    }
    
    func inchToCentimeter(inch: Float) -> Float {
        let centimetersPerInch: Float = 2.54
        return inch * centimetersPerInch
        
    }
}

