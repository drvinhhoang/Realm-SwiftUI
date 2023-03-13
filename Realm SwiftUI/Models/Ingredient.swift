//
//  Ingredient.swift
//  Realm SwiftUI
//
//  Created by VinhHoang on 13/03/2023.
//

import SwiftUI
import RealmSwift

class Ingredient: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var notes = ""
    @Persisted var quantity = 1
    @Persisted var bought = false
    @Persisted var colorOption = ColorOptions.green
}

extension Ingredient {
    var color: Color {
        colorOption.color
    }
}
