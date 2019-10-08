//
//  ContentView.swift
//  ExampleSwiftUI
//
//  Created by Jonas Blenninger on 08.10.19.
//  Copyright © 2019 Jonas Blenninger. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var noteCategories: [String: [Note]] {
        Dictionary (
            grouping: notes,
            by: { $0.category }
        )
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(noteCategories.keys.sorted(), id: \.self) { key in
                    NoteCategory(name: key, items: self.noteCategories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: NoteList()) {
                    Text("Show All")
                }
            }.navigationBarTitle(Text("Notes"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
