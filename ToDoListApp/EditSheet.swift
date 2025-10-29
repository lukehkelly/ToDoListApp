//
//  EditSheet.swift
//  ToDoListApp
//
//  Created by Luke Kelly on 10/28/25.
//

import SwiftUI

struct EditSheet: View {
    
    @Binding var title: String
    @Binding var selectedColor: Color
    
    var body: some View {
        VStack(spacing: 20) {
                
            HStack {
                Image(systemName: "list.bullet.circle.fill")
                    .font(.system(size: 35))
                    
                TextField("Title", text: $title)
                    .font(.system(size: 35))
                    .padding(8)
                    .background(.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
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
    @Previewable @State var title: String = "Edit"
    EditSheet(title: $title, selectedColor: $selectedColor)
        .preferredColorScheme(.light)
}
