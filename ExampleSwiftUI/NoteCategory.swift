//
//  NoteCategory.swift
//  ExampleSwiftUI
//
//  Created by Jonas Blenninger on 08.10.19.
//  Copyright © 2019 Jonas Blenninger. All rights reserved.
//

import SwiftUI

struct NoteCategory: View {
    var name: String
    var items: [Note]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.name)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal) {
                ForEach(self.items) { note in
                    Item(note: note)
                }
            }
            .frame(height: 150)
        }
    }
}

struct Item: View {
    var note: Note
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: CGFloat(integerLiteral: 80), height: CGFloat(integerLiteral: 80))
                Text("N")
                    .font(.caption)
                    .fontWeight(.black)
                    .foregroundColor(.white)
            }
            Text(note.title)
                .foregroundColor(.black)
        }.padding(.leading, 20)
    }
}

struct NoteCategory_Previews: PreviewProvider {
    static var previews: some View {
        NoteCategory(name: "Default", items: [])
    }
}
