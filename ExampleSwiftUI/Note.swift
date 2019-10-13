//
//  Note.swift
//  Test
//
//  Created by Jonas Blenninger on 13.10.19.
//  Copyright © 2019 Jonas Blenninger. All rights reserved.
//

import Foundation


struct Note: Hashable, Codable, Identifiable {
    var id: Int
    var category: String
    var title: String
    var content: String
    var isFavorite: Bool
    var date: String
    
    static let `empty` = Self(id: 0, category: "", title: "", content: "", isFavorite: false, date: "")    
}
