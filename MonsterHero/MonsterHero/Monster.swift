//
//  Monster.swift
//  MonsterHero
//
//  Created by zein rezky chandra on 17/04/21.
//

import Foundation

class Monster {
    
    var type: MonsterType?
    var name: String?
    var description: String?
    var energy: Float?
    
    init(monster_type: MonsterType?, monster_name: String?, monster_desc: String?, monster_energy: Float?) {
        type = monster_type
        name = monster_name
        description = monster_desc
        energy = monster_energy
    }
    
}
