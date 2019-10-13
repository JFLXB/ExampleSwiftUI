//
//  NoteDetail.swift
//  ExampleSwiftUI
//
//  Created by Jonas Blenninger on 13.10.19.
//  Copyright © 2019 Jonas Blenninger. All rights reserved.
//

import SwiftUI


struct NoteDetail: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    var note: Note
    
    var noteIndex: Int {
        userData.notes.firstIndex(where: { $0.id == note.id })!
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(note.title)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                    Text(note.date)
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                
                Button(action: {
                    self.userData.notes[self.noteIndex].isFavorite.toggle()
                }) {
                    if self.userData.notes[self.noteIndex].isFavorite {
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                    } else {
                        Image(systemName: "star").foregroundColor(.gray)
                    }
                }
            }

            ScrollView {
                Text(note.content)
                    .lineLimit(nil)
                    .lineSpacing(5)
                    .multilineTextAlignment(.leading)
            }
        }.padding()
    }
}

struct NoteDetail_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetail(note: Note.empty)
    }
}
