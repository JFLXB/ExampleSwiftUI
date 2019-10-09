//
//  UserData.swift
//  ExampleSwiftUI
//
//  Created by Jonas Blenninger on 09.10.19.
//  Copyright © 2019 Jonas Blenninger. All rights reserved.
//

import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavorites = false
    @Published var notes = notesData
}
