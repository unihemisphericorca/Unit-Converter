//
//  ViewController.swift
//  unitConverter
//
//  Created by washireichelmei on 19/10/2026.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btnDecimal: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var btnSelectType: UIButton!
    @IBOutlet weak var btnSelectUnitTemp: UIButton!
    @IBOutlet weak var labelInput: UILabel!
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var btnSelectUnitDistance: UIButton!
    @IBOutlet weak var btnSelectUnitWeight: UIButton!
    @IBOutlet weak var btnClear: UIButton!
    @IBOutlet weak var btnNegativeValue: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnSelectUnitDistance.isHidden = true
        self.btnSelectUnitWeight.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func unitSelector(_ sender: UIAction) {
        self.btnSelectType.setTitle(sender.title, for: .normal)
        
        if sender.title == "Temperature" {
            self.btnSelectUnitTemp.isHidden = false
            self.btnSelectUnitDistance.isHidden = true
            self.btnSelectUnitWeight.isHidden = true
        }else if sender.title == "Distance" {
            self.btnSelectUnitTemp.isHidden = true
            self.btnSelectUnitDistance.isHidden = false
            self.btnSelectUnitWeight.isHidden = true
        }else if sender.title == "Weight" {
            self.btnSelectUnitTemp.isHidden = true
            self.btnSelectUnitDistance.isHidden = true
            self.btnSelectUnitWeight.isHidden = false
        }
    }
    
    @IBAction func tempSelector(_ sender: UIAction) {
        self.btnSelectUnitTemp.setTitle(sender.title, for: .normal)
    }
    
    @IBAction func distanceSelector(_ sender: UIAction) {
        self.btnSelectUnitDistance.setTitle(sender.title, for: .normal)
    }
    
    @IBAction func weightSelector(_ sender: UIAction) {
        self.btnSelectUnitWeight.setTitle(sender.title, for: .normal)
    }
    
    @IBAction func btn1(_ sender: Any) {
        labelInput.text! += "1"
    }
    @IBAction func btn2(_ sender: Any) {
        labelInput.text! += "2"
    }
    @IBAction func btn3(_ sender: Any) {
        labelInput.text! += "3"
    }
    @IBAction func btn4(_ sender: Any) {
        labelInput.text! += "4"
    }
    @IBAction func btn5(_ sender: Any) {
        labelInput.text! += "5"
    }
    @IBAction func btn6(_ sender: Any) {
        labelInput.text! += "6"
    }
    @IBAction func btn7(_ sender: Any) {
        labelInput.text! += "7"
    }
    @IBAction func btn8(_ sender: Any) {
        labelInput.text! += "8"
    }
    @IBAction func btn9(_ sender: Any) {
        labelInput.text! += "9"
    }
    @IBAction func btn0(_ sender: Any) {
        labelInput.text! += "0"
    }
    @IBAction func btnDecimal(_ sender: Any) {
        if labelInput.text!.contains(".") || labelInput.text!.isEmpty || labelInput.text! == "-"{
        }else{
            labelInput.text! += "."
        }
    }
    @IBAction func btnNegativeValue(_ sender: Any) {
        if labelInput.text!.isEmpty{
            labelInput.text! += "-"
        }
    }
    @IBAction func btnDelete(_ sender: Any) {
        if labelInput.text!.isEmpty{
            labelInput.text! = ""
        }else{
            labelInput.text!.removeLast()
        }
    }
    @IBAction func btnClear(_ sender: Any) {
        labelInput.text! = ""
        labelResult.text! = ""
    }
    @IBAction func btnConvert(_ sender: Any) {
        if btnSelectType.titleLabel?.text == "Temperature" && btnSelectUnitTemp.titleLabel?.text == "°F"{
            if let num = Double(labelInput.text!){
                if num < -459.67 {
                    labelResult.text! = """
                        Temperature cannot
                        be lower than absolute
                        zero (-459.67 °F)
                        """
                }else{
                    labelResult.text! = """
                        Celsius: \((num - 32.0) * 5.0 / 9.0) °C
                        Kelvin: \((num - 32.0) * (5.0 / 9.0) + 273.15) K
                        """
                }
            }
        }else if btnSelectType.titleLabel?.text == "Temperature" && btnSelectUnitTemp.titleLabel?.text == "°C"{
            if let num = Double(labelInput.text!){
                if num < -273.15 {
                    labelResult.text! = """
                        Temperature cannot
                        be lower than absolute
                        zero (-273.15 °C)
                        """
                }else{
                    labelResult.text! = """
                        Fahrenheit: \((num * 9.0 / 5.0) + 32.0) °F
                        Kelvin: \(num + 273.15) K
                        """
                }
            }
        }else if btnSelectType.titleLabel?.text == "Temperature" && btnSelectUnitTemp.titleLabel?.text == "K"{
            if let num = Double(labelInput.text!){
                if num < 0 {
                    labelResult.text! = """
                        Temperature cannot
                        be lower than absolute
                        zero (0 K)
                        """
                }else{
                    labelResult.text! = """
                        Fahrenheit: \((num - 273.15) * 1.8 + 32.0) °F
                        Celsius: \(num - 273.15) °C
                        """
                }
            }
        }else if btnSelectType.titleLabel?.text == "Weight" && btnSelectUnitWeight.titleLabel?.text == "g"{
            if let num = Double(labelInput.text!){
                if num < 0 {
                    labelResult.text! = """
                        Weight must be greater
                        than or equal to zero.
                        """
                }else{
                    labelResult.text! = """
                        Kilogram: \(num / 1000.0) kg
                        Pound: \(num * 0.00220462) lb
                        """
                }
            }
        }else if btnSelectType.titleLabel?.text == "Weight" && btnSelectUnitWeight.titleLabel?.text == "kg"{
            if let num = Double(labelInput.text!){
                if num < 0 {
                    labelResult.text! = """
                        Weight must be greater
                        than or equal to zero.
                        """
                }else{
                    labelResult.text! = """
                        Gram: \(num * 1000.0) g
                        Pound: \(num * 2.20462262) lb
                        """
                }
            }
        }else if btnSelectType.titleLabel?.text == "Weight" && btnSelectUnitWeight.titleLabel?.text == "lb"{
            if let num = Double(labelInput.text!){
                if num < 0 {
                    labelResult.text! = """
                        Weight must be greater
                        than or equal to zero.
                        """
                }else{
                    labelResult.text! = """
                        Gram: \(num / 0.00220462) g
                        Kilogram: \(num / 2.20462262) kg
                        """
                }
            }
        }else if btnSelectType.titleLabel?.text == "Distance" && btnSelectUnitDistance.titleLabel?.text == "m"{
            if let num = Double(labelInput.text!){
                if num < 0 {
                    labelResult.text! = """
                        Distance must be greater
                        than or equal to zero.
                        """
                }else{
                    labelResult.text! = """
                        Kilometer: \(num / 1000.0) km
                        Miles: \(num * 0.000621371) miles
                        Feet: \(num * 3.28084) ft
                        """
                }
            }
        }else if btnSelectType.titleLabel?.text == "Distance" && btnSelectUnitDistance.titleLabel?.text == "km"{
            if let num = Double(labelInput.text!){
                if num < 0 {
                    labelResult.text! = """
                        Distance must be greater
                        than or equal to zero.
                        """
                }else{
                    labelResult.text! = """
                        Meter: \(num * 1000.0) m
                        Miles: \(num * 0.621371) miles
                        Feet: \(num * 3280.84) ft
                        """
                }
            }
        }else if btnSelectType.titleLabel?.text == "Distance" && btnSelectUnitDistance.titleLabel?.text == "miles"{
            if let num = Double(labelInput.text!){
                if num < 0 {
                    labelResult.text! = """
                        Distance must be greater
                        than or equal to zero.
                        """
                }else{
                    labelResult.text! = """
                        Meter: \(num * 1609.34) m
                        Kilometer: \(num * 1.60934) km
                        Feet: \(num * 5280.0) ft
                        """
                }
            }
        }else if btnSelectType.titleLabel?.text == "Distance" && btnSelectUnitDistance.titleLabel?.text == "ft"{
            if let num = Double(labelInput.text!){
                if num < 0 {
                    labelResult.text! = """
                        Distance must be greater
                        than or equal to zero.
                        """
                }else{
                    labelResult.text! = """
                        Meter: \(num * 0.3048) m
                        Kilometer: \(num * 0.0003048) km
                        Miles: \(num / 5280.0) miles
                        """
                }
            }
        }
    }
}
