//
//  EditSheet.swift
//  Project3
//
//  Created by Jeffrey Hu on 3/3/26.
//
import SwiftUI

struct EditSheet: View {
    // TODO: Add title binding
    @Binding var selectedColor: Color
    @Binding var name: String
    @Binding var editing: Bool
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "list.bullet.circle.fill").font(.system(size: 200))
            
            TextField("List name", text: $name).font(.system(size: 30)).onSubmit{
                editing = false
            }
            
            ColorChooser(selectedColor: $selectedColor)
            
            Spacer()
        }
        .foregroundStyle(selectedColor)
        .padding()
    }
}

#Preview {
    @Previewable @State var selectedColor: Color = .red
    
    @Previewable @State var name: String = "List name"
    @Previewable @State var edit: Bool = true
    
    EditSheet(selectedColor: $selectedColor, name: $name, editing: $edit)
        .preferredColorScheme(.dark)
}
