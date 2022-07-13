//
//  Place.swift
//  Parallax
//
//  Created by Эрхаан Говоров on 13.07.2022.
//

import SwiftUI

struct Place: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var placName: String
    var imageName: String
    var bgname: String
}

var sample_places: [Place] = [
    .init(placName: "levi", imageName: "levi", bgname: "leviBG")
]
