//
//  Home.swift
//  ExampleSwiftUI
//
//  Created by Jonas Blenninger on 12.10.19.
//  Copyright © 2019 Jonas Blenninger. All rights reserved.
//

import SwiftUI


struct Home: View {
    @EnvironmentObject var userData: UserData
    
    var noteCategories: [String: [Note]] {
        Dictionary (
            grouping: userData.notes,
            by: { $0.category }
        )
    }
    
    var showAsListLink: some View {
        NavigationLink(destination: NoteList()) {
            Image(systemName: "list.dash")
                .imageScale(.large)
                .accessibility(label: Text("Show Content As List"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(noteCategories.keys.sorted(), id: \.self) { key in
                    NoteCategory(name: key, notes: self.noteCategories[key]!)
                }
            }
            .navigationBarTitle("Recent Notes")
            .navigationBarItems(trailing: showAsListLink)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
