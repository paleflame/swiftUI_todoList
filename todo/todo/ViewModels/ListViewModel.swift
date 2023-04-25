//
//  ListViewModel.swift
//  todo
//
//  Created by Danil Vasilenko on 24.04.2023.
//

import Foundation


class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    init(){
        getItems()
    }
    
    func getItems(){    
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let decodedData = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
        self.items = decodedData.sorted {
            return $0.isCompleted == false && $1.isCompleted != false
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String, description: String){
        items.append(ItemModel(title: title,
                               description: description,
                               isCompleted: false))
        getItems()
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateCompletion()
        }
        getItems()
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }

}
