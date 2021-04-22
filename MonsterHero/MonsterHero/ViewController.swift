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
        monsters.append(Monster(monster_type: .green, monster_name: "Greenyx", monster_desc: "Greenyx is one of the savior monster, he will became your savior and loyal with his master", monster_energy: 0.5))
        monsters.append(Monster(monster_type: .purple, monster_name: "Purplexis", monster_desc: "Purplexis is lovely monster, his ability to turn mad into love", monster_energy: 0.3))
        monsters.append(Monster(monster_type: .red, monster_name: "RedEyex", monster_desc: "RedEyex is a madness, he will consume a love energy", monster_energy: 0.8))
        monsters.append(Monster(monster_type: .yellow, monster_name: "Yellowyx", monster_desc: "Yellowyx is neutral monster, he will turn noise to peace", monster_energy: 0.6))
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
        monsterImage.image = monsters[index].type?.getImage()
        monsterName.text = monsters[index].name
        monsterDesc.text = monsters[index].description
        DispatchQueue.main.async {
            print(Float(self.monsters[index].energy!))
            self.monsterEnergy.setProgress(self.monsters[index].energy!, animated: true)
        }
        
    }

    //MARK: - Handle the segue
    @IBAction func editTheMonster(_ sender: UIButton) {
        performSegue(withIdentifier: "editTheMonster", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newVC = segue.destination as? SecondViewController else { return }
        newVC.currentMonsterName = monsterName.text ?? "no name"
        newVC.currentMonsterDescription = monsterDesc.text ?? "no description"
        newVC.currentMonsterImage = monsterImage.image
        newVC.currentIndexMonster = currentIndexMonster
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
    
    //MARK: - Handle the UnwindSegue
    @IBAction func performUnwindSegueOperation(_ sender: UIStoryboardSegue) {
        guard let senderVC = sender.source as? SecondViewController else { return }
        if senderVC.newMonsterNameField.text == "" || senderVC.newMonsterDescription.text == "" {
            senderVC.currentMonsterName = newMonsterName
            senderVC.currentMonsterDescription = newMonsterDescription
        } else {
            senderVC.newMonsterNameField.text = newMonsterName
            senderVC.newMonsterDescription.text = newMonsterDescription
        }
        
        senderVC.currentIndexMonster = currentIndexMonster
        reloadData()
        monsterPreview(index: currentIndexMonster)

    }
    
    func reloadData() {
        monsters[currentIndexMonster].name = newMonsterName
        monsters[currentIndexMonster].description = newMonsterDescription
    }
}

//MARK: - Button extension
extension UIButton {
    func set(isEnabled: Bool) {
        self.isEnabled = isEnabled
        self.alpha = isEnabled ? 1.0 : 0.5
    }
}

