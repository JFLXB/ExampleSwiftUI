//
//  NoteRow.swift
//  ExampleSwiftUI
//
//  Created by Jonas Blenninger on 09.10.19.
//  Copyright © 2019 Jonas Blenninger. All rights reserved.
//

import SwiftUI

struct NoteRow: View {
    var note: Note

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(note.title)
                    .font(.headline)
                    .foregroundColor(.black)
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
}

struct NoteRow_Previews: PreviewProvider {
    static var previews: some View {
        NoteRow(note: Note(id: 1, category: "Category", title: "Title", content: "Content", isFavorite: true, date: "1.1.2010"))
    }
}
