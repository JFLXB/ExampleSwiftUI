//
//  NoteList.swift
//  ExampleSwiftUI
//
//  Created by Jonas Blenninger on 09.10.19.
//  Copyright © 2019 Jonas Blenninger. All rights reserved.
//

import SwiftUI

struct NoteList: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavorites) {
                Text("Sort By Favorites")
            }
            
            ForEach(userData.notes) { note in
                if !self.userData.showFavorites || note.isFavorite {
                    NavigationLink(destination: NoteDetail(note: note).environmentObject(self.userData)) {
                         NoteRow(note: note)
                    }
                }
            }
        }.navigationBarTitle("Notes")
    }
}

struct NoteList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoteList()
        }.environmentObject(UserData())
    }
}
