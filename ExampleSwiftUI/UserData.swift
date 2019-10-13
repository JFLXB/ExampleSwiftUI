//
//  UserData.swift
//  Test
//
//  Created by Jonas Blenninger on 13.10.19.
//  Copyright © 2019 Jonas Blenninger. All rights reserved.
//

import Foundation


final class UserData: ObservableObject {
    @Published var showFavorites = false
    @Published var notes = notesData
}
