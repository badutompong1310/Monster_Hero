//
//  SecondViewController.swift
//  MonsterHero
//
//  Created by khoirunnisa' rizky noor fatimah on 17/04/21.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var monsterImage: UIImageView!
    @IBOutlet weak var monsterName: UILabel!
    @IBOutlet weak var monsterDescription: UILabel!
    
    
    /// Modified by: Zein
    /// Input Element
    ///
    /// I know how to implement Text Input with UIKit
    /// https://developer.apple.com/documentation/uikit/text_display_and_fonts
    ///
    /// - Important: `TEC018    I know how to implement Textfield with UIKit`
    ///
    
    /// When using input element in UIKit, make sure we are aware of the keyboard interaction.
    /// Hence, UX will be take a role on that. We need to use the delegate in order to have a control of the keyboard.

    @IBOutlet weak var newMonsterNameField: UITextField!
    @IBOutlet weak var newMonsterDescription: UITextField!
    
    var currentMonsterName: String?
    var currentMonsterDescription: String?
    var currentMonsterImage: UIImage?
    var currentIndexMonster: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        monsterName.text = currentMonsterName
        monsterDescription.text = currentMonsterDescription
        monsterImage.image = currentMonsterImage
        newMonsterNameField.delegate = self
        newMonsterDescription.delegate = self
    }
   
    @IBAction func cancelChanges(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveChanges(_ sender: UIButton) {
        if newMonsterNameField.text == "" {
            print("nil")
        }
        
        dismiss(animated: true, completion: nil)
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let lastVC = segue.destination as? ViewController else { return }
        
        /// Modified by: Zein
        /// Conditional Statement
        ///
        /// I can use Conditional Statements in Swift ( if/else; switch/case;  guard; Comparison Operators; )
        /// https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html
        ///
        /// - Important: `TEC055    I can use Conditional Statements in Swift`
        ///
        
        if newMonsterNameField.text == "" {
            lastVC.newMonsterName = currentMonsterName
        } else {
            lastVC.newMonsterName = newMonsterNameField.text
        }
        
        if newMonsterDescription.text == "" {
            lastVC.newMonsterDescription = currentMonsterDescription
        } else {
            lastVC.newMonsterDescription = newMonsterDescription.text
        }
        
        lastVC.currentIndexMonster = currentIndexMonster
        
    }
}

extension SecondViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
