//
//  NoteEditor.swift
//  ExampleSwiftUI
//
//  Created by Jonas Blenninger on 09.10.19.
//  Copyright © 2019 Jonas Blenninger. All rights reserved.
//

import SwiftUI

struct NoteEditor: View {
    @Binding var note: Note
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(note.date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                if note.isFavorite {
                    Image(systemName: "star.fill")
                        .imageScale(.small)
                        .foregroundColor(.yellow)
                }
            }
            
            TextField("Content", text: $note.content)
                .lineLimit(0)
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
        }
    }
}

struct NoteEditor_Previews: PreviewProvider {
    static var previews: some View {
        NoteEditor(note: .constant(.empty))
    }
}
