//
//  ReminderDetailView.swift
//  Project3
//
//  Created by Jeffrey Hu on 3/10/26.
//

import SwiftUI

struct ReminderDetailView: View {
    
        @Binding var name: String
        @Binding var desc: String
        @Binding var date: Date
        @Binding var edit: Bool
    @Binding var color: Color
    @Binding var pageName : String

        @State private var isEditing = false

        var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                
                Text(desc).frame(maxWidth: .infinity, maxHeight: 200, alignment: .center).foregroundStyle(Color.black)

                HStack{
                    Text("Title").font(.system(size: 20))
                    TextField("Title", text: $name).font(.system(size: 20)).frame(maxWidth: .infinity)
                }.foregroundStyle(Color.black)
                
                    
                HStack{
                    Text("Description").font(.system(size: 20))
                    TextField("Desc", text: $desc).font(.system(size: 20)).frame(maxWidth: .infinity)
                }.foregroundStyle(Color.black)
                    


                DatePicker("Due Date", selection: $date, displayedComponents: [.date, .hourAndMinute])

                Spacer()
            }
            .padding()

            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        edit = true
                    }) {
                        Image(systemName: "info.circle")
                            .font(.title) // Increase size
                    }.padding().frame(alignment: .trailing)
                }
            }

            .sheet(isPresented: $isEditing) {
                EditSheet(
                    selectedColor: $color, name: $name, editing: $edit
                )
            }

            
            .navigationTitle(name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
#Preview {
    @State var title = "TestTite"
    @State var desc = "TestDesc"
    @State var date = Date();
    @State var color = Color.red
    @State var edit = false
    
    NavigationStack {
        ReminderDetailView(name:$title, desc:$desc, date:$date,  edit: $edit, color: $color, pageName: $title)
    }

}
