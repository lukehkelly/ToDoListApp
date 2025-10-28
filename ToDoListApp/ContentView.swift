//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Luke Kelly on 10/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    // TODO: Add an @State property to hold a RemindersPage struct
    @State private var page: RemindersPage = RemindersPage( /* fill in */)
    
    var body: some View {
        VStack {
            // TODO: Add header view
            
            List {
                // TODO: Loop through the page's reminders using ForEach
                ForEach(/* reminders */) { $reminder in
                    // TODO: Display each reminder row
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            
            // TODO: Add footer view

        }
        .sheet(isPresented: $isEditing) {
            // TODO: Add remaining binding
            EditSheet(selectedColor: /* page color */)
        }
    }
}
