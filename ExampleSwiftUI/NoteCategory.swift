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
                HStack {
                    ForEach(self.items) { note in
                        Item(note: note)
                    }
                }
            }
            .frame(height: 125)
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
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 8)
                Text(note.title.prefix(3))
                    .font(.caption)
                    .fontWeight(.black)
                    .foregroundColor(.white)
            }
        }.padding()
    }
}

struct NoteCategory_Previews: PreviewProvider {
    static var previews: some View {
        NoteCategory(name: "Default", items: [])
    }
}
