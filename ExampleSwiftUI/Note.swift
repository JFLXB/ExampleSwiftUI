//
//  Note.swift
//  ExampleSwiftUI
//
//  Created by Jonas Blenninger on 08.10.19.
//  Copyright © 2019 Jonas Blenninger. All rights reserved.
//

import SwiftUI

struct Note: Hashable, Codable, Identifiable {
    var id: Int
    var category: String
    var title: String
    var content: String
}
