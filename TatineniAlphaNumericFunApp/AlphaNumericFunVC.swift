//
//  AlphaNumericFunVCViewController.swift
//  TatineniAlphaNumericFunApp
//
//  Created by Bhargavi Tatineni on 1/31/24.
//

import UIKit
import Lottie
import AudioToolbox
import AnimatedGradientView

class AlphaNumericFunVC: UIViewController {

    
    
    
    @IBOutlet weak var bigContainerSV: UIStackView!
    @IBOutlet weak var headerSV: UIStackView!
    
    @IBOutlet weak var interactableUISV: UIStackView!
   
    @IBOutlet weak var numStringSV: UIStackView!
    @IBOutlet weak var numberSV: UIStackView!
    @IBOutlet weak var firstNumberSV: UIStackView!
    @IBOutlet weak var secondNumberSV: UIStackView!
    
    @IBOutlet weak var StringSV: UIStackView!
    @IBOutlet weak var stringCaseSV: UIStackView!
    @IBOutlet weak var lowCaseSV: UIStackView!
    @IBOutlet weak var upCaseSV: UIStackView!
    @IBOutlet weak var outputResetSV: UIStackView!
    @IBOutlet weak var resetSV: UIStackView!
    
    @IBOutlet weak var headerLBL: UILabel!
    @IBOutlet weak var num1LBL: UILabel!
    @IBOutlet weak var firstNumberLBL: UILabel!
    @IBOutlet weak var num2LBL: UILabel!
    @IBOutlet weak var secondNumberLBL: UILabel!
    @IBOutlet weak var abcd: UILabel!
    @IBOutlet weak var ABCD: UILabel!
    
    @IBOutlet weak var categorySC: UISegmentedControl!
    
    @IBOutlet weak var inputStringTF: UITextField!
    
    @IBOutlet weak var uppercaseSWCH: UISwitch!
    @IBOutlet weak var lowercaseSWCH: UISwitch!
    
    @IBOutlet weak var firstNumberStepper: UIStepper!
    @IBOutlet weak var secondNumberStepper: UIStepper!
    
    @IBOutlet weak var outputTV: UITextView!
    
    
    @IBOutlet weak var gradientView: AnimatedGradientView!
    
            
    
    override func viewDidLoad() {
        super.viewDidLoad()

//3. For the header label, set font as Title 3 and set its title
        self.headerLBL.text = String(format: "%@\nHAVE SOME FUN™️","\u{0C38}\u{0C2D}\u{0C15}\u{0C41} \u{0C28}\u{0C2E}\u{0C38}\u{0C4D}\u{0C15}\u{0C3E}\u{0C30}\u{0C02}")
        
        let gradient = AnimatedGradientView(frame: gradientView.bounds)
        gradient.direction = .up
        gradient.animationValues = [
        (colors: ["#FFA07A"], .up, .axial),
        (colors: ["#00FFFF"], .down, .axial)
        ]
        
        bigContainerSV.addSubview(gradient)
        bigContainerSV.sendSubviewToBack(gradient)
        
//6.b. For all four Stack Views keep border Width as 1 and corner Radius as 5
                
          headerSV.layer.borderWidth = 1
          headerSV.layer.cornerRadius = 5
          numberSV.layer.borderWidth = 1
          numberSV.layer.cornerRadius = 5
          StringSV.layer.borderWidth = 1
          StringSV.layer.cornerRadius = 5
          outputResetSV.layer.borderWidth = 1
          outputResetSV.layer.cornerRadius = 5
        
//6.c.The outputTV is set to a default value
        outputTV.text="Welcome!\n\nInteract with the UI elements and have some fun with numbers and strings, and patterns that are generated using them."
        
        
 //6.a All the UI elements are disabled except for the segmented control and reset button
        disableAllUIElements()
        
        print("1.In Auto Layout, attributes refer to specific characteristics of UI elements that can be constrained.These attributes include 1.Width&height 2.Leading&Trailing 3.Top& Bottom 4.Center X & Center Y 5.Baseline\n")
        
        print("2. Stack Views in Auto Layout simplify the use of constraints by providing a streamlined way to arrange and manage UI elements. They automatically handle the layout of their arranged subviews in a stack, either horizontally or vertically, without the need for manually specifying individual constraints. This simplifies the layout process, making it more efficient and reducing the amount of constraint code or Interface Builder configurations required.\n")
        
        print("3. Control-dragging constraints between views in Interface Builder is a way to create and define the layout relationships between different UI elements in your user interface. This method is useful because it allows you to visually establish the positioning and sizing rules for your views, making it easier to design and maintain your interface\n ")
        
        print("4. Auto Layout tools in Interface Builder are essential components that help designers and developers create adaptive and responsive UI. These tools assist in defining the layout constraints that determine how UI elements should be positioned and sized relative to each other, accommodating various screen sizes and orientations.\n")
        
                
    }
    
    func disableAllUIElements(){
        firstNumberLBL.isEnabled=false
        inputStringTF.isEnabled=false
        secondNumberLBL.isEnabled=false
        lowercaseSWCH.isEnabled=false
        uppercaseSWCH.isEnabled=false
        firstNumberStepper.isEnabled=false
        secondNumberStepper.isEnabled=false
    }
    

    @IBAction func selectCategory(_ sender: UISegmentedControl, forEvent event: UIEvent) {
        
     let selectedSegmentIndex = sender.selectedSegmentIndex
        
        switch selectedSegmentIndex {
        case 0:
            playSystemSound(soundID: 1104)
            firstNumberLBL.isEnabled=true
            secondNumberLBL.isEnabled=true
            firstNumberStepper.isEnabled=true
            secondNumberStepper.isEnabled=true
            inputStringTF.isEnabled=false
            lowercaseSWCH.isEnabled=false
            uppercaseSWCH.isEnabled=false
            firstNumberLBL.text = "0"
            secondNumberLBL.text = "0"
            firstNumberStepper.value=0
            secondNumberStepper.value=0
            self.calculateResult()
            
        case 1:
            playSystemSound(soundID: 1104)
            outputTV.text=nil
            inputStringTF.isEnabled=true
            lowercaseSWCH.isEnabled=true
            uppercaseSWCH.isEnabled=true
            firstNumberLBL.isEnabled=false
            secondNumberLBL.isEnabled=false
            firstNumberStepper.isEnabled=false
            secondNumberStepper.isEnabled=false
            firstNumberLBL.text = "0"
            secondNumberLBL.text = "0"
            firstNumberStepper.value=0
            secondNumberStepper.value=0
            
        case 2:
            playSystemSound(soundID: 1104)
            firstNumberLBL.isEnabled=true
            secondNumberLBL.isEnabled=true
            firstNumberStepper.isEnabled=true
            secondNumberStepper.isEnabled=true
            inputStringTF.isEnabled=false
            lowercaseSWCH.isEnabled=false
            uppercaseSWCH.isEnabled=false
            firstNumberLBL.text = "0"
            secondNumberLBL.text = "0"
            firstNumberStepper.value=0
            secondNumberStepper.value=0
            generatePattern()
            
        default:
            break
        }

    }
    
    @IBAction func respondToValueChange(_ sender: UITextField, forEvent event: UIEvent) {
               if sender.hasText{
                    displayStringOperations(inputStringTF.text ?? "")
                }
    }
    
    @IBAction func lowercaseString(_ sender: UISwitch, forEvent event: UIEvent) {
              playSystemSound(soundID: 1105)
                if sender.isOn {
                        uppercaseSWCH.isOn = false
                        inputStringTF.text = inputStringTF.text?.lowercased()
                    displayStringOperations(inputStringTF.text ?? "")
                    } else {
                        inputStringTF.text = inputStringTF.text?.uppercased()
                        displayStringOperations(inputStringTF.text ?? "")
                    }
    }
    
    @IBAction func uppercaseString(_ sender: UISwitch, forEvent event: UIEvent) {
               playSystemSound(soundID: 1105)
                if sender.isOn {
                        lowercaseSWCH.isOn = false
                        // Convert the entered string to uppercase
                        inputStringTF.text = inputStringTF.text?.uppercased()
                    displayStringOperations(inputStringTF.text ?? "")
                    } else {
                        inputStringTF.text = inputStringTF.text?.lowercased()
                        displayStringOperations(inputStringTF.text ?? "")
                    }
    }
    
    
    @IBAction func updateFirstNumber(_ sender: UIStepper, forEvent event: UIEvent) {
               playSystemSound(soundID: 1103)
                firstNumberLBL.text=String(Int(sender.value))
                if categorySC.selectedSegmentIndex==0{
                    self.calculateResult()
                }
                if categorySC.selectedSegmentIndex==2{
                    self.generatePattern()
                }
    }
    
    
    @IBAction func updateSecondNumber(_ sender: UIStepper, forEvent event: UIEvent) {
        playSystemSound(soundID: 1103)
        secondNumberLBL.text = String(Int(sender.value))
        if categorySC.selectedSegmentIndex==0{
                   self.calculateResult()
        }
       if categorySC.selectedSegmentIndex==2{
                   self.generatePattern()
       }
    }
    
    
    @IBAction func reset(_ sender: UIButton) {
                   firstNumberLBL.text = "0"
                    secondNumberLBL.text = "0"
                   firstNumberStepper.value=0
                   secondNumberStepper.value=0
                   inputStringTF.text = ""
                    lowercaseSWCH.isOn = false
                    uppercaseSWCH.isOn = false
                    outputTV.text = "Welcome!\n\nInteract with the UI elements and have some fun with numbers and strings, and patterns that are generated using them."

                    firstNumberLBL.isEnabled = false
                    secondNumberLBL.isEnabled = false
                    firstNumberStepper.isEnabled = false
                    secondNumberStepper.isEnabled = false
                    inputStringTF.isEnabled = false
                    lowercaseSWCH.isEnabled = false
                    uppercaseSWCH.isEnabled = false
                    categorySC.selectedSegmentIndex = UISegmentedControl.noSegment
    }
    
    
    func calculateResult() -> Void {
            let firstNumber=Int(firstNumberStepper.value)
            let secondNumber=Int(secondNumberStepper.value)
            if firstNumberStepper.value==0 {
                outputTV.text = "Use the 1st number stepper to increment the number value."
            }
            else if firstNumberStepper.value > 0 && secondNumberStepper.value == 0 {
                outputTV.text = "\nUse the 2nd number stepper to increment the number value."
            } else if firstNumberStepper.value > 0 && secondNumberStepper.value > 0 {
                outputTV.text=nil
                outputTV.text += "Concatenation of two numbers is \(firstNumber)\(secondNumber)\n"
                outputTV.text += "Square and cube of \(firstNumber) are \(firstNumber * firstNumber) and \(firstNumber * firstNumber * firstNumber) respectively\n"
                outputTV.text += "Square and cube of \(secondNumber) are \(secondNumber * secondNumber) and \(secondNumber * secondNumber * secondNumber) respectively\n"
                outputTV.text += "Binary representation of \(firstNumber) is \(String(firstNumber, radix: 2))\n"
                outputTV.text += "Binary representation of \(secondNumber) is \(String(secondNumber, radix: 2))\n"
            }

        }
    
    func generatePattern() -> Void {
            if firstNumberStepper.value==0 {
                outputTV.text = "Use the 1st number stepper to increment the number value."
            }
                else if firstNumberStepper.value > 0 && secondNumberStepper.value == 0 {
                    outputTV.text = "\nUse the 2nd number stepper to increment the number value."
                } else if firstNumberStepper.value > 0 && secondNumberStepper.value > 0 {
                let rows = Int(firstNumberStepper.value)
                let columns = Int(secondNumberStepper.value)
                           var pattern = ""
                    for i in 0..<rows {
                                for j in 0..<columns {
                                    if i == 0 || i == rows - 1 || j == 0 || j == columns - 1 {
                                        pattern += "🤩"
                                    } else {
                                        let square = (i + j) % 2 == 0 ? "◼️" : "◻️"
                                        pattern += square
                                    }
                                }
                                pattern += "\n"
                            }

                            outputTV.text = pattern
                        }
                    
        }
    
    func containsSpecialCharactersOrNumbers(_ text: String) -> Bool {
            let characterSet = CharacterSet(charactersIn: "!@#$%^&*()-_+=[]{}|;:,.<>?/0123456789")
            return text.rangeOfCharacter(from: characterSet) != nil
    }
        
    
    func playSystemSound(soundID: SystemSoundID) {
            AudioServicesPlaySystemSound(soundID)
        }
    
    
    @IBOutlet weak var launchLAV: LottieAnimationView!{
        didSet{
                    launchLAV.animation = LottieAnimation.named("HeyThere")
                    launchLAV.alpha = 1.0
                    launchLAV.loopMode = .playOnce
                    launchLAV.play{ [weak self] _ in
                        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1.0, delay: 0.0, options: [.curveEaseInOut]){
                            self?.launchLAV.alpha = 0.0
                        }
                        
                    }
                }
    }
    
    
    func displayStringOperations(_ string: String) {
        if inputStringTF.text?.isEmpty ?? true {
            inputStringTF.placeholder = "Please provide at least one character."
        } else {
            if containsSpecialCharactersOrNumbers(inputStringTF.text ?? "") {
                outputTV.text="Please enter a valid string with only alphabets"
            } else {
                //                        displayStringOperations(inputStringTF.text ?? "")
                var outputText = ""
                let isPalindrome = string == String(string.reversed())
                outputText += "Given string \(string) is \(isPalindrome ? "" : "not ")a palindrome\n"
                let vowels = string.lowercased().filter("aeiou".contains).count
                let consonants = string.lowercased().filter { !"aeiou".contains($0) && $0.isLetter }.count
                outputText += "Count of vowels in \(string) is \(vowels)\n"
                outputText += "Count of consonants in \(string) is \(consonants)\n"
                
                let uniqueChars = Set(string).count
                outputText += "Count of unique characters in \(string) is \(uniqueChars)\n"
                let reversedString = String(string.reversed())
                outputText += "The reverse of \(string) results in \(reversedString)"
                outputTV.text = outputText
            }
        }
    }
    
}
