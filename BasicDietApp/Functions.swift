//
//  Functions.swift
//  BasicDietApp
//
//  Created by Sonny Ambrogio on 2015-06-24.
//  Copyright © 2015 Viking Panda. All rights reserved.
//

import Foundation

class Functions {
    
    let caloricDeficit: Float = 500.00
    let execiseMultiplier: Float = 1.20
    
    
    func performMaleCalorieCalulation(heightInCentimeters: Float, weightInKilograms: Float , ageInYears: Float) -> Float {

        let BMR = (88.362 + (13.397 * weightInKilograms) + (4.799 * heightInCentimeters) - (5.677 * ageInYears))
        
        return (BMR * execiseMultiplier) - caloricDeficit
                
    }
    
    func performFemaleCalorieCalculation(heightInCentimeters: Float, weightInKilograms: Float, ageInYears: Float) -> Float {
        
        let BMR = (447.593 + (9.247 * weightInKilograms) + (3.098 * heightInCentimeters) - (4.330 * ageInYears))

        return (BMR * execiseMultiplier) - caloricDeficit
        
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
    
    func poundsToKilograms(pounds: Float) -> Float {
        let kilogramsPerPound: Float = 0.453592
        return pounds * kilogramsPerPound
    }
}

