//
//  NoteStatic.swift
//  ExampleSwiftUI
//
//  Created by Jonas Blenninger on 10.10.19.
//  Copyright © 2019 Jonas Blenninger. All rights reserved.
//

import SwiftUI

struct NoteStatic: View {
    var note: Note
    
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
            
            Text(note.content)
                .lineLimit(nil)
                .lineSpacing(10)
                .multilineTextAlignment(.leading)
            
            Spacer()
        }.background(Color.green)
    }
}

struct NoteStatic_Previews: PreviewProvider {
    static var previews: some View {
        NoteStatic(note: Note(id: 1, category: "Category", title: "Title", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ", isFavorite: true, date: "1.1.2010"))
    }
}
