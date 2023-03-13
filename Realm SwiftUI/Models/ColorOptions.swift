//
//  ColorOptions.swift
//  Realm SwiftUI
//
//  Created by VinhHoang on 13/03/2023.
//

import SwiftUI
import RealmSwift

enum ColorOptions: String, CaseIterable, PersistableEnum {
    case green
    case lightBlue
    case lightRed
    
    var color: Color {
        Color(rawValue)
    }
    
    var title: String {
        switch self {
        case .green:
            return "Green"
        case .lightBlue:
            return "Light Blue"
        case .lightRed:
            return "Light Red"
        }
    }
}
