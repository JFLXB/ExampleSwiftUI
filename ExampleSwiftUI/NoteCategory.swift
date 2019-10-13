//
//  NoteCategory.swift
//  Test
//
//  Created by Jonas Blenninger on 13.10.19.
//  Copyright © 2019 Jonas Blenninger. All rights reserved.
//

import SwiftUI


struct NoteCategory: View {
    var name: String
    var notes: [Note]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.name).font(.headline).padding(.leading, 20)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(self.notes) { note in
                        NoteCategoryItem(note: note)
                    }
                }.padding()
            }
        }
    }
}

struct NoteCategory_Previews: PreviewProvider {
    static var previews: some View {
        NoteCategory(name: "Category", notes: [Note.empty])
    }
}
