//
//  TaskViewModel.swift
//  mgcOdev5
//
//  Created by Rabia Yolcu on 14.09.2025.
//

import Foundation
import SwiftUI

// MARK: - TaskViewModel
class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var newTaskTitle: String = ""
    
    // MARK: - Task Operations
    
    /// Yeni görev ekler
    func addTask() {
        guard !newTaskTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return
        }
        
        let newTask = Task(title: newTaskTitle.trimmingCharacters(in: .whitespacesAndNewlines))
        tasks.append(newTask)
        newTaskTitle = ""
    }
    
    /// Görevi siler
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    /// Görevin tamamlanma durumunu değiştirir
    func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    /// Tamamlanan görev sayısını döndürür
    var completedTasksCount: Int {
        tasks.filter { $0.isCompleted }.count
    }
    
    /// Aktif görev sayısını döndürür
    var activeTasksCount: Int {
        tasks.filter { !$0.isCompleted }.count
    }
    
    /// Tüm görevleri siler
    func clearAllTasks() {
        tasks.removeAll()
    }
    
    /// Tamamlanan görevleri siler
    func clearCompletedTasks() {
        tasks.removeAll { $0.isCompleted }
    }
}
