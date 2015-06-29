//
//  SecondViewController.swift
//  BasicDietApp
//
//  Created by Sonny Ambrogio on 2015-06-24.
//  Copyright © 2015 Viking Panda. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    //MARK:- ****** CONSTANTS AND VARIALBLES ******
    let functions = Functions()
    
    var height: Float?
    var weight: Float?
    var age: Float?
    var carbs: Double?
    var fat: Double?
    var protien: Double?
    var male: Bool?
    var female: Bool?
    
    //MARK:- ****** OUTLETS AND ACTIONS ******
    //MARK: Outlets
    @IBOutlet weak var ageInput: UITextField!
    @IBOutlet weak var footInput: UITextField!
    @IBOutlet weak var inchesInput: UITextField!
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var BMRoutput: UILabel!
    @IBOutlet weak var carbPctLabel: UILabel!
    @IBOutlet weak var proteinPctLabel:UILabel!
    @IBOutlet weak var fatPctLabel: UILabel!
    @IBOutlet weak var carbGramLabel: UILabel!
    @IBOutlet weak var proteinGramLabel: UILabel!
    @IBOutlet weak var fatGramLabel: UILabel!
    @IBOutlet weak var totalPctLabel: UILabel!
    @IBOutlet weak var fatSlider: UISlider!
    @IBOutlet weak var protienSlider: UISlider!
    @IBOutlet weak var carbSlider: UISlider!
    @IBOutlet weak var macroPctgLabel: UILabel!
    @IBOutlet weak var maleFemaleButton: UISegmentedControl!
    
    //MARK: Actions
    
    @IBAction func CalcuateButton(sender: UIButton) {
        calculateCaloricNeeds()
        DismissKeyboard()
    
    }
  
    @IBAction func MaleFemalButtonChanged(sender: UISegmentedControl) {
        switch maleFemaleButton.selectedSegmentIndex
        {
        case 0:
            male = true
            female = false
            BMRoutput.text = "0"
            DismissKeyboard()
            updateLabels()
             ;
        case 1:
            male = false
            female = true
            BMRoutput.text = "0"
            DismissKeyboard()
            updateLabels()
             ;
        default:
            break; 
        }
    }
    @IBAction func carbSliderValueChanged(sender: UISlider) {
        let currentValue = Float(sender.value)
        carbPctLabel.text = "\(lroundf(currentValue))"
        updateLabels()
    }
    
    @IBAction func fatSliderChangedValue(sender: UISlider) {
        let currentValue = Float(sender.value)
        fatPctLabel.text = "\(currentValue)"
        updateLabels()
    }
    
    @IBAction func protienSliderValueChanged(sender: UISlider) {
        let currentValue = Float(sender.value)
        proteinPctLabel.text = "\(currentValue)"
        updateLabels()
    }
    
    
    
    @IBAction func highCarbButton(sender: UIButton) {
        carbSlider.value = 60
        protienSlider.value = 20
        fatSlider.value = 20
        updateLabels()

    }
    
    @IBAction func dietZoneButton(sender: UIButton) {
        carbSlider.value = 40
        protienSlider.value = 30
        fatSlider.value = 30
        updateLabels()
    }
    
    @IBAction func lowCarbButton(sender: UIButton) {
        carbSlider.value = 10
        fatSlider.value = 60
        protienSlider.value = 30
        updateLabels()
    }
    

    //MARK:- ****** LIFECYCLE ******
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        carbSlider.value = 40
        fatSlider.value = 30
        protienSlider.value = 30
        male = true
        female = false
        updateLabels()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- ****** METHODS ******
    
    // takes user text input and converts it to a number
    func convertFromInput() {
        
        age = (ageInput.text?.floatValue)!
        
        weight = (weightInput.text?.floatValue)!
        weight = weight! * Float(0.453592)
    
        
        height = Float(functions.calculateInches((footInput.text?.floatValue)!, NumberOfInches: (inchesInput.text?.floatValue)!))
        height = functions.inchToCentimeter(height!)
    }

    // self explanitory
    func updateLabels() {
        
        if ageInput.text?.isEmpty == true || weightInput.text?.isEmpty == true || footInput.text?.isEmpty == true || inchesInput.text?.isEmpty == true {
            BMRoutput.text = "0"
        }
        updateMacroLabel()
        updateCarbLabels()
        updateFatLabels()
        updateProtienLabels()
        }
    
    func updateProtienLabels() {
        let calories = Float((BMRoutput.text?.doubleValue)!)
        
        proteinGramLabel.text = "\(lroundf(functions.calculateProtienGramAmount(calories, protienSliderValue: protienSlider.value)))"
        proteinPctLabel.text = "\(lroundf(protienSlider.value))"
    }
    
    func updateCarbLabels() {
        let calories = Float((BMRoutput.text?.doubleValue)!)
        
        carbGramLabel.text = "\(lroundf(functions.calculateCarbGramAmount(calories, carbSliderValue: carbSlider.value)))"
        carbPctLabel.text = "\(lroundf(carbSlider.value))"
    }
    
    func updateFatLabels() {
        let calories = Float((BMRoutput.text?.doubleValue)!)
        fatGramLabel.text = "\(lroundf(functions.calculateFatGramAmount(calories, fatSliderValue: fatSlider.value)))"
        fatPctLabel.text = "\(lroundf(fatSlider.value))"
    }
    
    func updateMacroLabel() {
        let macroTotal = lroundf(functions.addPercentage(fatSlider.value, protienPercent: protienSlider.value, carbPercent: carbSlider.value))
        if macroTotal > 100 {
            macroPctgLabel.textColor = UIColor.redColor()
        } else {
            macroPctgLabel.textColor = UIColor.greenColor()
        }
        macroPctgLabel.text = "\(macroTotal)"
        updateProtienLabels()
    }
    
    
    
    // Creation of alert when 1 or more of the user text fields are empty
    func showEmptyAlert() {
       
            let alert = UIAlertController(title: "ERROR", message: "1 or more fields are Empty\nPlease fill in all Fields", preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
    }
    
    func calculateCaloricNeeds() {
        if ageInput.text?.isEmpty == true || weightInput.text?.isEmpty == true || footInput.text?.isEmpty == true || inchesInput.text?.isEmpty == true {
            showEmptyAlert()
        } else if ageInput.text?.isEmpty == false && weightInput.text?.isEmpty == false &&  footInput.text?.isEmpty == false && inchesInput.text?.isEmpty == false {
            
            if male == true && female == false {
                convertFromInput()
                BMRoutput.text = "\(lroundf(functions.performMaleCalorieCalulation(height!, weightInKilograms: weight!, ageInYears: age!)))"
            }
            
            if male == false && female == true {
                convertFromInput()
                BMRoutput.text = "\(lroundf(functions.performFemaleCalorieCalculation(height!, weightInKilograms: weight!, ageInYears: age!)))"
                
            }
            updateLabels()
        }
        
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
// *************************************** //
}


//MARK:- ****** EXTENSIONS ******
extension String {
    var doubleValue: Double {
        if let number = NSNumberFormatter().numberFromString(self) {
            return number.doubleValue
        }
        return 0
    }
}

extension String {
    var floatValue: Float {
        if let number = NSNumberFormatter().numberFromString(self) {
            return number.floatValue
        }
        return 0
    }

}


