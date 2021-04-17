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
