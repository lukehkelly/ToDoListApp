//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Luke Kelly on 10/20/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isEditing: Bool = false
    @State private var page: RemindersPage = RemindersPage(id: UUID(), title: "My Reminders", items: [], color: .mint)
    
    var body: some View {
        VStack {
            
            HStack {
                Text(page.title)
                    // change style
                Spacer()
                Button(action : {
                    isEditing.toggle( )
                }) {
                    Text(isEditing ? "Done" : "Edit")
                        // change style
                }
                // pad
            }
            
            List {
                ForEach($page.items) { $reminder in
                    Toggle(isOn: $reminder.isCompleted) {
                        Text(reminder.title)
                    }
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            
            HStack {
                Button(action: {
                    let newReminder: Reminder = Reminder(id: UUID(), title: "New Reminder", isCompleted: false)
                    page.items.append(newReminder)
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            // style
                        Text("New Reminder")
                            // style
                    }
                }
                Spacer()
            }
            // pad
        }
        .sheet(isPresented: $isEditing) {
            
            EditSheet(title: $page.title, selectedColor: $page.color)
        }
    }
}

#Preview {
    ContentView()
}
