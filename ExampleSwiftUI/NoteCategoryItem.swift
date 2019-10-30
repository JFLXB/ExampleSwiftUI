//
//  NoteItem.swift
//  ExampleSwiftUI
//
//  Created by Jonas Blenninger on 13.10.19.
//  Copyright © 2019 Jonas Blenninger. All rights reserved.
//

import SwiftUI


struct NoteCategoryItem: View {
    @EnvironmentObject var userData: UserData
    @State var isShowing = false
    
    var note: Note
    
    var body: some View {
        Button(action: {
            self.isShowing = true
        }) {
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.blue, .purple, .red]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .frame(width: CGFloat(integerLiteral: 80), height: CGFloat(integerLiteral: 80))
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 15)
                Text(self.note.title.prefix(5))
                    .font(.system(size: 20))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                
            }
        }
        .padding()
        .sheet(isPresented: self.$isShowing) {
            NoteDetail(note: self.note).environmentObject(self.userData)
        }
    }
}

struct NoteItem_Previews: PreviewProvider {
    static var previews: some View {
        NoteCategoryItem(note: Note.empty).environmentObject(UserData())
    }
}
