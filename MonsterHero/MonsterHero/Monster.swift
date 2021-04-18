//
//  Monster.swift
//  MonsterHero
//
//  Created by zein rezky chandra on 17/04/21.
//

import Foundation


/// Modified by: Zein
/// Struct: Value type
///
/// I can implement Structures and Classes in Swift
/// https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html
///
/// - Important: `TEC065    I can implement Structures and Classes in Swift`
///

struct Monster {
    
    /// Modified by: Zein
    /// Optional
    ///
    /// I know how to use Optional Values in Swift
    /// https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html
    ///
    /// - Important: `TEC079    I know how to use Optional Values in Swift`
    ///
    
    var type: MonsterType? // We use an optional, according to the field that Monster Type probably empty or have no value
    var name: String? // We use an optional, according to the field that name probably empty or have no value
    var description: String? // We use an optional, according to the field that description probably empty or have no value
    var energy: Float? // We use an optional, according to the field that energy probably empty or have no value
    
    init(monster_type: MonsterType?, monster_name: String?, monster_desc: String?, monster_energy: Float?) {
        type = monster_type
        name = monster_name
        description = monster_desc
        energy = monster_energy
    }
    
}
