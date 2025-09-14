//
//  ContentView.swift
//  mgcOdev5
//
//  Created by Rabia Yolcu on 14.09.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header with stats
                headerView
                
                // Task input section
                taskInputSection
                
                Divider()
                
                // Task list
                taskListView
                
                Spacer()
                
                // Footer with actions
                footerView
            }
            .navigationTitle("Görevlerim")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    // MARK: - Header View
    private var headerView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Toplam: \(viewModel.tasks.count)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("Aktif: \(viewModel.activeTasksCount)")
                    .font(.caption)
                    .foregroundColor(.blue)
                Text("Tamamlanan: \(viewModel.completedTasksCount)")
                    .font(.caption)
                    .foregroundColor(.green)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(.systemGray6))
    }
    
    // MARK: - Task Input Section
    private var taskInputSection: some View {
        HStack {
            TextField("Yeni görev ekle...", text: $viewModel.newTaskTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onSubmit {
                    viewModel.addTask()
                }
            
            Button(action: {
                viewModel.addTask()
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
            .disabled(viewModel.newTaskTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
        .padding()
    }
    
    // MARK: - Task List View
    private var taskListView: some View {
        List {
            ForEach(viewModel.tasks) { task in
                TaskRowView(task: task, viewModel: viewModel)
            }
            .onDelete(perform: viewModel.deleteTask)
        }
        .listStyle(PlainListStyle())
    }
    
    // MARK: - Footer View
    private var footerView: some View {
        HStack {
            Button("Tümünü Temizle") {
                viewModel.clearAllTasks()
            }
            .foregroundColor(.red)
            .disabled(viewModel.tasks.isEmpty)
            
            Spacer()
            
            Button("Tamamlananları Temizle") {
                viewModel.clearCompletedTasks()
            }
            .foregroundColor(.orange)
            .disabled(viewModel.completedTasksCount == 0)
        }
        .padding()
        .background(Color(.systemGray6))
    }
}

// MARK: - Task Row View
struct TaskRowView: View {
    let task: Task
    let viewModel: TaskViewModel
    
    var body: some View {
        HStack {
            Button(action: {
                viewModel.toggleTaskCompletion(task)
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundColor(task.isCompleted ? .green : .gray)
            }
            .buttonStyle(PlainButtonStyle())
            
            VStack(alignment: .leading, spacing: 2) {
                Text(task.title)
                    .font(.body)
                    .strikethrough(task.isCompleted)
                    .foregroundColor(task.isCompleted ? .secondary : .primary)
                
                Text(task.createdAt, style: .time)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            if task.isCompleted {
                Image(systemName: "checkmark.seal.fill")
                    .font(.caption)
                    .foregroundColor(.green)
            }
        }
        .padding(.vertical, 4)
        .contentShape(Rectangle())
        .onTapGesture {
            viewModel.toggleTaskCompletion(task)
        }
    }
}

#Preview {
    ContentView()
}
