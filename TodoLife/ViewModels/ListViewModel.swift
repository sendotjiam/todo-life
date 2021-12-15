//
//  ListViewModel.swift
//  TodoLife
//
//  Created by Sendo Tjiam on 26/08/21.
//

import Foundation

class ListViewModel : ObservableObject{
    @Published var items : [TodoModel] = [] {
        didSet {
            saveItemsToUserDefault()
        }
    }
    
    let TODO_ITEMS_KEY : String = "TODO_ITEMS_KEY"
    
    init() {
        getItems()
    }
    
    private func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: TODO_ITEMS_KEY),
            let savedItems = try? JSONDecoder().decode([TodoModel].self, from: data)
        else { return }
        items = savedItems
    }
    
    func deleteItem(indexSet : IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from : IndexSet, to : Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title : String) {
        let newItem = TodoModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(_ item : TodoModel) {
        let searchIndex = items.firstIndex { (existingItem) -> Bool in
            return existingItem.id == item.id
        }
        if let index = searchIndex {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItemsToUserDefault() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: TODO_ITEMS_KEY)
        }
    }
}
