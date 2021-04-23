//
//  ViewController.swift
//  MonsterHero
//
//  Created by zein rezky chandra on 17/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterLists: UILabel!
    @IBOutlet weak var monsterImage: UIImageView!
    @IBOutlet weak var monsterName: UILabel!
    @IBOutlet weak var monsterDesc: UILabel!
    @IBOutlet weak var monsterEnergy: UIProgressView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    var monsters: [Monster] = []
    var currentIndexMonster: Int = 0
    
    var newMonsterName: String?
    var newMonsterDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateMonster()
        monsterPreview(index: 0)
        previousButton.set(isEnabled: false)
        displayMonsterList()
    }
    
    //MARK: - Setting up model
    func generateMonster() {
        monsters.append(Monster(monster_name: "Greenyx", monster_desc: "Greenyx is one of the savior monster, he will became your savior and loyal with his master", monster_energy: 0.5))
        monsters.append(Monster(monster_name: "Purplexis", monster_desc: "Purplexis is lovely monster, his ability to turn mad into love", monster_energy: 0.3))
        monsters.append(Monster(monster_name: "RedEyex", monster_desc: "RedEyex is a madness, he will consume a love energy", monster_energy: 0.8))
        monsters.append(Monster(monster_name: "Yellowyx", monster_desc: "Yellowyx is neutral monster, he will turn noise to peace", monster_energy: 0.6))
    }
    
    //MARK: - Setting up the view
    func displayMonsterList() {
        var monsterNameList = ""
        for monster in monsters {
            guard let name = monster.name else { return }
            monsterNameList.append("\(name), ")
        }
        monsterLists.text = "List of Monsters: \(monsterNameList.prefix(monsterNameList.count - 2))"
    }
    
    func monsterPreview(index: Int) {
        if index == 0 {
            monsterImage.image = #imageLiteral(resourceName: "green")
        }else if index == 1 {
            monsterImage.image = #imageLiteral(resourceName: "purple")
        }else if index == 2 {
            monsterImage.image = #imageLiteral(resourceName: "yellow")
        }else {
            monsterImage.image = #imageLiteral(resourceName: "red")
        }
        monsterName.text = monsters[index].name
        monsterDesc.text = monsters[index].description
        DispatchQueue.main.async {
            print(Float(self.monsters[index].energy!))
            self.monsterEnergy.setProgress(self.monsters[index].energy!, animated: true)
        }
        
    }

    //MARK: - Handle the segue
    @IBAction func editTheMonster(_ sender: UIButton) {
        print("Edit button did tapped")
    }
    
    //MARK: - Handle the Action
    @IBAction func nextMonster(_ sender: UIButton) {

        if currentIndexMonster < monsters.count - 1 {
            currentIndexMonster += 1
            previousButton.set(isEnabled: true)
            if currentIndexMonster == monsters.count - 1 {
                nextButton.set(isEnabled: false)
            }
        }

        monsterPreview(index: currentIndexMonster)
    }
    
    @IBAction func prevMonster(_ sender: UIButton) {

        if currentIndexMonster > 0 {
            currentIndexMonster -= 1
            nextButton.set(isEnabled: true)
            if currentIndexMonster == 0 {
                previousButton.set(isEnabled: false)
            }
        }
        
        monsterPreview(index: currentIndexMonster)

    }
    
}

//MARK: - Button extension
extension UIButton {
    func set(isEnabled: Bool) {
        self.isEnabled = isEnabled
        self.alpha = isEnabled ? 1.0 : 0.5
    }
}

