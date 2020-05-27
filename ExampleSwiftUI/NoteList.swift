//
//  NoteList.swift
//  ExampleSwiftUI
//
//  Created by Jonas Blenninger on 13.10.19.
//  Copyright © 2019 Jonas Blenninger. All rights reserved.
//

import SwiftUI


struct NoteList: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavorites) {
                Text("Sort By Favorites").foregroundColor(.primary)
            }

            ForEach(self.userData.notes) { note in
                if !self.userData.showFavorites || note.isFavorite {
                    NoteRow(note: note)
                }
            }.onDelete(perform: delete)
        }
        .navigationBarTitle("All Notes")
        .navigationBarItems(trailing: EditButton())
    }
    
    func delete(at offsets: IndexSet) {
        userData.notes.remove(atOffsets: offsets)
    }
}

struct NoteList_Previews: PreviewProvider {
    static var previews: some View {
        NoteList().environmentObject(UserData())
    }
}
