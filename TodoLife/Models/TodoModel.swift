//
//  TodoModel.swift
//  TodoLife
//
//  Created by Sendo Tjiam on 25/08/21.
//

import Foundation

struct TodoModel : Identifiable, Codable {
    let id : String
    let title : String
    let isCompleted : Bool
    
    init(id : String = UUID().uuidString, title : String, isCompleted : Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> TodoModel {
        return TodoModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
