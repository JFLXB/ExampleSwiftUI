//
//  NoteDetail.swift
//  ExampleSwiftUI
//
//  Created by Jonas Blenninger on 09.10.19.
//  Copyright © 2019 Jonas Blenninger. All rights reserved.
//

import SwiftUI

struct NoteDetail: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var noteDraft = Note.empty

    var note: Note
    
    var noteIndex: Int {
        userData.notes.firstIndex(where: { $0.id == note.id })!
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if self.mode?.wrappedValue == .active {
                HStack {
                    Button("Cancel") {
                        self.noteDraft = self.note
                        self.mode?.animation().wrappedValue = .inactive
                    }
                    .foregroundColor(.red)
                    Spacer()
                }
            }
            
            if self.mode?.wrappedValue == .inactive {
                NoteStatic(note: note)
            } else {
                NoteEditor(note: $noteDraft)
                    .onAppear {
                        self.noteDraft = self.note
                    }
                    .onDisappear {
                        self.userData.notes[self.noteIndex] = self.noteDraft
                    }
            }
        }
        .navigationBarTitle(note.title)
        .navigationBarItems(trailing: EditButton())
        .padding()
    }
}

struct NoteDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoteDetail(note: Note(id: 1, category: "Category", title: "Work", content: "Content", isFavorite: false, date: "1.1.2010"))
                .environmentObject(UserData())
        }
    }
}
