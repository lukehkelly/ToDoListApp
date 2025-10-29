//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Luke Kelly on 10/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var currEditingReminderID: UUID? = nil
    @State private var isEditing: Bool = false
    @State private var page: RemindersPage = RemindersPage(id: UUID(), title: "My Reminders", items: [], color: .red)
    
    var body: some View {
        VStack {
            
            HStack {
                Text(page.title)
                    .padding(.leading)
                    .padding(.bottom)
                    .padding(.top)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundStyle(page.color)
                Spacer()
                Button(action : {
                    isEditing.toggle( )
                }) {
                    Image(systemName: "info.circle")
                        .font(.system(size: 25))
                        .padding(.trailing)
                }
                // pad
            }
            
            List {
                ForEach($page.items) { $reminder in
                    if currEditingReminderID == reminder.id {
                        TextField("New Reminder", text: $reminder.title, onCommit: {currEditingReminderID = nil})
                            .font(.system(size: 20))
                    }
                    else {
                        HStack {
                            Button(action: {
                                withAnimation(.easeIn(duration: 0.15)) {
                                    reminder.isCompleted.toggle()
                                }
                            }) {
                                Image(systemName: reminder.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(reminder.isCompleted ? page.color : .gray)
                                    .font(.system(size: 30))
                            }
                            .buttonStyle(.plain)
                            
                            Text(reminder.title)
                                .strikethrough(reminder.isCompleted)
                                .foregroundColor(reminder.isCompleted ? .gray : page.color)
                                .font(.system(size: 20))
                
                            Spacer()
                        }
                    }
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            
            HStack {
                Button(action: {
                    withAnimation(.easeIn(duration: 0.15)) {
                        let newReminder: Reminder = Reminder(id: UUID(), title: "", isCompleted: false)
                        page.items.append(newReminder)
                        currEditingReminderID = newReminder.id
                    }
                }) {
                    HStack {
                        Spacer()
                        Image(systemName: "plus.circle.fill")                            .padding(.trailing)
                            .foregroundStyle(page.color)
                            .font(.system(size: 50))
                    }
                }
                Spacer()
            }

        }
        .sheet(isPresented: $isEditing) {
            
            EditSheet(title: $page.title, selectedColor: $page.color)
        }
    }
}

#Preview {
    ContentView()
}
