//
//  MonsterType.swift
//  MonsterHero
//
//  Created by zein rezky chandra on 17/04/21.
//

import UIKit

/// Modified by: Zein
/// Enumeration
///
/// I know how to work with enumeration in Swift
/// https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html
///
/// - Important: `TEC069    I know how to work with enumeration in Swift`
///

enum MonsterType {
    case green
    case purple
    case red
    case yellow
}

extension MonsterType {
    func getImage() -> UIImage {
        switch self {
        case .green: return #imageLiteral(resourceName: "green")
        case .purple: return #imageLiteral(resourceName: "purple")
        case .yellow: return #imageLiteral(resourceName: "yellow")
        case .red: return #imageLiteral(resourceName: "red")
        }
    }
}
