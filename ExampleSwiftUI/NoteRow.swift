//
//  NoteRow.swift
//  Test
//
//  Created by Jonas Blenninger on 13.10.19.
//  Copyright © 2019 Jonas Blenninger. All rights reserved.
//

import SwiftUI


struct NoteRow: View {
    @EnvironmentObject var userData: UserData
    @State var isShowing = false
    var note: Note
    
    var body: some View {
        Button(action: {
            self.isShowing = true
        }) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(note.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text(note.date)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                
                if note.isFavorite {
                    Image(systemName: "star.fill")
                        .imageScale(.medium)
                        .foregroundColor(.yellow)
                }
            }
        }
        .sheet(isPresented: self.$isShowing) {
            NoteDetail(note: self.note).environmentObject(self.userData)
        }
    }
}

struct NoteRow_Previews: PreviewProvider {
    static var previews: some View {
        NoteRow(note: Note.empty)
    }
}
