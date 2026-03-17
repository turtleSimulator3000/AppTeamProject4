//
//  ContentView.swift
//  Project3
//
//  Created by Jeffrey Hu on 3/3/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    @State private var page: RemindersPage = RemindersPage( title: "Title", items: [Reminder(title: "Enter text", isCompleted: false)], color: Color.red)
    
    var body: some View {
        NavigationStack() {
            HStack{
                Text(page.title).font(.system(size: 50)).padding()
                
                Button(action: {
                    isEditing = true
                }) {
                    Image(systemName: "info.circle")
                        .font(.title) // Increase size
                }.padding().frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            
            
            
            List {
                
                ForEach($page.items) { $reminder in
                    ModelView(edit: $isEditing, colorType: $page.color, pageName: $page.title)
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            
            Button(action: {
                page.items.append(Reminder(title: "Enter text", isCompleted: false))
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title) // Increase size
            }.padding().frame(maxWidth: .infinity, alignment: .trailing)

        }.foregroundStyle(page.color)
        .sheet(isPresented: $isEditing) {
            
            EditSheet(selectedColor: $page.color, name:$page.title, editing: $isEditing)
        }
    }
}

#Preview {
    ContentView()
}
