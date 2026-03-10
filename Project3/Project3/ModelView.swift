//
//  ModelView.swift
//  Project3
//
//  Created by Jeffrey Hu on 3/3/26.
//

import SwiftUI

struct ModelView: View {

    @State private var imageName: String = "circle"
    @State private var name: String = ""
    @State private var opa: Double = 1
    var colorType : Color
    var body: some View {
        HStack(){
            
            Button(action: {
                if(self.imageName == "circle"){
                    self.imageName = "circle.fill"
                    self.opa = 0.5
                }
                else{
                    self.imageName = "circle"
                    self.opa = 1
                }
                
            }) {
                Image(systemName: imageName)
                    .font(.title) // Increase size
            }.padding()
            
            TextField("Note Something", text: $name).font(.system(size: 30))
        }.foregroundStyle(colorType).opacity(opa)
    }
}

#Preview {
    ModelView(colorType: Color.red)
}
